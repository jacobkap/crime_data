devtools::install_github("jacobkap/asciiSetupReader")
library(asciiSetupReader)
library(data.table)
library(stringr)
library(dplyr)

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

offense_codes_yearly <- c("^11$" = "Murder and non-negligent manslaughter",
                          "^12$" = "Manslaughter by negligence",
                          "^20$"  = "Forcible rape",
                          "^30$"  = "Robbery",
                          "^40$"  = "Aggravated assault",
                          "^50$"  = "Burglary-breaking or entering",
                          "^60$"  = "Larceny-theft (not motor vehicle)",
                          "^70$"  = "Motor vehicle theft",
                          "^80$"  = "Other assaults",
                          "^90$"  = "Arson",
                          "^100$"  = "Forgery and counterfeiting",
                          "^110$"  = "Fraud",
                          "^120$"  = "Embezzlement",
                          "^130$"  = "Stolen property-buy, receive, poss.",
                          "^140$"  = "Vandalism",
                          "^150$"  = "Weapons-carry, posses, etc.",
                          "^160$"  = "Prostitution and commercialized vice",
                          "^170$"  = "Sex offenses (not rape or prostitution)",
                          "^18$"  = "Total drug abuse violations",
                          "^180$" = "Sale/manufacture (subtotal)",
                          "^185$" = "Possession (subtotal)",
                          "^181$" = "Sale: Opium, coke, and their derivatives",
                          "^182$" = "Sale: Marijuana",
                          "^183$" = "Sale: Truly addicting synthetic narcotics",
                          "^184$" = "Sale: Other dangerous non-narc drugs",
                          "^186$" = "Possession: Opium, coke, and their derivatives",
                          "^187$" = "Possession: Marijuana",
                          "^188$" = "Possession: Truly addicting synthetic narcotics",
                          "^189$" = "Possession: Other dangerous non-narc drugs",
                          "^190$"  = "Gambling (total)",
                          "^191$" = "Bookmaking (horse and sports)",
                          "^192$" = "Number and lottery",
                          "^193$" = "All other gambling",
                          "^200$"  = "Offenses against family and children",
                          "^210$"  = "Driving under the influence",
                          "^220$"  = "Liquor laws",
                          "^230$"  = "Drunkenness",
                          "^240$"  = "Disorderly conduct",
                          "^250$"  = "Vagrancy",
                          "^260$"  = "All other offenses (not traffic)",
                          "^270$"  = "Suspicion",
                          "^280$"  = "Curfew and loitering violations",
                          "^290$"  = "Runaways",
                          "^98$" = NA)

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
  column[column %in% c(99999, 99998, 10000, 20000,
                       30000, 40000, 50000)] <- NA
  return(column)
}


NA_to_zero <- function(column) {
  column[is.na(column)] <- 0
  return(column)
}


clean_crimes <- function(crimes) {
  crimes <- gsub("\\(|\\)|\\s|:|-|/", "_", crimes)
  crimes <- gsub("_+", "_", crimes)
  crimes <- gsub("_$|^_", "", crimes)
  crimes <- tolower(crimes)
  return(crimes)
}
