library(dplyr)
# This code will read in NIBRS data
# NIBRS data is downloaded from ICPSR
# http://www.icpsr.umich.edu/icpsrweb/NACJD/series/128

# !!! THE SPS FILES FOR YEAR 2002 ARE MISLABELED AND
# !!! READ "2004" INSTEAD OF "2002"


# Each available year (1991-2014) has 13 files
# I will go through them, clean the up, and merge
# into a master file.
# I will also make a supplementary file which focuses
# only on sex crimes

# Each NIBRS year has 13 files. I am not using
# the Extract Files that ICPSR has already merged together

# NIBRS file per year
# 1. Batch Header Segment 1 - NOT USED!
# 2. Batch Header Segment 2 - NOT USED!
# 3. Batch Header Segment 3
#       Number of months reported for each agency
# 4. Administrative Segment
#       What time the crime occurred
#       If the crime was exceptionally cleared (and how)
# 5. Offense Segment
#       The number of crimes committed in the agency
#       Where the crimes occurred
#       Weapon used by offender
# 6. Property Segment
# 7. Victim Segment
# 8. Offender Segment
# 9. Arrestee Segment
# 10. Group B Arrest Report Segment
# 11. Window Exceptionally Cleared Segment
# 12. Window Recovered Property Segment
# 13. Window Arrestee Segment

devtools::install_github("jacobkap/asciiReader")
library(spssSetup)

system.time(offenses <- spssSetup(dataset_name = "test.txt",
                  setup_file_name = "test.sps",
                  smart_col_class = TRUE))
# Time to read: 532.92 seconds. ~9 minutes

system.time(batch3 <- spssSetup(
                      dataset_name = "nibrs_2008_batch_header_3.txt",
                      setup_file_name = "nibrs_2008_batch_header_3.sps",
                      smart_col_class = TRUE))

system.time(admin <- spssSetup(
          dataset_name = "nibrs_2008_admin.txt",
          setup_file_name = "nibrs_2008_admin.sps",
          smart_col_class = TRUE))

system.time(except_cleared <- spssSetup(
  dataset_name = "nibrs_except_cleared.txt",
  setup_file_name = "nibrs_except_cleared.sps",
  smart_col_class = TRUE))

system.time(arrestee <- spssSetup(
  dataset_name = "nibrs_arrestee.txt",
  setup_file_name = "nibrs_arrestee.sps",
  smart_col_class = TRUE))

system.time(offender <- spssSetup(
  dataset_name = "nibrs_offender.txt",
  setup_file_name = "nibrs_offender.sps",
  smart_col_class = TRUE))


system.time(victim <- spssSetup(
  dataset_name = "nibrs_victim.txt",
  setup_file_name = "nibrs_victim.sps",
  smart_col_class = TRUE))
save(victim, file = "nibrs_victim.rda")
victim <- data.frame(victim, stringsAsFactors = FALSE)
names(victim) <- gsub("additional_justifiable_homicide_circumstance",
                      "add_justif_homicide_circum", names(victim))
names(victim) <- gsub("n_04_records_per_ori_incident_number",
                      "records_per_incident_num", names(victim))
for(i in 1:nrow(victim)) {
  victim[,i][victim[,i] == ""] <- NA
}
foreign::write.dta(victim, file = "victim.dta")

 xsystem.time(property <- spssSetup(
  dataset_name = "nibrs_property.txt",
  setup_file_name = "nibrs_property.sps",
  smart_col_class = TRUE))


system.time(window_arrest <- spssSetup(
  dataset_name = "window_arrest.txt",
  setup_file_name = "window_arrest.sps",
  smart_col_class = TRUE))


sort(table(test$ucr_offense_code), decreasing = TRUE)


# Batch Header Segments 1 and 2 do not provide new information
# They have some details about the agency. I will use the FBI
# crosswalk file to get that information instead.
# It is information such as agency name, population, region, etc.

