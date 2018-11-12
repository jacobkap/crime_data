negatives <- c("0+\\}"                = "0",
               "0+j"                  = "-1",
               "0+k"                  = "-2",
               "0+l"                  = "-3",
               "0+m"                  = "-4",
               "0+n"                  = "-5",
               "0+o"                  = "-6",
               "0+p"                  = "-7",
               "0+q"                  = "-8",
               "0+r"                  = "-9",
               "0+1\\}"               = "-10",
               "0+1j"                 = "-11",
               "0+1k"                 = "-12",
               "0+1l"                 = "-13",
               "0+1m"                 = "-14",
               "0+1n"                 = "-15",
               "zero or not reported" = "0")

fix_negatives <- function(column) {
  column <- tolower(column)
  column <- stringr::str_replace_all(column, negatives)
  column <- readr::parse_number(column)
  return(column)
}

reorder_return_a_columns <- function(data, crosswalk, type = "month") {
  time_cols <- c("year",
                 "month",
                 "date")

  if (type == "year") {
    time_cols <- "year"
  }
  crosswalk_cols <- names(crosswalk)

  # Reorder columns
  # Also merge with crosswalk data
  data <-
    data %>%
    dplyr::select(ori,
                  agency_name,
                  state,
                  year,
                  month,
                  date,
                  number_of_months_reported,
                  crosswalk_cols,
                  population,
                  population_group,
                  country_division,
                  juvenile_age,
                  core_city_indication,
                  covered_by_ori,
                  covered_by_population_group,
                  last_update,
                  fbi_field_office,
                  agency_count,
                  followup_indication,
                  zip_code,
                  starts_with("officers"),
                  starts_with("actual"),
                  starts_with("tot_clr"),
                  starts_with("clr_18"),
                  starts_with("unfound"),
                  everything())

  if (type == "month") {
    data <-
      data %>%
      dplyr::mutate(month = factor(month,
                                   levels = tolower(month.name))) %>%
      dplyr::arrange(ori,
                     month) %>%
      dplyr::mutate(month = as.character(month))
  }

  return(data)
}

make_agg_assault <- function(data) {
  crime_type <- c("_ACT", "_CLR_18", "_CLR", "_UNFOUND")
  months <- toupper(month.abb)
  for (month in months) {
    for (type in crime_type) {

      total_assault  <- data[, paste0(month, type, "_ASSAULT_TOTAL")]
      simple_assault <- data[, paste0(month, type, "_SIMPLE_ASSAULT")]


      if (data$YEAR[1] %in% 1964:1973) {
        total_assault <- total_assault + simple_assault
        data[, paste0(month, type, "_ASSAULT_TOTAL")] <- total_assault
      }

      agg_value <- total_assault - simple_assault
      agg_value[agg_value < -25] <- 0
      data[, paste0(month, type, "_aggravated_assault")] <- agg_value
    }
  }
  return(data)
}




fix_outliers <- function(data) {
  if (data$year[1] == 1972) {
    data$ORI[data$NUMERIC_STATE_CODE == "virginia" &
               data$POPULATION_1 == "446963"] <- "VA02901"
  }
  if (data$year[1] == 1974) {
    data$NOV_OFFICERS_KILLED_BY_ACCIDENT[data$ORI == "MA01301"] <- NA
  }
  if (data$year[1] == 1978) {
    data$MAR_OFFICERS_KILLED_BY_ACCIDENT[data$ORI == "PAPPD00"] <- NA

    data$APR_OFFICERS_KILLED_BY_FELONY[data$ORI == "NY06240"] <- NA
    data$JUN_OFFICERS_KILLED_BY_FELONY[data$ORI == "NY06240"] <- NA
    data$APR_OFFICERS_KILLED_BY_ACCIDENT[data$ORI == "NY06240"] <- NA
    data$JUN_OFFICERS_KILLED_BY_ACCIDENT[data$ORI == "NY06240"] <- NA

    data$MAY_OFFICERS_KILLED_BY_ACCIDENT[data$ORI == "NY04040"] <- NA
    data$MAY_OFFICERS_KILLED_BY_FELONY[data$ORI == "NY04040"] <- NA
  }
  if (data$year[1] == 1996) {
    data$SEP_OFFICERS_KILLED_BY_FELONY[data$ORI == "LA03102"] <- NA
  }
  if (data$year[1] == 1997) {
    data$MAR_OFFICERS_KILLED_BY_FELONY[data$ORI == "MO0950E"] <- NA
  }
  if (data$year[1] %in% 2014:2016) {
    data[data$ORI == "LANPD00", grep("UNFOUND_", names(data))] <- NA
  }
  return(data)
}


