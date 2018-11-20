devtools::install_github("jacobkap/asciisetupreader")
library(tidyverse)
library(asciiSetupReader)
library(dplyr)
library(stringr)
library(data.table)
library(memisc)
library(haven)
library(readr)
library(rmarkdown)

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
  column <- stringr::str_replace_all(column, negatives)
  column <- readr::parse_number(column)
  return(column)
}

fix_years <- function(year) {
  year[year < 10] <- paste0("200", year[year < 10])
  year <- as.numeric(year)
  year[year < 20] <- paste0("20", year[year < 20])
  year <- as.numeric(year)
  year[year < 100] <- paste0("19", year[year < 100])
  year <- as.numeric(year)
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
  year_only_data <-
    data %>%
    dplyr::select(-one_of(month_cols))

  final <- data.frame()
  for (month in tolower(month.abb)) {
    temp        <- month_only_data[, grep(paste0("^", month, "_"), month_cols)]
    names(temp) <- gsub("^....", "", names(temp))
    temp        <- dplyr::bind_cols(year_only_data, temp)
    temp$month  <- tolower(month.name)[tolower(month.abb) == month]
    temp$date   <- lubridate::ymd(paste(temp$year, temp$month, "1"))
    temp$date   <- as.character(temp$date)

    final       <- dplyr::bind_rows(final, temp)
  }

  final <-
    final %>%
    dplyr::mutate(month = factor(month,
                                 levels = tolower(month.name))) %>%
    dplyr::arrange(ori,
                   month) %>%
    dplyr::mutate(month = as.character(month))
  return(final)
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

convert_codebook_to_pdf <- function(file_name) {
  temp      <- readLines(file_name)
  old_name  <- file_name
  file_name <- gsub(".txt", ".Rmd", file_name)
  cat(temp, sep = "  \n", file = file_name)
  suppressMessages(render(file_name, pdf_document(), quiet = TRUE))
  file.remove(old_name)
  file.remove(file_name)
}

save_files <- function(data, year, file_name, save_name, rda_only = FALSE) {
  if (any(nchar(names(data)) > 29)) {
    print(names(data)[nchar(names(data)) > 29])
  }

  assign(paste0(file_name, year), data) # Change name
  save( list = paste0(file_name, year),
        file = paste0(save_name, year, ".rda"))

  if (rda_only == FALSE) {
    codebook_name <- paste0(file_name, "_codebook_", year, ".txt")
    codebook_name <- gsub("__", "_", codebook_name)
    codebook_name <- gsub("_\\.", "\\.", codebook_name)
    Write(codebook(data),
          file = codebook_name)

    convert_codebook_to_pdf(codebook_name)

    do.call("write_dta", list(as.name(paste0(file_name, year)),
                              path = paste0(save_name,
                                            year, ".dta")))

    # do.call("write_csv", list(as.name(paste0(file_name, year)),
    #                           path = paste0(save_name,
    #                                         year, ".csv")))

    do.call("rm", list(as.name(paste0(file_name, year))))
  }
}

save_as_zip <- function(file_name, pattern = NULL) {
  file_ext <- c("rda", "dta")
  all_files <- list.files()
  if (!is.null(pattern)) {
    sps_files <- all_files[grep("sps$|record description", all_files, ignore.case = TRUE)]
    all_files <- list.files(pattern = pattern)
    all_files <- c(sps_files, all_files)
  }

  codebooks <- all_files[grep("codebook|pdf$|sps$", all_files)]
  for (i in seq_along(file_ext)) {
    zip_files <- all_files[grep(file_ext[i], all_files)]
    zip_files <- c(zip_files, codebooks)
    zip_files <- sort(zip_files)

    zip::zip(zipfile = paste0(file_name,
                              file_ext[i], ".zip"),
             files = zip_files)
  }
}

save_raw_as_zip <- function(file_name) {
  all_files <- list.files()
  zip::zip(zipfile = paste0(file_name, ".zip"),
           files = all_files)
}

make_state_abb <- function(state) {
  state_abb <- state.abb[match(tolower(state), tolower(state.name))]
  state_abb[tolower(state) == "canal zone"]           <- "CZ"
  state_abb[tolower(state) == "district of columbia"] <- "DC"
  state_abb[tolower(state) == "guam"]                 <- "GU"
  state_abb[tolower(state) == "puerto rico"]          <- "PR"
  return(state_abb)
}


global_tests <- function(data) {
  message("State names")
  print(sort(table(data$state)))
  message("State abbreviations")
  print(sort(table(data$state_abb)))
  message("All ORIs in right state")
  print(sort(table(substr(data$ori[data$state != "nebraska"], 1, 2) ==
                     data$state_abb[data$state != "nebraska"])))
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
  # Names longer than 28 characters
  print(names(data)[nchar(names(data)) > 28])
  print(summary(data))

}