# Batch Header Segment 3
# Only useful information is number of months reported
nibrs_batch_3_cleaner <- function(dataset, year) {
  dataset <- dataset[, grep("month|identif", names(dataset))]
  dataset$year <- year
  dataset$all_months_reported <- 0
  dataset$all_months_reported[dataset[, grep("month",
                                    names(dataset))[1]] == 12] <- 1
  return(dataset)
}

# Administrative
# This file has information on the time the crime occurred
# and if it was exceptionally cleared (and how it was if so)
nibrs_admin_cleaner <- function(dataset, year) {
  dataset <- dataset[, c(grep("agency|hour|cleared", names(dataset)))]
  dataset$year <- year

  dataset$midnight_to_159am <- 0
  dataset$two_am_to_359am <- 0
  dataset$four_am_to_559am <- 0
  dataset$six_am_to_759am <- 0
  dataset$eight_am_to_959am <- 0
  dataset$ten_am_to_1159am <- 0
  dataset$noon_to_159pm <- 0
  dataset$two_pm_to_359pm <- 0
  dataset$four_pm_to_559pm <- 0
  dataset$six_pm_to_759pm <- 0
  dataset$eight_pm_to_959pm <- 0
  dataset$ten_pm_to_1159pm <- 0
  dataset$time_unknown <- 0

  dataset$incident_date_hour <- trimws(dataset$incident_date_hour)
  dataset$midnight_to_159am[dataset$incident_date_hour %in% 0:1] <- 1
  dataset$two_am_to_359am[dataset$incident_date_hour %in% 2:3] <- 1
  dataset$four_am_to_559am[dataset$incident_date_hour %in% 4:5] <- 1
  dataset$six_am_to_759am[dataset$incident_date_hour %in% 6:7] <- 1
  dataset$eight_am_to_959am[dataset$incident_date_hour %in% 8:9] <- 1
  dataset$ten_am_to_1159am[dataset$incident_date_hour %in% 10:11] <- 1
  dataset$noon_to_159pm[dataset$incident_date_hour %in% 12:13] <- 1
  dataset$two_pm_to_359pm[dataset$incident_date_hour %in% 14:15] <- 1
  dataset$four_pm_to_559pm[dataset$incident_date_hour %in% 16:17] <- 1
  dataset$six_pm_to_759pm[dataset$incident_date_hour %in% 18:19] <- 1
  dataset$eight_pm_to_959pm[dataset$incident_date_hour %in% 20:21] <- 1
  dataset$ten_pm_to_1159pm[dataset$incident_date_hour %in% 22:23] <- 1
  dataset$time_unknown[dataset$incident_date_hour == ""] <- 1

  dataset$exceptional_cleared_offender_death <- 0
  dataset$exceptional_cleared_extradition_denied <- 0
  dataset$exceptional_cleared_juvenile_no_custody <- 0
  dataset$exceptional_cleared_prosecution_denied <- 0
  dataset$exceptional_cleared_victim_noncooperative <- 0

  dataset$exceptional_cleared_offender_death[grep("death",
                  dataset$cleared_exceptionally, ignore.case = TRUE)] <- 1
  dataset$exceptional_cleared_extradition_denied[grep("extra",
                  dataset$cleared_exceptionally, ignore.case = TRUE)] <- 1
  dataset$exceptional_cleared_juvenile_no_custody[grep("juven",
                  dataset$cleared_exceptionally, ignore.case = TRUE)] <- 1
  dataset$exceptional_cleared_prosecution_denied[grep("pros",
                  dataset$cleared_exceptionally, ignore.case = TRUE)] <- 1
  dataset$exceptional_cleared_victim_noncooperative[grep("victim",
                  dataset$cleared_exceptionally, ignore.case = TRUE)] <- 1

  dataset <- dataset[, grep("^exceptional|time|am|pm|agency", names(dataset))]

  dataset <- dataset %>% dplyr::group_by(originating_agency_indentifier) %>%
    dplyr::summarise_each(funs(sum))


  return(dataset)
}

