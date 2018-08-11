load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known/ucr_offenses_known_yearly_1960_2016.rda")
setwd("C:/Users/user/Dropbox/R_project/aspep/data")
# To get real county name
aspep_county <- read_csv("aspep_counties_1993_2016.csv")
aspep_county <- aspep_county[, c("fips_state_county", "county_name")]
aspep_county <- aspep_county[!duplicated(aspep_county$fips_state_county), ]
library(tidyverse)
load("C:/Users/user/Desktop/35019-0004-Data.rda")
nacjd_county_2012 <- da35019.0004

ucr_offenses_known_yearly_1960_2016$population_2[is.na(ucr_offenses_known_yearly_1960_2016$population_2)] <- 0

county_crime_2010_2016 <- get_county_crime(2010:2016)
summary(county_crime_2010_2016)
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data")
readr::write_csv(county_crime_2010_2016,
                 path = "county_crime_2010_2016.csv")
get_county_crime <- function(years) {

  ucr <-
    ucr_offenses_known_yearly_1960_2016 %>%
    dplyr::filter(year %in% years,
                  months_reported != "no months reported",
                  group_number != "possessions") %>%
    dplyr::select(-matches("clr|found|^county_|population_"),
                  -ori9,
                  -date,
                  -fips_place_code,
                  -fips_state_place_code,
                  -agency_type,
                  -agency_subtype_1,
                  -agency_subtype_2,
                  -covered_by_code,
                  -field_office,
                  -city_sequence_number,
                  -msa_1,
                  -msa_2,
                  -msa_3,
                  -special_mailing_group,
                  -mailing_address_line_1,
                  -mailing_address_line_2,
                  -mailing_address_line_3,
                  -mailing_address_line_4,
                  -special_mailing_address,
                  -division,
                  -core_city_indication,
                  -fips_state_county_code,
                  -month,
                  -zip_code) %>%
    dplyr::mutate(months_reported_num = stringr::str_replace_all(months_reported,
                                                                 month_to_number),
                  months_reported_num = as.numeric(months_reported_num),
                  group_number        = stringr::str_replace_all(group_number,
                                                                 new_groups)
    ) %>%
    dplyr::filter((!(total_population == 0 & months_reported_num < 3)))

  crime_cols <- grep("act_|officers", names(ucr), value = TRUE)
  for (col in crime_cols) {
    # If only reported 1 or 2 months, zeroes out crime count
    # to be imputed later
    ucr[, col][ucr$months_reported_num %in% 1:2] <- 0
    # Otherwise impute missing months
    ucr[, col] <- ucr[, col] * (12 / ucr$months_reported_num)
    ucr[, col] <- round(ucr[, col])
  }

  full_year_reporters <-
    ucr %>%
    dplyr::filter(months_reported_num == 12) %>%
    dplyr::group_by(fips_state_code,
                    group_number,
                    year) %>%
    dplyr::summarize_at(vars(matches("act_")), median) %>%
    dplyr::mutate_at(vars(matches("act_")), round)

  ucr_under_3_months <-
    ucr %>%
    dplyr::filter(ucr$months_reported_num %in% 1:2) %>%
    dplyr::select(ori,
                  fips_county_code,
                  total_population,
                  months_reported_num,
                  state,
                  state_abb,
                  months_reported,
                  fips_state_code,
                  year,
                  group_number) %>%
    dplyr::left_join(full_year_reporters)

  ucr <-
    ucr %>%
    dplyr::filter(!ucr$months_reported_num %in% 1:2) %>%
    bind_rows(ucr_under_3_months) %>%
    dplyr::select(-ori,
                  -group_number,
                  -months_reported,
                  -months_reported_num,
                  -agency_name
    ) %>%
    dplyr::group_by(year,
                    fips_state_code,
                    fips_county_code,
                    state,
                    state_abb
    ) %>%
    dplyr::summarize_all(sum) %>%
    dplyr::mutate(fips_state_county = paste0(fips_state_code, fips_county_code)) %>%
    dplyr::left_join(aspep_county) %>%
    dplyr::select(year,
                  state,
                  state_abb,
                  county_name,
                  fips_state_code,
                  fips_county_code,
                  fips_state_county,
                  everything()) %>%
    dplyr::arrange(fips_state_county)

  return(ucr)
}

month_to_number <- c(
  "january is the last month reported"   = "1",
  "february is the last month reported"  = "2",
  "march is the last month reported"     = "3",
  "april is the last month reported"     = "4",
  "may is the last month reported"       = "5",
  "june is the last month reported"      = "6",
  "july is the last month reported"      = "7",
  "august is the last month reported"    = "8",
  "september is the last month reported" = "9",
  "october is the last month reported"   = "10",
  "november is the last month reported"  = "11",
  "december is the last month reported"  = "12"
)

new_groups <- c(
  "^city 250,000 thru 499,999$"           = "cities 250,000 and over",
  "^non-msa county 100,000\\+$"           = "nsa-msa counties and msa state police",
  "^msa county 100,000\\+$"               = "msa counties and msa state police",
  "^msa county 10,000 thru 24,999$"       = "msa counties and msa state police",
  "^msa county under 10,000$"             = "msa counties and msa state police",
  "^msa state police$"                    = "msa counties and msa state police",
  "^msa county 25,000 thru 99,999$"       = "msa counties and msa state police",
  "^non-msa county under 10,000$"         = "nsa-msa counties and msa state police",
  "^non-msa county 10,000 thru 24,999$"   = "nsa-msa counties and msa state police",
  "^non-msa county 25,000 thru 99,999$"   = "nsa-msa counties and msa state police",
  "^city 1,000,000\\+$"                   = "cities 250,000 and over",
  "^city 500,000 thru 999,999$"           = "cities 250,000 and over",
  "^non-msa state police$"                = "nsa-msa counties and msa state police"
)
