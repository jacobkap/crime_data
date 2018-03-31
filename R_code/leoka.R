source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
save_LEOKA_monthly()
save_as_zip("LEOKA_monthly_1975_2015_")
# setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/LEOKA")
# save_raw_as_zip("LEOKA_monthly_1975_2015_ascii_sps")

# Save the individual files - still monthly
save_LEOKA_monthly <- function() {

  for (year in 1975:2015) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/LEOKA")
    message(year)
    data <- spss_ascii_reader(dataset_name = paste0(year, "_leoka.txt"),
                              sps_name = paste0(year, "_leoka.sps"))

    names(data) <- name_fixer(names(data))
    cols_to_fix <- c(misc_cols, injury_cols, indicator_cols)
    cols <- cols_to_fix[cols_to_fix %in% names(data)]
    data <- clean_leoka_cols(data, cols)
    data$state_abb <- state.abb[match(data$STATE, tolower(state.name))]
    months <- paste(toupper(month.abb), collapse = "|")

    # Fixes rare issue where some values in numeric columns are
    # "missing" or "blank". Makes those values NA, and the column
    # numeric
    num_cols <- names(data)[grepl(months, names(data))]
    num_cols <- c(num_cols, "POPULATION")
    num_cols <- num_cols[!grepl("^..._ASSLT_NO_INJURY$|^..._ASSLT_INJURY$|indicator",
                                num_cols, ignore.case = TRUE)]

    data$POPULATION <- as.numeric(data$POPULATION)
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

    data <- fix_persons_per_1k(data)

    names(data) <- tolower(names(data))
    names(data) <- gsub("CUST_OF_PRISONERS", "cust_prisoners", names(data),
                        ignore.case = TRUE)
    data <- data[, ]

    # Save the data in various formats
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
    save_files(data = data,
               year = year,
               file_name = "LEOKA_",
               save_name = "LEOKA_monthly_")
    rm(data); gc(); Sys.sleep(5)
  }
}
