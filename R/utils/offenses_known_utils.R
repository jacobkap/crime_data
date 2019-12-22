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

    data[, paste0(type, "_assault_aggravated")] <-
      data[, paste0(type, "_assault_total")] -
      data[, paste0(type, "_assault_simple")]

    # Some agencies that don't report aggravated assault
    # crimes properly will have very large negative numbers
    # of aggravated assault. This makes all aggravated assault
    # under -25 to become NA.
    data[data[paste0(type, "_assault_aggravated")] < -25 |
           is.na(data[paste0(type, "_assault_aggravated")]),
         paste0(type, "_assault_aggravated")] <- NA
  }
  return(data)
}
make_index_crimes <- function(data) {
  crime_type <- c("actual", "clr_18", "tot_clr", "unfound")
  index_crimes <- c("index_violent", "index_property", "index_total")

  for (type in crime_type) {
    data[, paste0(type, "_index_violent")] <-
      data[, paste0(type, "_murder")] +
      data[, paste0(type, "_rape_total")] +
      data[, paste0(type, "_assault_aggravated")] +
      data[, paste0(type, "_robbery_total")]

    data[, paste0(type, "_index_property")] <-
      data[, paste0(type, "_theft_total")] +
      data[, paste0(type, "_burg_total")] +
      data[, paste0(type, "_mtr_veh_theft_total")]

    data[, paste0(type, "_index_total")] <-
      data[, paste0(type, "_index_violent")] +
      data[, paste0(type, "_index_property")]
  }
  return(data)
}



fix_outliers <- function(data) {

  data$population[data$population > 200000000] <- NA
  # Incorrect ORI
  if (data$year[1] == 1972) {
    data$ori[data$state %in% "virginia" &
               data$population_1 %in% "446963"] <- "VA02901"
  }

  # Incorrect ORI
  data <- data[!data$ori %in% "OKDI001",]

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

fix_number_of_months_reported <- function(data) {
  months_reported_fix <- c("no months reported", tolower(month.name))
  names(months_reported_fix) <- paste0("^", as.character(0:12), "$")


  data$last_month_reported <- str_replace_all(data$number_of_months_reported,
                                              months_reported_fix)

  data$month_missing <- 0
  data$month_missing[data$card_actual_pt %in% "missing" | is.na(data$card_actual_pt)] <- 1

  return(data)
}

get_months_missing_annual <- function(data) {
  number_months_missing <-
    data %>%
    group_by(ori) %>%
    summarize(number_of_months_missing = sum(month_missing))

  data <-
    data %>%
    left_join(number_months_missing, by = "ori") %>%
    select(number_of_months_missing,
           everything())
  return(data)
}

crime_remove_special_characters <- function(col) {
  col <- iconv(col, "UTF-8", "ASCII", sub = "")
  col <- gsub(" conty, ", " county, ", col, ignore.case = TRUE)
  return(col)
}
