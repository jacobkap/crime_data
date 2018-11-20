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
  crime_type <- c("actual", "clr_18", "tot_clr", "unfound")

  for (type in crime_type) {

    # For some reason the total assault variable during
    # 1964-1973 does NOT include simple assault but
    # in other years it does. So this fixes that.
    if (data$year[1] %in% 1964:1973) {
      data[, paste0( type, "_assault_total")] <-
        data[, paste0(type, "_assault_total")] +
        data[, paste0(type, "_assault_simple")]
    }

    data[, paste0(type, "_aggravated_assault")] <-
      data[, paste0(type, "_assault_total")] -
      data[, paste0(type, "_assault_simple")]

    # Some agencies that don't report aggravated assault
    # crimes properly will have very large negative numbers
    # of aggravated assault. This makes all aggravated assault
    # under -25 to become NA.
    data[data[paste0(type, "_aggravated_assault")] < -25,
         paste0(type, "_aggravated_assault")] <- NA
  }
  return(data)
}




fix_outliers <- function(data) {
  # Incorrect ORI
  if (data$year[1] == 1972) {
    data$ori[data$state %in% "virginia" &
               data$population_1 %in% "446963"] <- "VA02901"
  }

  # Impossible numbers of officers killed.
  if (data$year[1] == 1974) {
    data$nov_officers_killed_by_accident[data$ori %in% "MA01301"] <- NA
  }
  if (data$year[1] == 1978) {
    data$mar_officers_killed_by_accident[data$ori %in% "PAPPD00"] <- NA
    data$apr_officers_killed_by_accident[data$ori %in% "NY06240"] <- NA
    data$jun_officers_killed_by_accident[data$ori %in% "NY06240"] <- NA
    data$may_officers_killed_by_accident[data$ori %in% "NY04040"] <- NA

    data$apr_officers_killed_by_felony[data$ori %in% "NY06240"] <- NA
    data$jun_officers_killed_by_felony[data$ori %in% "NY06240"] <- NA
    data$may_officers_killed_by_felony[data$ori %in% "NY04040"] <- NA
  }
  if (data$year[1] == 1996) {
    data$sep_officers_killed_by_felony[data$ori %in% "LA03102"] <- NA
  }
  if (data$year[1] == 1997) {
    data$mar_officers_killed_by_felony[data$ori %in% "MO0950E"] <- NA
  }
  if (data$year[1] %in% 2014:2016) {
    data[data$ori %in% "LANPD00", grep("unfound_", names(data))] <- NA
  }
  return(data)
}


