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
  ASR$OFFENSE_CODE <- str_replace_all(ASR$OFFENSE_CODE, offense_codes)
  ASR[4:59] <- sapply(ASR[4:59], function(x) remove_missing(x))
  ASR <- ASR %>% group_by(ORIGINATING_AGENCY_IDENTIFIER_CODE,
                          OFFENSE_CODE,
                          YEAR) %>%
    summarise_all(funs(sum(., na.rm = TRUE)))
  ASR <- ASR[!is.na(ASR$OFFENSE_CODE), ]
  ASR$ADULT_RACE <- ASR$ADULT_ASIAN + ASR$ADULT_BLACK + ASR$ADULT_INDIAN +
                      ASR$ADULT_WHITE

  ASR <- ASR[, c("ORIGINATING_AGENCY_IDENTIFIER_CODE", "OFFENSE_CODE",
                 "YEAR", "ADULT_RACE")]
  ASR <- ASR[ASR$OFFENSE_CODE %in% c("Aggravated assault",
                                     "Burglary-breaking or entering",
                                     "Arson",
                                     "Forcible Rape",
                                     "Larceny-theft (not motor vehicle)",
                                     "Motor vehicle theft",
                                     "Robbery",
                                     "Other assaults",
                                     "Murder and non-negligent manslaughter",
                                     "Possession (subtotal)",
                                     "Sale/manufacture (subtotal)",
                                     "Total drug abuse violations"), ]
  ASR$OFFENSE_CODE <- clean_crimes(ASR$OFFENSE_CODE)

  ASR <- tidyr::spread(ASR, key = OFFENSE_CODE,
                             value = ADULT_RACE,
                             fill = 0)
  names(ASR)[3:13] <- paste0("adult_race_", names(ASR)[3:13])

  ASR_yearly <- dplyr::bind_rows(ASR_yearly, ASR)

}