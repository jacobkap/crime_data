na_to_0 <- function(x) {
  x[is.na(x)] <- 0
  return(x)
}

make_arrest_category_cols <- function(data, arrest_cols) {
  arrest_code_cols <- grep("arrest_code", names(data), value = TRUE)
  arrest_code_cols <- readr::parse_number(arrest_code_cols)
  for (col in arrest_cols) {
    #  message(col)
    data[, col] <- 0
    for (i in arrest_code_cols) {
      data[, col][data[, paste0("arrest_code_", i)] %in% col] <-
        data[, col][data[, paste0("arrest_code_", i)] %in% col] +
        data[, paste0("arrest_counter_", i)][data[, paste0("arrest_code_", i)] %in% col]
    }
  }

  data <-
    data %>%
    dplyr::select(-contains("arrest"))
  return(data)
}

# Agency Header code
get_agency_header <- function(file, sps_years) {
  agency_header <-
    read_ascii_setup(file,
                     here::here(paste0("setup_files/arrests_agency_header_",
                                       sps_years,  ".sps"))) %>%
    dplyr::filter(agency_header_designation %in% "agency header",
                  !is.na(ori)) %>%
    dplyr::select(-state_name,
                  -identifier_code,
                  -agency_header_designation,
                  -sequence_number,
                  -suburban,
                  -msa,
                  -county,
                  -core_city,
                  -matches("agency_count")) %>%
    dplyr::mutate(year       = fix_years(year),
                  state_abb  = make_state_abb(state),
                  population = as.numeric(population))
  gc()
  return(agency_header)
}


# Monthly Header code
get_monthly_header <- function(file, sps_years) {
  monthly_header <-
    read_ascii_setup(file,
                     here::here(paste0("setup_files/arrests_monthly_header_",
                                       sps_years,  ".sps"))) %>%
    dplyr::filter(monthly_header_designation %in% "monthly header",
                  !is.na(ori)) %>%
    dplyr::select(-identifier_code,
                  -monthly_header_designation,
                  -population_group,
                  -country_division,
                  -state,
                  -breakdown_indicator,
                  -zero_data_indicator,
                  -juv_and_adult_indicators,
                  -age_race_ethnicity_indicator,
                  -juv_disposition_indicator,
                  -year,
                  -date_of_last_update,
                  -date_of_1st_previous_update,
                  -date_of_2nd_previous_update) %>%
    dplyr::mutate_at(vars(matches("referred|handled")), fix_negatives)
  gc()
  return(monthly_header)
}

# Detail Header code
get_detail_header <- function(file, sps_years) {
  if (sps_years == "1974_1979") {
    arrest_columns <- arrest_cols_1974
  } else {
    arrest_columns <- arrest_cols
  }

  detail_header <-
    read_ascii_setup(file,
                     here::here(paste0("setup_files/arrests_detail_header_",
                                       sps_years,  ".sps")),
                     coerce_numeric = FALSE) %>%
    dplyr::filter(!month %in% "00",
                  !offense_code %in% "monthly header",
                  !is.na(ori)) %>%
    dplyr::select(-identifier_code,
                  -occurrences,
                  -population_group,
                  -country_division,
                  -state,
                  -year) %>%
    dplyr::mutate_at(vars(contains("arrest_counter")), fix_negatives)

  detail_header <- make_arrest_category_cols(detail_header, arrest_columns)

  if (sps_years == "1974_1979") {
    detail_header <-
      detail_header %>%
      dplyr::mutate(adult_asian     = adult_chinese + adult_japanese,
                    juv_asian       = juv_chinese + juv_japanese,
                    female_under_10 = female_under_11,
                    male_under_10   = male_under_11,
                    female_10_12    = female_11_12,
                    male_10_12      = male_11_12) %>%
      dplyr::select(-adult_chinese,
                    -adult_japanese,
                    -juv_chinese,
                    -juv_japanese,
                    -male_under_11,
                    -female_under_11,
                    -male_11_12,
                    -female_11_12)

  }

  detail_header <- make_simple_columns(detail_header)


  detail_header <-
    detail_header %>%
    dplyr::distinct(.keep_all = TRUE)

  gc()
  return(detail_header)
}

