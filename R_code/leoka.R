source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
save_LEOKA_monthly()

# setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/LEOKA")
# save_raw_as_zip("LEOKA_monthly_1975_2015_ascii_sps")
leoka_yearly_1975_2015 <- leoka_yearly()
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
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
    num_cols <- num_cols[!grepl("ASSAULT_INJURY$|ASSAULT_NO_INJURY$", num_cols)]


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

    data <- fix_persons_per_1k(data) # Now it DOESN'T make these rate variables.
                                     # Just makes total officers/civilians
                                     # variables and removes old rate variables.
    names(data) <- tolower(names(data))
    data$city_sequence <- as.character(data$city_sequence)
    data$msa <- as.character(data$msa)
    factor_cols <- names(data)[sapply(data, is.factor)]
    data[, factor_cols] <- sapply(data[, factor_cols], as.character)

    # Reorder columns
    data           <- data[, -grep("icpsr|state_name|identifier_code|blank",
                                   names(data))]
    data <- order_columns(data)

    if (year == 1979) {
      data$aug_officers_killed_felony[data$ori == "NJ01210"] <- NA
    }
    if (year == 1978) {
      data$jul_officers_killed_accident[data$ori == "PAPPD00"] <- NA
    }
    if (year == 1990) {
      data$mar_officers_killed_accident[data$ori == "ME010SP"] <- NA
    }



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
    suppressMessages(source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R'))
    load(paste0("leoka_monthly_", year, ".rda"))
    do.call(assign, list("data", as.name(paste0("leoka_monthly_", year))))
    do.call(rm, list(paste0("leoka_monthly_", year)))
    injury_no_injury <- grep("assault_injury$|assault_no_injury$",
                             names(data), ignore.case = TRUE,
                             value = TRUE)
    data[, injury_no_injury] <- sapply(data[, injury_no_injury], as.character)

    print(year); gc()
    data <- make_yearly(data)
    leoka <- bind_rows(leoka, data)

  }
  leoka <- leoka[!is.na(leoka$ori), ]
  leoka <- order_columns(leoka, monthly = FALSE)


  return(leoka)
}

make_yearly <- function(data) {
  for (column in yearly_cols) {
    cols <- grep(column, names(data))
    if (length(cols) != 12) {
      message(paste(column, length(cols)))
    }
    data[, column] <- rowSums(data[, cols])
    data <- data[, -cols]

  }
  if (any(grepl("blank", names(data)))) {
    data <- data[, -grep("blank", names(data))]
  }
  return(data)
}

summary(leoka_yearly_1975_2015)
summary(leoka_yearly_1975_2015$officers_killed_accident)
summary(leoka_yearly_1975_2015$officers_killed_felony)
names(leoka_yearly_1975_2015)