# This will clean up the offense file
# Originally every offense is its own row, leading to
# millions of rows. This will make each offense
# its own column. Each agency will have its own row.
# The cleaned dataset will say
# Number of each crimes in each agency
# Location of the offense
# Weapon used
nibrs_offenses_cleaner <- function(dataset, year) {

  dataset <- dataset[, grep("agency|ucr|location|weapon", names(dataset))]
  dataset$year <- year

  # Clean up weapon offenses
  # Merge all automatic weapon to the non-automatic category
        # e.g. shotguns and automatic shotguns are labeled as "shotguns"
  # Combine explosives, fire, asphyxiation,
      #sleeping pills/narcotics, poison into the Other category
  # Combine Firearm and Other Firearm into Other Firearm category
      # Including FIrearm Automatic and Other Firearm Automatic

  # Standardizes weapon names
  weapon_columns <- grep("weapon", names(dataset))
  for (i in weapon_columns) {
    dataset[, i] <- trimws(dataset[, i])
    dataset[, i] <- gsub(".*firearm.*", "other_firearm", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub(".*handgun.*", "handgun", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub(".*rifle.*", "rifle", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub(".*shotgun.*", "shotgun", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub(".*knife.*", "knife", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub(".*blunt.*", "blunt_object", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub(".*motor.*|.*veh.*", "vehicle", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub(".*person.*", "personal", dataset[,i],
                         ignore.case = TRUE)
    other_weapons <- c(".*asph.*", ".*explos.*", ".*incen.*",
                       ".*pills.*", "^other$", ".*pois.*")
    dataset[, i] <- gsub(paste(other_weapons, collapse = "|"),
                         "other", dataset[,i],
                         ignore.case = TRUE)
    dataset[, i] <- gsub("^$|.*unkn.*|.*none.*",
                         "none_or_unknown", dataset[,i],
                         ignore.case = TRUE)
  }

  dataset$weapon_handgun <- 0
  dataset$weapon_rifle <- 0
  dataset$weapon_shotgun <- 0
  dataset$weapon_other_firearm <- 0
  dataset$weapon_knife <- 0
  dataset$weapon_personal <- 0
  dataset$weapon_blunt_object <- 0
  dataset$weapon_vehicle <- 0
  dataset$weapon_other <- 0
  dataset$weapon_unknown_or_none <- 0


  for (i in weapon_columns) {
    dataset$weapon_handgun[dataset[, i] %in% "handgun"] <-
      dataset$weapon_handgun[dataset[, i] %in% "handgun"] + 1

    dataset$weapon_rifle[dataset[, i] %in% "rifle"] <-
      dataset$weapon_rifle[dataset[, i] %in% "rifle"] + 1

    dataset$weapon_shotgun[dataset[, i] %in% "shotgun"] <-
      dataset$weapon_shotgun[dataset[, i] %in% "shotgun"] + 1

    dataset$weapon_other_firearm[dataset[, i] %in% "other_firearm"] <-
      dataset$weapon_other_firearm[dataset[, i] %in% "other_firearm"] + 1

    dataset$weapon_knife[dataset[, i] %in% "knife"] <-
      dataset$weapon_knife[dataset[, i] %in% "knife"] + 1

    dataset$weapon_personal[dataset[, i] %in% "personal"] <-
      dataset$weapon_personal[dataset[, i] %in% "personal"] + 1

    dataset$weapon_blunt_object[dataset[, i] %in% "blunt_object"] <-
      dataset$weapon_blunt_object[dataset[, i] %in% "blunt_object"] + 1

    dataset$weapon_vehicle[dataset[, i] %in% "vehicle"] <-
      dataset$weapon_vehicle[dataset[, i] %in% "vehicle"] + 1

    dataset$weapon_other[dataset[, i] %in% "other"] <-
      dataset$weapon_other[dataset[, i] %in% "other"] + 1

    dataset$weapon_unknown_or_none[dataset[, i] %in% "none_or_unknown"] <-
      dataset$weapon_unknown_or_none[dataset[, i] %in% "none_or_unknown"] + 1

  }

  return(dataset)
}