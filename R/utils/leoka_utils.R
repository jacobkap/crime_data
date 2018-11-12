make_number_of_months_reporting <- function(data) {
  month_indicators <- grep("month_indicator", names(data), value = TRUE)

  data$number_of_months_reported <- 0

  # Months that are 'reported, no data' are considered to be non-reports!!!!!!
  for (col in month_indicators) {
    adder <- rep(0, nrow(data))
    adder[data[, col] %in% c("normal update", "reported, no data")] <- 1
    data$number_of_months_reported <- data$number_of_months_reported + adder

  }
  return(data)
}

reorder_leoka_columns <- function(data, crosswalk, type = "month") {
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
                  number_of_months_reported,
                  crosswalk_cols,
                  time_cols,
                  population,
                  population_group,
                  country_division,
                  msa,
                  report_indicator,
                  record_indicator,
                  month_indicator,
                  covered_by,
                  shift_data,
                  no_male_female_breakdown,
                  assault_injury_indicator,
                  assault_no_injury_indicator,
                  ends_with("officers"),
                  ends_with("civilians"),
                  ends_with("employees_total"),
                  total_civilians,
                  total_officers,
                  total_employees,
                  officers_killed_by_felony,
                  officers_killed_by_accident,
                  starts_with("assaults_with_injury"),
                  starts_with("assaults_without_injury"),
                  starts_with("ambush"),
                  starts_with("oth_arr"),
                  starts_with("burglary"),
                  starts_with("derang"),
                  starts_with("disturban"),
                  starts_with("prisoner"),
                  starts_with("riot"),
                  starts_with("robbery"),
                  starts_with("susp"),
                  starts_with("traffic"),
                  starts_with("all_other"),
                  total_names,
                  starts_with("time"),
                  ends_with("shift"),
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