get_number_months_reported <- function(data, monthly_header_data) {


  total_months_reported <-
    data %>%
    filter(!is.na(offense_code)) %>%
    mutate(temp = paste(ori, month)) %>%
    distinct(temp, .keep_all = TRUE) %>%
    select(ori, month, offense_code) %>%
    mutate(dummy = 1) %>%
    group_by(ori) %>%
    summarize(number_of_months_reported = sum(dummy))


  data <-
    data %>%
    filter(!is.na(offense_code)) %>%
    mutate(temp = paste(ori, month, offense_code)) %>%
    distinct(temp, .keep_all = TRUE) %>%
    select(ori, month, offense_code) %>%
    mutate(dummy = 1)
  data$dummy[is.na(data$month)] <- 0

  data <-
    data %>%
    group_by(ori,
             offense_code) %>%
    summarize(number_of_months_reported = sum(dummy)) %>%
    ungroup()

  data <- reshape2::dcast(data, ori ~ offense_code,
                          value.var = "number_of_months_reported")
  data[is.na(data)] <- 0
  names(data)[2:ncol(data)] <-
    paste0("num_months_", names(data)[2:ncol(data)])

  data <- left_join(data, total_months_reported, by = "ori")
  # Gets largest value of offenses monthly reporting columns
  data <-
    data %>%
    select(ori,
           number_of_months_reported,
           everything())
  gc()
  return(data)
}

make_simple_columns <- function(data) {

  data$tot_male_juv     <- rowSums(data[, grep("^male_(.*15|16|17|13|12|10|juv)",
                                               names(data))])
  data$tot_male_adult   <- rowSums(data[, grep("^male_(18|19|[2-6].|over|adult)",
                                               names(data))])
  data$tot_female_juv   <- rowSums(data[, grep("^female_(.*15|16|17|13|12|10|juv)",
                                               names(data))])
  data$tot_female_adult <- rowSums(data[, grep("^female_(18|19|[2-6].|over|adult)",
                                               names(data))])
  data$tot_male         <- data$tot_male_juv     + data$tot_male_adult
  data$tot_female       <- data$tot_female_juv   + data$tot_female_adult
  data$tot_juv          <- data$tot_female_juv   + data$tot_male_juv
  data$tot_adult        <- data$tot_female_adult + data$tot_male_adult
  data$tot_arrests      <- data$tot_adult        + data$tot_juv


  data$tot_amer_ind <- rowSums(data[, grep("amer_ind", names(data))])
  data$tot_asian    <- rowSums(data[, grep("asian", names(data))])
  data$tot_black    <- rowSums(data[, grep("black", names(data))])
  data$tot_white    <- rowSums(data[, grep("white", names(data))])
  data$tot_hispanic <- rowSums(data[, grep("hispanic", names(data))])
  data$tot_non_hisp <- rowSums(data[, grep("non_hisp", names(data))])

  data <-
    data %>%
    dplyr::select(-matches("unknown"))

  # Make total age columns
  age_cols <- grep("^male", names(data), value = TRUE)
  for (age_col in age_cols) {

    new_col_age_name <- gsub("male_", "", age_col)
    data[, paste0("tot_", new_col_age_name)] <- rowSums(data[, grep(age_col,
                                                                    names(data))])

  }
  gc()
  return(data)
}

make_long_to_wide <- function(data, type) {
  measure_cols <- grep("male|tot|adult|juv", names(data), value = TRUE)
  id_vars <- c("offense_code", "ori", "month")
  if (type == "yearly") {
    id_vars <- c("offense_code", "ori")
  }
  data <-
    data %>%
    reshape2::melt(id.vars = id_vars,
                   measure.vars = measure_cols) %>%
    unite(temp, offense_code, variable) %>%
    spread(temp, value)
  long_name_fix <- c("^gamble_bookmake_tot_female_adult$"  = "gamble_bookmake_tot_female_adul",
                     "^poss_drug_total_tot_female_adult$"  = "poss_drug_total_tot_female_adul",
                     "^poss_heroin_coke_female_under_10$"  = "poss_heroin_coke_female_under10",
                     "^poss_heroin_coke_tot_female_adult$" = "poss_heroin_coke_tot_female_adu",
                     "^poss_other_drug_tot_female_adult$"  = "poss_other_drug_tot_female_adul",
                     "^poss_synth_narc_tot_female_adult$"  = "poss_synth_narc_tot_female_adul",
                     "^sale_drug_total_tot_female_adult$"  = "sale_drug_total_tot_female_adul",
                     "^sale_heroin_coke_female_under_10$"  = "sale_heroin_coke_female_under10",
                     "^sale_heroin_coke_tot_female_adult$" = "sale_heroin_coke_tot_female_adu",
                     "^sale_other_drug_tot_female_adult$"  = "sale_other_drug_tot_female_adul",
                     "^sale_synth_narc_tot_female_adult$"  = "sale_synth_narc_tot_female_adul")

  names(data) <- stringr::str_replace_all(names(data), long_name_fix)


  gc()
  return(data)
}
