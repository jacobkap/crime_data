library(groundhog)
packages <- c(
  "memisc",
  "tidyverse",
  "asciiSetupReader",
  "haven",
  "lubridate",
  "data.table",
  "dplyr",
  "haven",
  "zip",
  "reticulate",
  "stringi"
)
groundhog.library(packages, "2025-01-15")


save_files <- function(data,
                       year,
                       file_name,
                       save_name,
                       rds_only = TRUE) {

  data <-
    data %>%
    dplyr::mutate_if(is.Date, as.character)
  data <- ungroup(data)
  data <- as.data.frame(data)


  saveRDS(data, file =  paste0(save_name, year, ".rds"))
  if (!rds_only) {
    write_dta(data, path = paste0(save_name, year, ".dta"))
  }
}


fix_number_of_months_reported <- function(data, type = "offenses") {
  column <- "card_actual_pt"
  if (type %in%  "arson") {
    column <- "column_2_type"
  }
  if (all(type %in% "offenses" & unique(data$year) >= 2018)) {
    column <- "card_actual_type"
  }
  months_reported_fix <- c("no months reported", tolower(month.name))
  names(months_reported_fix) <- paste0("^", as.character(0:12), "$")


  data$last_month_reported <- str_replace_all(data$number_of_months_reported,
                                              months_reported_fix)

  data$month_missing <- 0
  # In arson data, 4 == 'not available', 0 = 'not updated'
  data$month_missing[data[, column] %in% c("missing", 0, 4) | is.na(data[, column])] <- 1

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

remove_special_characters <- function(col) {
  col[!col %in% c("assaults not reported",
                  "assaults reported but no breakdowns",
                  "information complete",
                  "breakdown offenses",
                  "missing",
                  "totals only",
                  "adjustment",
                  "normal return",
                  "not updated")] <- NA
  return(col)
}

reorder_columns <- function(data, crosswalk, type = "month") {
  time_cols <- c("year",
                 "month",
                 "date")

  if (type == "year") {
    time_cols <- "year"
  }
  crosswalk_cols <- names(crosswalk)
  offenses_known_unique_cols <- c("juvenile_age",
                                  "core_city_indication",
                                  "last_update",
                                  "fbi_field_office",
                                  "followup_indication",
                                  "zip_code",
                                  "date_of_last_update",
                                  "month_included_in")
  population_cols <- grep("population", names(data), value = TRUE)

  months_reported_cols <- grep("number_of_months_reported|missing|last_month_reported|month_reported_indicator",
                               names(data), value = TRUE)

  # Reorder columns
  data <-
    data %>%
    dplyr::select(ori,
                  ori9,
                  agency_name,
                  state,
                  state_abb,
                  year,
                  time_cols,
                  months_reported_cols,
                  crosswalk_cols,
                  population_cols,
                  country_division,
                  dplyr::one_of(offenses_known_unique_cols),
                  covered_by_ori,
                  agency_count,
                  dplyr::contains("mailing"),
                  dplyr::starts_with("card"),
                  dplyr::starts_with("officers"),
                  dplyr::starts_with("actual"),
                  dplyr::starts_with("total_cleared"),
                  dplyr::starts_with("cleared_18"),
                  dplyr::starts_with("unfounded"),
                  dplyr::everything())

  if (type == "month") {
    data <-
      data %>%
      dplyr::mutate(month = factor(month,
                                   levels = tolower(month.name))) %>%
      dplyr::arrange(ori,
                     month) %>%
      dplyr::mutate(month = as.character(month))
  } else {
    data <-
      data %>%
      dplyr::arrange(ori,
                     desc(year))
  }
  data$month_reported <- NULL

  return(data)
}

get_data_yearly <- function(folder,
                            years,
                            name_to_save,
                            crosswalk) {
  setwd(paste0("D:/ucr_data_storage/clean_data/", folder))
  files <- list.files(pattern = "monthly_.*.rds$")
  files <- files[!grepl("[0-9]{4}_[0-9]{4}", files)]
  print(files)

  data <- data.frame()
  for (file in files) {
    temp <- readRDS(file)
    if ("followup_indication" %in% names(temp)) {
      temp$followup_indication <- as.character(temp$followup_indication)
    }


    month_cols <- grep("^reported|unfounded|actual|clear|uninhab|est_dam|total_cleared|cleared_18|officer",
                       names(temp), value = TRUE)

    temp1 <- data.frame()
    for (year in unique(temp$year)) {
      temp2 <- agg_yearly(temp[temp$year %in% year, ], month_cols)
      temp1 <- bind_rows(temp1, temp2)
    }
    temp <- temp1
    rm(temp1, temp2)



    data <- dplyr::bind_rows(data, temp)
    message(unique(temp$year)); rm(temp); gc();
  }

  data <- reorder_columns(data, crosswalk, type = "year")
  data$month_missing       <- NULL

  # Save the data in various formats
  setwd(paste0("D:/ucr_data_storage/clean_data/", folder))
  save_files(data               = data,
             year               = years,
             file_name          = name_to_save,
             save_name          = name_to_save)



  return(data)
}

fix_all_negatives <- function(data) {
  crime_char_cols <- grep(paste(tolower(month.abb), collapse = "|"),
                          names(data),
                          value = TRUE)
  if (any(grepl("column", crime_char_cols))) {
    crime_char_cols <- crime_char_cols[-grep("column", crime_char_cols)]
  }

  crime_char_type <- sapply(data[, crime_char_cols], typeof)
  crime_char_cols <- crime_char_cols[crime_char_type == "character"]
  crime_char_cols <- crime_char_cols[!grepl("indicator|card", crime_char_cols)]

  data <-
    data %>%
    dplyr::mutate_at(vars((crime_char_cols)),
                     fix_negatives)


  return(data)
}

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
  if (is.character(column) && any(grepl("[[:alpha:]]", unique(column)))) {
    column <- stringr::str_replace_all(column, negatives)
  }
  column <- readr::parse_number(column)
  return(column)
}

