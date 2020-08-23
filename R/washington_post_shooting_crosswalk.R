library(dplyr)
library(stringr)
library(readr)
library(haven)
# Will need to change to your working directory and change it for this to load.
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known/offenses_known_yearly_1960_2018.rda")

washpost      <- read_csv("fatal-police-shootings-data.csv")
washpost      <- data.frame(washpost)
washpost$city <- tolower(washpost$city)
washpost      <- washpost %>% rename(state_abb = state)
washpost$agency_name <- washpost$city
# Keeps just the identifier variables, and removes duplicated
# rows (i.e. agencies that report from multiple years)
ucr <- offenses_known_yearly_1960_2018 %>%
  distinct(ori, .keep_all = TRUE) %>%
  select(ori,
         ori9,
         agency_name,
         state,
         state_abb,
         crosswalk_agency_name,
         agency_type,
         census_name,
         population_1)# %>%
#  filter(population_1 != 0)
# Washington Post data generally doesn't have these as
# part of the name so this makes names more similar
ucr$census_name <- gsub(" city.*| town.*| municipality.*| borough.*",
                        "", ucr$census_name)
ucr$crosswalk_agency_name <- gsub(" city.*| town.*| municipality.*| borough.*",
                        "", ucr$crosswalk_agency_name)
ucr$crosswalk_agency_name <- gsub(" \\(.*| county.*| police.*| department.*| cnty.*| sheriff.*",
                                  "", ucr$crosswalk_agency_name)

# Keeps all rows that are in both WPost data and UCR
# Matching on state and agency_name variables
combined_agency_name <- inner_join(washpost, ucr) %>%
  select(city,
         agency_name,
         census_name,
         crosswalk_agency_name,
         agency_type,
         population_1,
         state_abb,
         state,
         everything())

# Gets the agency name of all multiple matches in the UCR
# (due to matching on name and state, agencies which overlap
# in jurisdiction (e.g. city police and county Sheriff) may
# both match to same shooting).
duplicated_ids <- combined_agency_name$id[which(duplicated(combined_agency_name$id))]
duplicated_combined_agency_name <- combined_agency_name[combined_agency_name$id %in% duplicated_ids, ]

# Makes data.frame with just shootings that didn't match
# in first pass. So not rerunning join for shootings
# that we already have ORI for.
#
# This matches on state and census_name variables
missing_ids <- washpost[!washpost$id %in% combined_agency_name$id, ]
missing_ids <- missing_ids %>% rename(census_name = agency_name)
combined_census_name <- inner_join(missing_ids, ucr) %>%
  select(city,
         agency_name,
         census_name,
         crosswalk_agency_name,
         agency_type,
         population_1,
         state_abb,
         state,
         everything())

# Same as above, identifying the shootings with duplicate
# UCR matches
duplicated_ids <- combined_census_name$id[which(duplicated(combined_census_name$id))]
duplicated_combined_census_name <- combined_census_name[combined_census_name$id %in% duplicated_ids, ]

# And now getting those missing shootings where no matches
# in each of the two passes
missing_ids <- missing_ids[!missing_ids$id %in% combined_census_name$id, ]


# Same steps but for the agency name from the LEAIC crosswalk
missing_ids <- missing_ids %>% rename(crosswalk_agency_name = census_name)
combined_crosswalk_name <- inner_join(missing_ids, ucr) %>%
  select(city,
         agency_name,
         census_name,
         crosswalk_agency_name,
         agency_type,
         population_1,
         state_abb,
         state,
         everything())

# Same as above, identifying the shootings with duplicate
# UCR matches
duplicated_ids <- combined_census_name$id[which(duplicated(combined_census_name$id))]
duplicated_combined_census_name <- combined_census_name[combined_census_name$id %in% duplicated_ids, ]

# And now getting those missing shootings where no matches
# in any of the three of the passes
missing_ids <- missing_ids[!missing_ids$id %in% combined_census_name$id, ]

# Combines both of the merged files and the missing shootings
# file to get a complete dataset with all of the shootings
# and the UCR variables for those that matched
final_washpost_ucr_merged <- bind_rows(combined_agency_name,
                                       combined_census_name,
                                       combined_crosswalk_name,
                                       missing_ids)

# Some descriptive stats of the merges
table(washpost$id %in% unique(final_washpost_ucr_merged$id[!is.na(final_washpost_ucr_merged$ori)]))
table(duplicated(final_washpost_ucr_merged$id))
length(unique(final_washpost_ucr_merged$id[duplicated(final_washpost_ucr_merged$id)]))

write_dta(final_washpost_ucr_merged,
          path = "final_washpost_ucr_merged.dta")
