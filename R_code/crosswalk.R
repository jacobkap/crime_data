setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/crosswalk")
devtools::install_github("jacobkap/spssSetup")
library(spssSetup)

system.time(crosswalk_2000 <- spssSetup(dataset_name = "2000_crosswalk.txt",
                                        setup_file_name = "2000_crosswalk.sps",
                                        smart_col_class = TRUE))
crosswalk_2000 <- crosswalk_2000[, c(5, 32:33)]
crosswalk_2000 <- trim.all(crosswalk_2000)
crosswalk_2000 <- crosswalk_2000[-grep("^$",
                  crosswalk_2000$originating_agency_identifier_7_character),]
names(crosswalk_2000) <- c("ORI", "total_housing_units_2000",
                           "total_area_in_square_miles_2000")


system.time(crosswalk_2005 <- spssSetup(dataset_name = "2005_crosswalk.txt",
                            setup_file_name = "2005_crosswalk.sps",
                            smart_col_class = TRUE))
crosswalk_2005 <- trim.all(crosswalk_2005)
crosswalk_2005 <- crosswalk_2005[-grep("^$",
                 crosswalk_2005$originating_agency_identifier_7_character),]
crosswalk_2005$year <- 2005
crosswalk_2005 <- crosswalk_2005[, c(12, 13, 23, 39, 47:48)]
names(crosswalk_2005)[c(3, 5, 6)] <- c("ORI", "total_housing_units_2005",
                                       "total_area_in_square_miles_2005")

system.time(crosswalk_2012 <- spssSetup(dataset_name = "2012_crosswalk.txt",
                                        setup_file_name = "2012_crosswalk.sps",
                                        smart_col_class = TRUE))
crosswalk_2012 <- trim.all(crosswalk_2012)
crosswalk_2012 <- crosswalk_2012[-grep("Not in UCR",
                  crosswalk_2012$originating_agency_identifier_7_character,
                  ignore.case = TRUE),]
crosswalk_2012$year <- 2012
crosswalk_2012 <- crosswalk_2012[, c(1:3, 5, 7:9, 12, 15,
                                     18:25, 27:28, 36:37, 40)]
crosswalk_2012$address <- paste(crosswalk_2012$address_street_line_1,
                                crosswalk_2012$address_street_line_2,
                                crosswalk_2012$address_city,
                                crosswalk_2012$address_state,
                                crosswalk_2012$address_zip_code,
                                sep = ", ")
crosswalk_2012$address <- gsub(", ,", ",", crosswalk_2012$address)
crosswalk_2012$address_street_line_1 <- NULL
crosswalk_2012$address_street_line_2 <- NULL
crosswalk_2012$address_city <- NULL
crosswalk_2012$address_state <- NULL
crosswalk_2012$address_zip_code <- NULL
names(crosswalk_2012)[5:6] <- c("ORI9", "ORI")


crosswalk <- dplyr::full_join(crosswalk_2012, crosswalk_2000)
crosswalk <- dplyr::full_join(crosswalk, crosswalk_2005)
crosswalk <- tolower_all(crosswalk)
crosswalk$ORI <- toupper(crosswalk$ORI)
crosswalk$ORI9 <- toupper(crosswalk$ORI9)

for (i in 1:ncol(crosswalk)) {
  crosswalk[,i][crosswalk[,i] == ""] <- NA
  crosswalk[,i][crosswalk[,i] == "not in lemas files"] <- NA

}
police_agency_identifier_crosswalk <- crosswalk
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/R_files")
save(police_agency_identifier_crosswalk,
     file = "police_agency_identifier_crosswalk.rda")




trim.all <- function(dataset) {
  for (i in 1:ncol(dataset)) {
    dataset[,i] <- trimws(dataset[,i])
  }
  return(dataset)
}



tolower_all <- function(dataset) {
  for (i in 1:ncol(dataset)) {
    dataset[,i] <- tolower(dataset[,i])

  }
  return(dataset)
}

