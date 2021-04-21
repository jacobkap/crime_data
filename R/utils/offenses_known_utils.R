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
  #index_crimes <- c("index_violent", "index_property", "index_total")

  for (type in crime_type) {
    data[, paste0(type, "_index_violent")] <-
      data[, paste0(type, "_murder")] +
      data[, paste0(type, "_rape_total")] +
      data[, paste0(type, "_assault_aggravated")] +
      data[, paste0(type, "_robbery_total")]

    if (data$year[1] >= 1979) {

    data[, paste0(type, "_index_property")] <-
      data[, paste0(type, "_theft_total")] +
      data[, paste0(type, "_burg_total")] +
      data[, paste0(type, "_mtr_veh_theft_total")] +
      data[, paste0(type, "_arson_grand_total")]
    } else {
      data[, paste0(type, "_index_property")] <-
        data[, paste0(type, "_theft_total")] +
        data[, paste0(type, "_burg_total")] +
        data[, paste0(type, "_mtr_veh_theft_total")]
    }

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


  # Impossibly high number of unfounded crimes in New Orleans in 2018
  # Incorrect ORI
  if (data$year[1] == 2018) {
    data[data$ori %in% "LANPD00", grep("unfound", names(data))] <- NA
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



crime_remove_special_characters <- function(col) {
  col <- iconv(col, "UTF-8", "ASCII", sub = "")
  col <- gsub(" conty, ", " county, ", col, ignore.case = TRUE)
  return(col)
}
