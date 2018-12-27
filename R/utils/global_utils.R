source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/saving_utils.R')
devtools::install_github("jacobkap/asciisetupreader")
library(memisc)
library(tidyverse)
library(asciiSetupReader)
library(haven)
library(lubridate)

fix_all_negatives <- function(data) {
  crime_char_cols <- grep(paste(tolower(month.abb), collapse = "|"),
                          names(data),
                          value = TRUE)
  crime_char_type <- sapply(data[, crime_char_cols], typeof)
  crime_char_cols <- crime_char_cols[crime_char_type == "character"]
  crime_char_cols <- crime_char_cols[!grepl("indicator", crime_char_cols)]

  data <-
    data %>%
    dplyr::mutate_at(vars(crime_char_cols),
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
  if (any(grepl("[[:alpha:]]", unique(column)))) {
    column <- stringr::str_replace_all(column, negatives)
  }
  column <- readr::parse_number(column)
  return(column)
}

fix_years <- function(year) {
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

  yearly_data <-
    data %>%
    dplyr::select(-one_of(month_cols),
                  -month,
                  -date) %>%
    dplyr::distinct(ori, .keep_all = TRUE)

  month_cols <- c("ori", month_cols)
  data <-
    data %>%
    dplyr::select(one_of(month_cols))

  data <-
    data %>%
    dplyr::group_by(ori) %>%
    dplyr::summarize_all(sum) %>%
    dplyr::left_join(yearly_data)

  data <- data.frame(data)
  return(data)
}


month_wide_to_long <- function(data) {
  month_cols <- grep(paste(tolower(month.abb), collapse = "|"),
                     names(data),
                     value = TRUE)

  month_only_data <-
    data %>%
    dplyr::select(one_of(month_cols))
  data <-
    data %>%
    dplyr::select(-one_of(month_cols))

  final <- data.frame()
  for (month in tolower(month.abb)) {
    temp        <- month_only_data[, grep(paste0("^",
                                                 month,
                                                 "_"),
                                          month_cols)]
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
  print(sort(table(data$state)))
  message("State abbreviations")
  print(sort(table(data$state_abb)))
  message("All ORIs in right state")
  print(sort(table(substr(data$ori[!data$state %in% c("nebraska",
                                                      "guam")], 1, 2) ==
                     data$state_abb[!data$state %in% c("nebraska",
                                                       "guam")])))
  message("Country divisions")
  print(sort(table(data$country_division)))
  message("Population groups")
  print(sort(table(data$population_group)))
  message("Population summary")
  print(summary(data$population))
  message("Year")
  print(sort(table(data$year)))
  message("Any NA ORIs?")
  print(table(is.na(data$ori)))

  print(names(data))

  message("Names longer than 28 characters")

  print(names(data)[nchar(names(data)) > 28])
  print(summary(data))

}


read_clean_csv_for_tests <- function(file_name) {
  data <- readr::read_csv(paste0(file_name, ".csv"), skip = 5)

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
