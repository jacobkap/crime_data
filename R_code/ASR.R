# Reads and cleans Arrest by Age, Sex, and Race (ASR) data from
# the FBI's UCR.

library(dplyr)
devtools::install_github("jacobkap/asciiSetupReader")
library(asciiSetupReader)
library(data.table)
library(stringr)
setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/ASR")

# SC00704 TX15525
for (year in 1980:2014) {
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

  ASR_year <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_yearly_",
                                       year, ".txt"),
                                paste0("UCR_arrests_by_age_sex_race_yearly_",
                                       year, ".sps"),
                                keep_columns = arrest_cols,
                                value_label_fix = FALSE)


  ASR_year <- ASR_year[, names(ASR)]
  ASR_year[4:59] <- sapply(ASR_year[4:59], function(x) remove_missing(x))
  ASR_year[4:59] <- sapply(ASR_year[4:59], function(x) NA_to_zero(x))
  ASR_year$OFFENSE_CODE <- as.character(ASR_year$OFFENSE_CODE)
  ASR_year$ORIGINATING_AGENCY_IDENTIFIER_CODE <- as.character(ASR_year$ORIGINATING_AGENCY_IDENTIFIER_CODE)

  ASR <- ASR[!is.na(ASR$OFFENSE_CODE), ]
  ASR_year <- ASR_year[!is.na(ASR_year$OFFENSE_CODE), ]
  ASR <- ASR[ASR$ORIGINATING_AGENCY_IDENTIFIER_CODE %in% ASR_year$ORIGINATING_AGENCY_IDENTIFIER_CODE, ]
  ASR$OFFENSE_CODE <- NULL
  ASR_year$OFFENSE_CODE <- NULL

  message(all.equal(ASR, ASR_year))

  rm(ASR); rm(ASR_year); gc(); Sys.sleep(10)
}


offense_codes <- c("^01A$" = "Murder and non-negligent manslaughter",
                   "^01B$" = "Manslaughter by negligence",
                   "^02$"  = "Forcible rape",
                   "^03$"  = "Robbery",
                   "^04$"  = "Aggravated assault",
                   "^05$"  = "Burglary-breaking or entering",
                   "^06$"  = "Larceny-theft (not motor vehicle)",
                   "^07$"  = "Motor vehicle theft",
                   "^08$"  = "Other assaults",
                   "^09$"  = "Arson",
                   "^10$"  = "Forgery and counterfeiting",
                   "^11$"  = "Fraud",
                   "^12$"  = "Embezzlement",
                   "^13$"  = "Stolen property-buy, receive, poss.",
                   "^14$"  = "Vandalism",
                   "^15$"  = "Weapons-carry, posses, etc.",
                   "^16$"  = "Prostitution and commercialized vice",
                   "^17$"  = "Sex offenses (not rape or prostitution)",
                   "^18$"  = "Total drug abuse violations",
                   "^180$" = "Sale/manufacture (subtotal)",
                   "^185$" = "Possession (subtotal)",
                   "^18A$" = "Sale: Opium, coke, and their derivatives",
                   "^18B$" = "Sale: Marijuana",
                   "^18C$" = "Sale: Truly addicting synthetic narcotics",
                   "^18D$" = "Sale: Other dangerous non-narc drugs",
                   "^18E$" = "Possession: Opium, coke, and their derivatives",
                   "^18F$" = "Possession: Marijuana",
                   "^18G$" = "Possession: Truly addicting synthetic narcotics",
                   "^18H$" = "Possession: Other dangerous non-narc drugs",
                   "^19$"  = "Gambling (total)",
                   "^19A$" = "Bookmaking (horse and sports)",
                   "^19B$" = "Number and lottery",
                   "^19C$" = "All other gambling",
                   "^20$"  = "Offenses against family and children",
                   "^21$"  = "Driving under the influence",
                   "^22$"  = "Liquor laws",
                   "^23$"  = "Drunkenness",
                   "^24$"  = "Disorderly conduct",
                   "^25$"  = "Vagrancy",
                   "^26$"  = "All other offenses (not traffic)",
                   "^27$"  = "Suspicion",
                   "^28$"  = "Curfew and loitering violations",
                   "^29$"  = "Runaways",
                   "^998$" = NA)

arrest_cols <- c("ORI", "YEAR", "OFFENSE",
                 "M0_9", "M10_12", "M13_14", "M15",
                 "M16", "M17", "M18", "M19", "M20",
                 "M21", "M22", "M23", "M24", "M25_29",
                 "M30_34", "M35_39", "M40_44", "M45_49",
                 "M50_54", "M55_59", "M60_64", "M65",
                 "F0_9", "F10_12", "F13_14", "F15",
                 "F16", "F17", "F18", "F19", "F20",
                 "F21", "F22", "F23", "F24", "F25_29",
                 "F30_34", "F35_39", "F40_44", "F45_49",
                 "F50_54", "F55_59", "F60_64", "F65", "AW",
                 "AB", "AI", "AA", "JW", "JB", "JI", "JA",
                 "AH", "AN", "JH","JN")

remove_missing <- function(column) {
  column[column %in% c(99999, 99998, 10000, 20000, 30000,
                       10001, 10002)] <- NA
  return(column)
}

NA_to_zero <- function(column) {
  column[is.na(column)] <- 0
  return(column)
}
