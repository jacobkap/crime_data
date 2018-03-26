source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(dplyr)
library(stringr)
library(data.table)
library(memisc)
library(haven)

# Save the individual files - still monthly
for (year in 1975:2015) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/leoka")
  message(year)
  temp <- spss_ascii_reader(dataset_name = paste0(year, "_leoka.txt"),
                            sps_name = paste0(year, "_leoka.sps"))

  names(temp) <- name_fixer(names(temp))
  cols_to_fix <- c(misc_cols, injury_cols, indicator_cols)
  cols <- cols_to_fix[cols_to_fix %in% names(temp)]
  temp <- clean_leoka_cols(temp, cols)
  temp$state_abb <- state.abb[match(temp$STATE, tolower(state.name))]
  months <- paste(toupper(month.abb), collapse = "|")

  # Fixes rare issue where some values in numeric columns are
  # "missing" or "blank". Makes those values NA, and the column
  # numeric
  num_cols <- names(temp)[grepl(months, names(temp))]
  num_cols <- c(num_cols, "POPULATION")
  num_cols <- num_cols[!grepl("^..._ASSLT_NO_INJURY$|^..._ASSLT_INJURY$|indicator",
                              num_cols, ignore.case = TRUE)]

  #temp[num_cols] <- sapply(temp[num_cols], remove_blanks)
  temp$POPULATION <- as.numeric(temp$POPULATION)
  temp$POPULATION[temp$POPULATION > 20000000] <- NA
  temp$ORI <- NULL


  # A few years have value labels for ORIS (for some weird reason)
  # so this makes sure ORIs stay as ORIs
  ORI <- spss_ascii_reader(dataset_name = paste0(year, "_leoka.txt"),
                           sps_name = paste0(year, "_leoka.sps"),
                           keep_columns = "ORI_CODE",
                           value_label_fix = FALSE)
  names(ORI) <- "ORI"
  temp <- bind_cols(temp, ORI)
  temp <- temp[!is.na(temp$STATE), ]

  # Fixes officers/employees per 1k pop. columns
  temp$TOT_OFFICERS <- temp$MALE_EMPLOYEES_OFFICERS + temp$FEMALE_EMPLOYEES_OFFICERS
  temp$TOT_CIVILIANS <- temp$MALE_EMPLOYEES_CIVILIANS + temp$FEMALE_EMPLOYEES_CIVILIANS
  temp$EMPLOYEES_PER_1K_POP <- temp$TOT_EMPLOYEES / temp$POPULATION * 1000
  temp$OFFICERS_PER_1K_POP <- temp$TOT_OFFICERS / temp$POPULATION * 1000
  temp$CIVILIANS_PER_1K_POP <- temp$TOT_CIVILIANS / temp$POPULATION * 1000

  temp$EMPLOYEES_PER_1K_POP[is.nan(temp$EMPLOYEES_PER_1K_POP)] <- NA
  temp$OFFICERS_PER_1K_POP[is.nan(temp$OFFICERS_PER_1K_POP)] <- NA
  temp$CIVILIANS_PER_1K_POP[is.nan(temp$CIVILIANS_PER_1K_POP)] <- NA
  names(temp) <- tolower(names(temp))

  # Save the data in various formats
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
  names(temp) <- gsub("CUST_OF_PRISONERS", "cust_prisoners", names(temp),
                      ignore.case = TRUE)
  save_files(temp, "LEOKA_", "LEOKA_monthly_")


  rm(temp); gc(); Sys.sleep(5)


}

