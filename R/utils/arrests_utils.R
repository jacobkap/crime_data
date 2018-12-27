matches_types <- data.frame(matches =
                              c("^(fe)?male|tot_arrest",  # Age by sex
                                "tot_.*[0-9]|tot_arrest", # Totals - age
                                "tot_(fe)?male|tot_juv|tot_adult|tot_arrest", # Totals - sex
                                "black|white|asian|ind|tot_arrest" # Totals - race
                              ),
                            name = c("age_by_sex",
                                     "totals_age",
                                     "totals_sex",
                                     "totals_race"),
                            stringsAsFactors = FALSE)

index_crimes <- c("murder",
                  "rape",
                  "robbery",
                  "agg_assault",
                  "burglary",
                  "theft",
                  "mtr_veh_theft",
                  "arson")


drug_crimes <- c("total_drug",
                 "sale_drug_total",
                 "sale_cannabis",
                 "sale_heroin_coke",
                 "sale_other_drug",
                 "sale_synth_narc",
                 "poss_drug_total",
                 "poss_cannabis",
                 "poss_heroin_coke",
                 "poss_other_drug",
                 "poss_synth_narc")

alcohol_or_property_crimes <- c("forgery",
                                "fraud",
                                "stolen_prop",
                                "dui",
                                "liquor",
                                "drunkenness")

financial_crimes <- c("embezzlement",
                      "gamble_total",
                      "gamble_other",
                      "gamble_bookmaker",
                      "gamble_lottery")


sex_or_family_crimes <- c("prostitution",
                          "oth_sex_off",
                          "rape",
                          "family_off")

violent_crimes <- c("murder",
                    "robbery",
                    "agg_assault",
                    "oth_assault",
                    "weapons",
                    "manslaught_neg")

other_crimes <- c("vandalism",
                  "disorder_cond",
                  "all_other",
                  "curfew_loiter",
                  "vagrancy",
                  "runaways",
                  "suspicion")

all_crimes <- unique(c(index_crimes,
                       financial_crimes,
                       alcohol_or_property_crimes,
                       violent_crimes,
                       sex_or_family_crimes,
                       drug_crimes,
                       other_crimes))

combined_crimes <- list(index_crimes,
                        financial_crimes,
                        alcohol_or_property_crimes,
                        violent_crimes,
                        sex_or_family_crimes,
                        drug_crimes,
                        other_crimes,
                        all_crimes)
names(combined_crimes) <- c("index_crimes",
                            "financial_crimes",
                            "alcohol_or_property_crimes",
                            "violent_crimes",
                            "sex_or_family_crimes",
                            "drug_crimes",
                            "other_crimes",
                            "all_crimes")

arrest_cols <- c("adult_amer_ind",
                 "adult_asian",
                 "adult_black",
                 "adult_white",
                 "juv_amer_ind",
                 "juv_asian",
                 "juv_black",
                 "juv_white",
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
    asciiSetupReader::read_ascii_setup(file,
                                       paste0("arrests_agency_header_",
                                              sps_years,
                                              ".sps")) %>%
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
                  -covered_by,
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
    asciiSetupReader::read_ascii_setup(file,
                                       paste0("arrests_monthly_header_",
                                              sps_years,
                                              ".sps")) %>%
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
    asciiSetupReader::read_ascii_setup(file,
                                       paste0("arrests_detail_header_",
                                              sps_years,
                                              ".sps"),
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
    # dplyr::mutate(year = fix_years(year)) %>%
    dplyr::mutate_at(vars(contains("arrest_counter")), fix_negatives)

  detail_header <- make_arrest_category_cols(detail_header, arrest_columns)

  if (sps_years == "1974_1979") {
    detail_header <-
      detail_header %>%
      dplyr::mutate(adult_asian     = adult_chinese    + adult_japanese,
                    juv_asian       = juv_chinese      + juv_japanese,
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
  # Combine a few age columns
  detail_header <-
    detail_header %>%
    dplyr::mutate(female_40_49    = female_40_44    + female_45_49,
                  male_40_49      = male_40_44      + male_45_49,
                  female_over_49  = female_50_54    + female_55_59 + female_60_64 + female_over_64,
                  male_over_49    = male_50_54      + male_55_59   + male_60_64   + male_over_64,
                  female_under_15 = female_under_10 + female_10_12 + female_13_14,
                  male_under_15   = male_under_10   + male_10_12   + male_13_14) %>%
    dplyr::select(-female_under_10,
                  -female_10_12,
                  -female_13_14,
                  -female_40_44,
                  -female_45_49,
                  -female_50_54,
                  -female_55_59,
                  -female_60_64,
                  -female_over_64,
                  -male_under_10,
                  -male_10_12,
                  -male_13_14,
                  -male_40_44,
                  -male_45_49,
                  -male_50_54,
                  -male_55_59,
                  -male_60_64,
                  -male_over_64)

  detail_header <- make_simple_columns(detail_header)


  detail_header <-
    detail_header %>%
    dplyr::distinct(.keep_all = TRUE)

  gc()
  return(detail_header)
}

get_number_months_reported <- function(data) {
  number_months_reported <-
    data %>%
    dplyr::mutate(temp = paste(ori,
                               month)) %>%
    dplyr::distinct(temp, .keep_all = TRUE) %>%
    dplyr::select(ori, month) %>%
    dplyr::mutate(dummy = 1)
  number_months_reported$dummy[is.na(number_months_reported$month)] <- 0

  data <-
    number_months_reported %>%
    dplyr::group_by(ori) %>%
    dplyr::summarize(number_of_months_reported = sum(dummy)) %>%
    dplyr::right_join(data)
  gc()
  return(data)
}

make_simple_columns <- function(data) {

  data$tot_male_juv     <- rowSums(data[, grep("^male_(.*15|16|17|juv)",
                                               names(data))])
  data$tot_male_adult   <- rowSums(data[, grep("^male_(18|19|[2-6].|over|adult)",
                                               names(data))])
  data$tot_female_juv   <- rowSums(data[, grep("^female_(.*15|16|17|juv)",
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
    data.table::melt(id.vars = id_vars,
                     measure.vars = measure_cols) %>%
    unite(temp, offense_code, variable) %>%
    spread(temp, value)
  names(data) <- gsub("heroin_coke_tot_female_adult",
                      "heroin_coke_tot_female_adul",
                      names(data))
  gc()
  return(data)
}
