library(dplyr)
library(stringr)
library(readr)
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known/offenses_known_yearly_1960_2018.rda")

washpost      <- read_csv("fatal-police-shootings-data.csv")
washpost      <- data.frame(washpost)
washpost$city <- tolower(washpost$city)
washpost      <- washpost %>% rename(state_abb = state)
washpost$agency_name <- washpost$city
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
         population_1) %>%
  filter(population_1 != 0)
ucr$census_name <- gsub(" city.*| town.*| municipality.*| borough.*", "", ucr$census_name)

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

duplicated_ids <- combined_agency_name$id[which(duplicated(combined_agency_name$id))]
duplicated_combined_agency_name <- combined_agency_name[combined_agency_name$id %in% duplicated_ids, ]

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
duplicated_ids <- combined_census_name$id[which(duplicated(combined_census_name$id))]
duplicated_combined_census_name <- combined_census_name[combined_census_name$id %in% duplicated_ids, ]

missing_ids <- missing_ids[!missing_ids$id %in% combined_census_name$id, ]


