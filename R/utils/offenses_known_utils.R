make_agg_assault <- function(data) {
  crime_type <- c("actual", "cleared_18", "total_cleared", "unfounded")

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
  crime_type <- c("actual", "cleared_18", "total_cleared", "unfounded")

  for (type in crime_type) {
    data[, paste0(type, "_index_violent")] <-
      data[, paste0(type, "_murder")] +
      data[, paste0(type, "_manslaughter")] +
      data[, paste0(type, "_rape_total")] +
      data[, paste0(type, "_assault_aggravated")] +
      data[, paste0(type, "_robbery_total")]

      data[, paste0(type, "_index_property")] <-
        data[, paste0(type, "_theft_total")] +
        data[, paste0(type, "_burglary_total")] +
        data[, paste0(type, "_motor_vehicle_theft_total")]


    data[, paste0(type, "_index_total")] <-
      data[, paste0(type, "_index_violent")] +
      data[, paste0(type, "_index_property")]
  }
  return(data)
}

crime_remove_special_characters <- function(col) {
  col <- iconv(col, "UTF-8", "ASCII", sub = "")
  col <- gsub(" conty, ", " county, ", col, ignore.case = TRUE)
  return(col)
}
