setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/leoka")
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(dplyr)
library(stringr)
library(data.table)

name_fixer <- function(col_names) {
  col_names <- stringr::str_replace_all(col_names, many_col_names)
  col_names <- stringr::str_replace_all(col_names, shifts)
  col_names <- stringr::str_replace_all(col_names, count)
  col_names <- stringr::str_replace_all(col_names, misc)
}


cols_to_fix <- c(misc_cols, injury_cols, indicator_cols)


leoka <- data.table()
for (i in 1975:2015) {


  temp <- spss_ascii_reader(dataset_name = paste0(i, "_leoka.txt"),
                            sps_name = paste0(i, "_leoka.sps"))
  names(temp) <- name_fixer(names(temp))
  cols <- misc_cols[misc_cols %in% names(temp)]
  temp <- temp[, cols]
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


  # A few years have value labels for ORIS (for some weird reason)
  # so this makes sure ORIs stay as ORIs
  ORI <- spss_ascii_reader(dataset_name = paste0(i, "_leoka.txt"),
                           sps_name = paste0(i, "_leoka.sps"),
                           keep_columns = "ORI_CODE",
                           value_label_fix = FALSE)
  temp <- bind_cols(temp, ORI)


  temp <- temp[!is.na(temp$STATE), ]
  temp <- data.table(temp)

  leoka <- rbind(leoka, temp, fill = TRUE)
  rm(temp); message(i);  gc(); Sys.sleep(1)




}

unique(leoka$STATE)
unique(leoka$GROUP)
unique(leoka$GEOGRAPHIC_DIVISION)
unique(leoka$YEAR)
unique(leoka$REPORT_INDICATOR)
unique(leoka$RECORD_INDICATOR)
unique(leoka$MONTH_INCLUDED)
unique(leoka$COVERED_BY_OTH_AGENCY)
unique(leoka$SHIFT_DATA)
summary(leoka$POPULATION)


table(leoka$state_abb == substr(leoka$ORI, 1, 2))
z = leoka[leoka$state_abb != substr(leoka$ORI, 1, 2) &
            leoka$state_abb != "NE", ]
table(z$STATE)