fix_years <- function(year) {
  year <- year[!is.na(year)]
  year <- as.numeric(year)
  year[year < 10] <- paste0("200", year[year < 10])
  year <- as.numeric(year)
  year[year < 20] <- paste0("20", year[year < 20])
  year <- as.numeric(year)
  year[year == 20] <- paste0("2020")
  year[year == 21] <- paste0("2021")
  year[year == 22] <- paste0("2022")
  year[year == 23] <- paste0("2023")
  year[year == 24] <- paste0("2024")
  year[year == 25] <- paste0("2025")
  year[year == 26] <- paste0("2026")
  year[year == 27] <- paste0("2027")
  year[year == 28] <- paste0("2028")
  year[year == 29] <- paste0("2029")
  year[year == 30] <- paste0("2030")
  year <- as.numeric(year)
  year[year < 100] <- paste0("19", year[year < 100])
  year <- as.numeric(year)
  year[year == 20000] <- 2000
  return(year)
}

agg_yearly <- function(data, month_cols) {
  card_cols <- grep("card_", names(data), value = TRUE)

  yearly_data <-
    data %>%
    dplyr::select(-one_of(month_cols),
                  -month,
                  -date) %>%
    dplyr::distinct(ori, .keep_all = TRUE)

  month_cols <- c("ori", month_cols)
  month_cols <- month_cols[!month_cols %in% card_cols]
  data <-
    data %>%
    dplyr::select(-one_of(card_cols)) %>%
    dplyr::select(one_of(month_cols))

  data <-
    data %>%
    dplyr::group_by(ori) %>%
    dplyr::summarize_all(sum) %>%
    dplyr::left_join(yearly_data, by = "ori")

  data <- data.frame(data)
  return(data)
}


month_wide_to_long <- function(data) {
  month_cols <- grep(paste(tolower(month.abb), collapse = "|"),
                     names(data),
                     value = TRUE)

  data[, grep("indicator", names(data), value = TRUE)] <- sapply(data[, grep("indicator", names(data),
                                                                             value = TRUE)], as.character)

  month_only_data <-
    data %>%
    dplyr::select(one_of(month_cols))
  data <-
    data %>%
    dplyr::select(-one_of(month_cols))

  final <- data.frame()
  for (month in tolower(month.abb)) {
    temp        <- month_only_data[, grep(paste0("^", month, "_"), month_cols)]
    names(temp) <- gsub("^....", "", names(temp))
    temp        <- dplyr::bind_cols(data, temp)
    temp$month  <- tolower(month.name)[tolower(month.abb) == month]
    temp$date   <- lubridate::ymd(paste(temp$year, temp$month, "1"))
    temp$date   <- as.character(temp$date)

    if ("card_unfounded_pt" %in% names(temp)) {
      temp$card_unfounded_pt <- as.character(temp$card_unfounded_pt)
      final$card_unfounded_pt <- as.character(final$card_unfounded_pt)
    }
    final       <- dplyr::bind_rows(final, temp)
  }
  return(final)
}


make_state_abb <- function(state) {
  state_abb <- state.abb[match(tolower(state), tolower(state.name))]
  state_abb[tolower(state) == "canal zone"]           <- "CZ"
  state_abb[tolower(state) == "district of columbia"] <- "DC"
  state_abb[tolower(state) == "guam"]                 <- "GU"
  state_abb[tolower(state) == "puerto rico"]          <- "PR"
  return(state_abb)
}


global_checks <- function(data) {
  message("State names")
  print(table(data$state))
  message("State abbreviations")
  print(table(data$state_abb))
  message("All ORIs in right state")
  print(table(substr(data$ori[!data$state %in% c("nebraska", "guam")], 1, 2) ==
                data$state_abb[!data$state %in% c("nebraska", "guam")]))
  message("Country divisions")
  print(table(data$country_division))
  message("Population groups")
  print(table(data$population_group))
  message("Population summary")
  print(summary(data$population))
  message("Year")
  print(table(data$year))
  message("Any NA ORIs?")
  print(table(is.na(data$ori)))

  message("Column names")
  print(names(data))

  message("Names longer than 28 characters")
  print(names(data)[nchar(names(data)) > 28])
  message("Names longer than 32 characters!!!!!!!!!!")
  print(names(data)[nchar(names(data)) > 32])
  print(summary(data))

  message("Year and months missing")
  message("\n")
  print(table(data$year, data$number_of_months_missing))

}

