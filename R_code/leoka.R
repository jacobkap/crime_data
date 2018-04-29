source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
save_LEOKA_monthly()

crosswalk <- read_merge_crosswalks()
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
save_as_zip("LEOKA_monthly_1975_2015_")
# setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/LEOKA")
# save_raw_as_zip("LEOKA_monthly_1975_2015_ascii_sps")
leoka_yearly_1975_2015 <- leoka_yearly()
save_files(data = leoka_yearly_1975_2015,
           year = year,
           file_name = "leoka_yearly_1975_2015_",
           save_name = "leoka_yearly_1975_2015_")
save_as_zip("leoka_yearly_1975_2015_")

# Save the individual files - still monthly
save_LEOKA_monthly <- function() {

  for (year in 1975:2015) {
    source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/LEOKA")
    message(year)
    data <- spss_ascii_reader(dataset_name = paste0(year, "_leoka.txt"),
                              sps_name = paste0(year, "_leoka.sps"))

    names(data) <- name_fixer(names(data))
    cols_to_fix <- c(misc_cols, injury_cols, indicator_cols)
    cols <- cols_to_fix[cols_to_fix %in% names(data)]
    data <- clean_leoka_cols(data, cols)
    data$state_abb <- state.abb[match(data$STATE, tolower(state.name))]
    data$state_abb[data$STATE == "canal zone"]           <- "CZ"
    data$state_abb[data$STATE == "district of columbia"] <- "DC"
    data$state_abb[data$STATE == "guam"]                 <- "GU"
    data$state_abb[data$STATE == "puerto rico"]          <- "PR"
    data$state_abb[data$STATE == "virgin islands"]       <- "VI"


    # Fixes rare issue where some values in numeric columns are
    # "missing" or "blank". Makes those values NA, and the column
    # numeric
    months <- paste(toupper(month.abb), collapse = "|")
    num_cols <- names(data)[grepl(months, names(data))]
    num_cols <- c(num_cols, "POPULATION")
    num_cols <- num_cols[!grepl("^..._ASSLT_NO_INJURY$|^..._ASSLT_INJURY$|indicator",
                                num_cols, ignore.case = TRUE)]


    data[, num_cols] <- data.frame(sapply(data[, num_cols], tolower))
    data[, num_cols] <- data.frame(sapply(data[, num_cols], str_replace_all,
                                          words_in_num_cols),
                                   stringsAsFactors = FALSE)
    data[, num_cols] <- data.frame(sapply(data[, num_cols], as.numeric),
                                   stringsAsFactors = FALSE)

    tolower_cols <- c("NO_MALE_FEMALE_BREAKDOWN", "MSA", "AGENCY_NAME")
    tolower_cols <- tolower_cols[tolower_cols %in% names(data)]
    data[, tolower_cols] <- data.frame(sapply(data[, tolower_cols], tolower))

    data$POPULATION[data$POPULATION > 20000000] <- NA
    data$ORI <- NULL


    # A few years have value labels for ORIS (for some weird reason)
    # so this makes sure ORIs stay as ORIs
    ORI <- spss_ascii_reader(dataset_name = paste0(year, "_leoka.txt"),
                             sps_name = paste0(year, "_leoka.sps"),
                             keep_columns = "ORI_CODE",
                             value_label_fix = FALSE)
    names(ORI) <- "ORI"
    data <- bind_cols(data, ORI)
    data <- data[!is.na(data$STATE), ]
    data <- data[!is.na(data$ORI), ]

    data <- fix_persons_per_1k(data)
    names(data) <- tolower(names(data))

    # Reorder columns
    data <- data[, -grep("icpsr|state_name|identifier_code|blank", names(data))]
    indicator_cols <- grep("asslt_(no_)?injury$|indicator", names(data))
    starting_cols <- starting_cols[starting_cols %in% names(data)]
    data <-
      data %>%
      dplyr::select(starting_cols, indicator_cols, dplyr::everything())


    # Save the data in various formats
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
    save_files(data = data,
               year = year,
               file_name = "leoka_monthly_",
               save_name = "leoka_monthly_")
    rm(data); gc(); Sys.sleep(5)
  }
}



leoka_yearly <- function() {
  leoka <- data.frame()
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
  for (year in 1975:2015) {
    source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
    load(paste0("leoka_monthly_", year, ".rda"))
    do.call(assign, list("data", as.name(paste0("leoka_monthly_", year))))
    do.call(rm, list(paste0("leoka_monthly_", year)))
    data$city_sequence <- as.character(data$city_sequence)
    data$msa <- as.character(data$msa)
    data <- make_yearly(data)
    leoka <- bind_rows(leoka, data)
    message(year); gc()
  }
  leoka <- leoka[!is.na(leoka$ori), ]


  indicator_cols <- grep("asslt_(no_)?injury$|indicator", names(data))
  starting_cols <- starting_cols[starting_cols %in% names(data)]
  leoka <-
    leoka %>%
    dplyr::select(starting_cols, indicator_cols, dplyr::everything())

  return(leoka)
}

make_yearly <- function(data) {
  for (column in yearly_cols) {
    cols <- grep(column, names(data))
    data[, column] <- rowSums(data[, cols])
    data <- data[, -cols]
  }
  if (any(grepl("blank", names(data)))) {
    data <- data[, -grep("blank", names(data))]
  }
  return(data)
}

summary(leoka_yearly_1975_2015)
names(leoka_yearly_1975_2015)
