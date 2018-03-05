# Reads and cleans Arrest by Age, Sex, and Race (ASR) data from
# the FBI's UCR.
setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/ASR")
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/ASR_utils.R')

ASR_yearly <- data.frame()
for (year in 1980:2015) {
  message(year)

  ASR <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = arrest_cols,
                           value_label_fix = FALSE)

  ASR_yearly <- dplyr::bind_rows(ASR_yearly, ASR)

}