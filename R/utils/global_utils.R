source(here::here('R/utils/saving_utils.R'))
devtools::install_github("jacobkap/asciisetupreader")
library(memisc)
library(tidyverse)
library(asciiSetupReader)
library(haven)
library(lubridate)
library(data.table)
library(dplyr)

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
                  dplyr::starts_with("tot_clr"),
                  dplyr::starts_with("clr_18"),
                  dplyr::starts_with("unfound"),
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
  setwd(here::here(paste0("clean_data/", folder)))
  files <- list.files(pattern = "monthly_.*.rda$")

  data <- data.frame()
  for (file in files) {
    load(file)
    file_name <- gsub(".rda", "", file)
    assign("temp", get(file_name))
    do.call(rm, list(file_name))
    month_cols <- grep("^reported|unfound|actual|clear|uninhab|est_dam|tot_clr|clr_18|officer",
                       names(temp), value = TRUE)

    temp1 <- data.frame()
    for (year in unique(temp$year)) {
      temp2 <- agg_yearly(temp[temp$year %in% year, ], month_cols)
      temp1 <- bind_rows(temp1, temp2)
    }
    temp <- temp1
    rm(temp1, temp2)


    temp$date_of_last_update <- NULL
    temp$last_update         <- NULL

    data <- dplyr::bind_rows(data, temp)
    message(temp$year[1]); rm(temp); gc(); Sys.sleep(3)
  }

  data <- reorder_columns(data, crosswalk, type = "year")
  data$month_missing       <- NULL
  data$date_of_last_update <- NULL
  data$last_update         <- NULL

    # Save the data in various formats
    setwd(here::here(paste0("clean_data/", folder)))
    save_files(data               = data,
               year               = years,
               file_name          = name_to_save,
               save_name          = name_to_save,
               rda_and_stata_only = FALSE,
               codebook           = FALSE)


  return(data)
}

fix_all_negatives <- function(data) {
  crime_char_cols <- grep(paste(tolower(month.abb), collapse = "|"),
                          names(data),
                          value = TRUE)
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

  data[, grep("indicator", names(data), value = TRUE)] <- sapply(data[, grep("indicator", names(data), value = TRUE)], as.character)

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

  message("Year and months reported")
  print(table(data$year, data$number_of_months_reported))

}


read_clean_csv_for_tests <- function(file_name) {
  data <- readr::read_csv(paste0(file_name, ".csv"), skip = 8)

  data <- data[1:29, 1:13]
  names(data) <- tolower(names(data))
  names(data) <- gsub("\\/", "", names(data))
  names(data) <- gsub(" |-", "_", names(data))

  data$legacy_rape_1[is.na(data$legacy_rape_1)] <-
    data$revised_rape_2[is.na(data$legacy_rape_1)]

  data <-
    data %>%
    dplyr::select(-revised_rape_2,
                  -violent_crime_total,
                  -property_crime_total) %>%
    dplyr::rename(murder = murder_and_nonnegligent_manslaughter,
                  number_of_months_reported = months,
                  rape  = legacy_rape_1,
                  theft = larceny_theft) %>%
    dplyr::mutate_if(is.character, readr::parse_number) %>%
    dplyr::filter(!is.na(year))

  return(data)
}


save_raw_data_from_zip <- function(from_folder, to_folder) {
  setwd(from_folder)
  zip_files <- list.files()
  zip_files <- zip_files[grepl(".zip", zip_files, ignore.case = TRUE)]
  for (zip_file in zip_files) {
    unzip(zip_file)
  }
  files <- list.files()
  files <- files[grepl(".txt$|.dat$", files, ignore.case = TRUE)]
  for (file in files) {
    file.copy(file, to_folder)
  }
}


check_raw_files_nchar <- function(folder) {
  files <- list.files()
  for (file in files) {
    z <- readr::read_lines(file)
    message(file)
    print(table(nchar(z)))
  }
}
