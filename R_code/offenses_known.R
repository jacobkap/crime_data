source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')

crosswalk <- read_merge_crosswalks()
save_ucr_monthly("ucr_offenses_known_monthly_1960_2016_")
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
save_as_zip()

# Save in various data formats --------------------------------------------
save_ucr_monthly <- function() {
  for (year in 1960:2016) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
    temp <- spss_ascii_reader(dataset_name = paste0(year, "_UCR_offenses_known.txt"),
                              sps_name = paste0(year, "_UCR_offenses_known.sps"))
    temp <- cleaning_UCR(temp)

    if (year == 1972) {
      temp$ORI[temp$NUMERIC_STATE_CODE == "virginia" &
                 temp$POPULATION_1 == "446963"] <- "VA02901"
    }

    factor_cols <- sapply(temp, is.factor)
    temp[factor_cols] <- sapply(temp[factor_cols], function(x) as.character(x))

    names(temp) <- tolower(names(temp))
    temp <- left_join(crosswalk, temp)

    char_cols <- sapply(temp, is.character)
    temp[char_cols] <- sapply(temp[char_cols], function(x) tolower(x))
    temp$ori <- toupper(temp$ori)
    temp$ori9 <- toupper(temp$ori9)

    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    save_files(data = temp,
               year = year,
               file_name = "ucr_offenses_known_",
               save_name = "ucr_offenses_known_")
  gc(); Sys.sleep(5)

    message(year)
  }
}



save_raw_as_zip <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
  all_files <- list.files()

  zip::zip(zipfile = "UCR_offenses_known_1960_2016_ascii_sps.zip",
           files = all_files)

}
save_raw_as_zip()


