library(tidyverse)

# To get real county name - not necessary, just helpful!
setwd("C:/Users/user/Dropbox/R_project/aspep/data")
aspep_county <- readr::read_csv("aspep_counties_1993_2016.csv")
aspep_county <- aspep_county[, c("fips_state_county", "county_name")]
aspep_county <- aspep_county[!duplicated(aspep_county$fips_state_county), ]

population_group_fix <- c(
  # MSA counties
  "^msa county under 10,000$"             = "msa counties and msa state police",
  "^msa county 10,000 thru 24,999$"       = "msa counties and msa state police",
  "^msa county 25,000 thru 99,999$"       = "msa counties and msa state police",
  "^msa county 100,000\\+$"               = "msa counties and msa state police",
  "^msa state police$"                    = "msa counties and msa state police",

  # Non-MSA counties
  "^non-msa county under 10,000$"         = "nsa-msa counties and msa state police",
  "^non-msa county 10,000 thru 24,999$"   = "nsa-msa counties and msa state police",
  "^non-msa county 25,000 thru 99,999$"   = "nsa-msa counties and msa state police",
  "^non-msa county 100,000\\+$"           = "nsa-msa counties and msa state police",
  "^non-msa state police$"                = "nsa-msa counties and msa state police",

  # Cities
  "^city 250,000 thru 499,999$"           = "cities 250,000 and over",
  "^city 500,000 thru 999,999$"           = "cities 250,000 and over",
  "^city 1,000,000\\+$"                   = "cities 250,000 and over"
)
