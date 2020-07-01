make_number_of_months_reporting <- function(data) {
  month_indicators <- grep("month_indicator", names(data), value = TRUE)

  data$number_of_months_reported <- 0

  # Years 1960-1971 all have jan_month_indicator as 'not reported'
  # which seems incorrect. I am setting the number_of_months_reported
  # for these years to 1 to fix this issue. All months other than
  # January seem normal.
  if (fix_years(data$year)[1] %in% 1960:1971) {
    data$number_of_months_reported <- 1
  }
  #
  #
  # Months that are 'reported, no data' are considered to be non-reports!!!!!!
  for (col in month_indicators) {
    adder <- rep(0, nrow(data))
    adder[data[, col] %in% c("normal update", "reported, no data")] <- 1
    data$number_of_months_reported <- data$number_of_months_reported + adder

    # The record description says all years before 1971 have no
    # month indicator info but that's not true in the data.
    # if (data$year[1] < 1971) {
    #   data$number_of_months_reported <- NA
    # }

  }

  # If year 1960-1971 and only month is one I added, turn it to 0
  if (fix_years(data$year)[1] %in% 1960:1971) {
    data$number_of_months_reported[data$number_of_months_reported == 1] <- 0
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
                  state_abb,
                  number_of_months_reported,
                  time_cols,
                  crosswalk_cols,
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
                  total_employees_officers,
                  ends_with("civilians"),
                  total_employees_civilians,
                  ends_with("employees_total"),
                  total_employees_total,
                  officers_killed_total,
                  officers_killed_by_felony,
                  officers_killed_by_accident,
                  starts_with("assaults_with_injury"),
                  starts_with("assaults_no_injury"),
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


fix_outliers <- function(data) {
  if (data$year[1] == 1977) {
    data$oct_officers_killed_by_accident[data$ori %in% "KS08703"] <- NA
  }
  if (data$year[1] == 1978) {
    data$jul_officers_killed_by_accident[data$ori %in% "PAPPD00"] <- NA
  }
  if (data$year[1] == 1979) {
    data$aug_officers_killed_by_felony[data$ori %in% "NJ01210"] <- NA
  }
  if (data$year[1] == 1979) {
    data$dec_officers_killed_by_felony[data$ori %in% "WASPD00"] <- NA
  }
  if (data$year[1] == 1980) {
    data$aug_officers_killed_by_felony[data$ori %in% "LA02600"] <- NA
  }
  if (data$year[1] == 1982) {
    data$nov_officers_killed_by_felony[data$ori %in% "CA03801"] <- NA
  }
  if (data$year[1] == 1990) {
    data$mar_officers_killed_by_accident[data$ori %in% "ME010SP"] <- NA
  }
  if (data$year[1] == 1996) {
    data$sep_officers_killed_by_felony[data$ori %in% "LA03102"] <- NA
  }
  if (data$year[1] == 1997) {
    data$mar_officers_killed_by_felony[data$ori %in% "MO0950E"] <- NA
  }
  if (data$year[1] == 2011) {
    data[data$ori %in% "OR02405", grep("employee", names(data))] <- NA
  }
  if (data$year[1] == 2014) {
    data <- data[!data$ori %in% "NDDI019", ]
  }
  if (data$year[1] == 2017) {
    data$jan_officers_killed_by_accident[data$ori %in% "IN08200"] <- NA

  }

  # This agency has wrong state and is only there for first 5 years.
  data <- data[!data$ori %in% "OKDI001", ]


  return(data)
}

