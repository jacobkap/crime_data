na_to_0 <- function(x) {
  x[is.na(x)] <- 0
  return(x)
}

make_arrest_category_cols <- function(data, arrest_cols) {
  arrest_code_cols <- grep("arrest_code", names(data), value = TRUE)
  arrest_code_cols <- readr::parse_number(arrest_code_cols)

  # Fix issue in 2017-2018 with extremely high values when code was "000"
  for (i in 1:56) {
    data$code_temp <- data[, paste0("arrest_code_", i)]
    data$counter_temp <- data[, paste0("arrest_counter_", i)]

    data$counter_temp[grep("^[0-9]+$", data$code_temp)] <- 0
    data$counter_temp[data$counter_temp  >= 10000] <- 0
    data$counter_temp[data$counter_temp %in% seq(200, 1200, by = 10) &
                        data$offense_code %in% c("drug_total_drug",
                                                 "drug_possess_drug_total",
                                                 "drug_possess_opium_and_cocaine_and_derivatives_including_heroin",
                                                 "drug_possess_marijuana",
                                                 "drug_possess_synthetic_narcotics",
                                                 "drug_possess_other_drug",
                                                 "drug_sale_drug_total",
                                                 "drug_sale_opium_and_cocaine_and_derivatives_including_heroin",
                                                 "drug_sale_marijuana",
                                                 "drug_sale_synthetic_narcotics",
                                                 "drug_sale_other_drug")] <- 0
    data[, paste0("arrest_code_", i)] <- data$code_temp
    data[, paste0("arrest_counter_", i)] <- data$counter_temp

    data$code_temp <- NULL
    data$counter_temp <- NULL
  }


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
                     (paste0("setup_files/arrests_agency_header_",
                                  sps_years,  ".sps"))) %>%
    dplyr::filter(agency_header_designation %in% "agency header",
                  !is.na(ori)) %>%
    dplyr::select(-state_name,
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
                     (paste0("setup_files/arrests_monthly_header_",
                                  sps_years,  ".sps"))) %>%
    dplyr::filter(monthly_header_designation %in% "monthly header",
                  !is.na(ori)) %>%
    dplyr::select(-identifier_code,
                  -state,
                  -year) %>%
    dplyr::mutate_at(vars(matches("referred|handled")), fix_negatives) %>%
    filter(month %in% tolower(month.name))

  monthly_header$zero_data_indicator_binary <- 0
  monthly_header$zero_data_indicator_binary[monthly_header$zero_data_indicator %in% "not used"] <- 1

  zero_data_measure <-
    monthly_header %>%
    distinct(ori,
             month,
             .keep_all = TRUE) %>%
    group_by(ori) %>%
    summarize(zero_data_months = sum(zero_data_indicator_binary)) %>%
    ungroup()

  monthly_header <-
    monthly_header %>%
    left_join(zero_data_measure, by = "ori")

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
                     (paste0("setup_files/arrests_detail_header_",
                                  sps_years,  ".sps")),
                     coerce_numeric = FALSE) %>%
    filter(month %in% tolower(month.name)) %>%
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
                    juvenile_asian  = juv_chinese + juv_japanese,
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

  data$total_male_juvenile     <- rowSums(data[, grep("^male_(.*15|16|17|13|12|10|juv)",
                                                      names(data))])
  data$total_male_adult   <- rowSums(data[, grep("^male_(18|19|[2-6].|over|adult)",
                                                 names(data))])
  data$total_female_juvenile   <- rowSums(data[, grep("^female_(.*15|16|17|13|12|10|juv)",
                                                      names(data))])
  data$total_female_adult <- rowSums(data[, grep("^female_(18|19|[2-6].|over|adult)",
                                                 names(data))])
  data$total_male         <- data$total_male_juvenile     + data$total_male_adult
  data$total_female       <- data$total_female_juvenile   + data$total_female_adult
  data$total_juvenile     <- data$total_female_juvenile   + data$total_male_juvenile
  data$total_adult        <- data$total_female_adult + data$total_male_adult
  data$total_arrests      <- data$total_adult        + data$total_juvenile


  data$total_american_indian <- rowSums(data[, grep("american_indian", names(data))])
  data$total_asian    <- rowSums(data[, grep("asian", names(data))])
  data$total_black    <- rowSums(data[, grep("black", names(data))])
  data$total_white    <- rowSums(data[, grep("white", names(data))])
  data$total_hispanic <- rowSums(data[, grep("[^(non)]_hispanic", names(data))])
  data$total_non_hispanic <- rowSums(data[, grep("non_hispanic", names(data))])

  data <-
    data %>%
    dplyr::select(-matches("unknown"))

  # Make total age columns
  age_cols <- grep("^male", names(data), value = TRUE)
  for (age_col in age_cols) {

    new_col_age_name <- gsub("male_", "", age_col)
    data[, paste0("total_", new_col_age_name)] <- rowSums(data[, grep(age_col,
                                                                    names(data))])

  }
  gc()
  return(data)
}




arrest_cols <- c("adult_american_indian",
                 "adult_asian",
                 "adult_black",
                 "adult_white",
                 "adult_hispanic",
                 "adult_non_hispanic",
                 "juvenile_american_indian",
                 "juvenile_asian",
                 "juvenile_black",
                 "juvenile_white",
                 "juvenile_hispanic",
                 "juvenile_non_hispanic",
                 "female_under_10",
                 "female_10_12",
                 "female_13_14",
                 "female_15",
                 "female_16",
                 "female_17",
                 "female_18",
                 "female_19",
                 "female_20",
                 "female_21",
                 "female_22",
                 "female_23",
                 "female_24",
                 "female_25_29",
                 "female_30_34",
                 "female_35_39",
                 "female_40_44",
                 "female_45_49",
                 "female_50_54",
                 "female_55_59",
                 "female_60_64",
                 "female_over_64",
                 "male_under_10",
                 "male_10_12",
                 "male_13_14",
                 "male_15",
                 "male_16",
                 "male_17",
                 "male_18",
                 "male_19",
                 "male_20",
                 "male_21",
                 "male_22",
                 "male_23",
                 "male_24",
                 "male_25_29",
                 "male_30_34",
                 "male_35_39",
                 "male_40_44",
                 "male_45_49",
                 "male_50_54",
                 "male_55_59",
                 "male_60_64",
                 "male_over_64")

arrest_cols_1974 <- c(arrest_cols,
                      "male_under_11",
                      "female_under_11",
                      "male_11_12",
                      "female_11_12",
                      "adult_chinese",
                      "adult_japanese",
                      "juv_chinese",
                      "juv_japanese",
                      "female_adult_unknown_age",
                      "female_juvenile_unknown_age",
                      "male_adult_unknown_age",
                      "male_juvenile_unknown_age")