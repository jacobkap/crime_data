

make_num_months_reported <- function(data) {
  status_cols <- grep("status", names(data), value = TRUE)

  data$number_of_months_reported <- 0
  for (col in status_cols) {
    # Some old years (1966-1973) have a 2 option which seems to
    # be they report offenses but not value.
    value <- data[, col]
    value[data[, col] %in% "not reported"]  <- 0
    value[data[, col] %in% "regular"] <- 1
    value[!data[, col] %in% "regular"]  <- 0
    value <- as.numeric(value)

    data$number_of_months_reported <- data$number_of_months_reported + value
  }
  return(data)
}

agency_desc_cols <- c(
  "ori9",
  "number_of_months_reported",
  "census_name",
  "crosswalk_agency_name",
  "state",
  "agency_name",
  "year",
  "population",
  "population_group",
  "country_division",
  "msa",
  "report_indicator",
  "fbi_batch_number",
  "fips_state_code",
  "fips_county_code",
  "fips_state_county_code",
  "fips_place_code",
  "agency_type",
  "longitude",
  "latitude",
  "address_name",
  "address_street_line_1",
  "address_street_line_2",
  "address_city",
  "address_state",
  "address_zip_code"
)

offense_col_order <- c(
  "offenses_burglary_resident_day",
  "offenses_burglary_resident_night",
  "offenses_burglary_resident_unknown",
  "offenses_burglary_nonresident_day",
  "offenses_burglary_nonresident_night",
  "offenses_burglary_nonresident_unknown",
  "offenses_burglary_total",

  "offenses_motor_vehicle_theft",
  "offenses_murder",
  "offenses_rape",

  "offenses_robbery_bank",
  "offenses_robbery_chain_store",
  "offenses_robbery_gas_station",
  "offenses_robbery_highway",
  "offenses_robbery_house",
  "offenses_robbery_miscellaneous",
  "offenses_robbery_residence",
  "offenses_robbery_total",

  "offenses_theft_under_50",
  "offenses_theft_50_to_200",
  "offenses_theft_over_200",
  "offenses_theft_total",
  "offenses_theft_auto_part",
  "offenses_theft_bicycle",
  "offenses_theft_coin_machine",
  "offenses_theft_from_auto",
  "offenses_theft_from_building",
  "offenses_theft_picking_pocket",
  "offenses_theft_purse_snatching",
  "offenses_theft_shoplifting",
  "offenses_theft_all_other",

  "auto_theft_total",
  "auto_stolen_and_recovered_locally",
  "auto_stolen_and_recovered_other_agency",
  "auto_stole_other_agency_and_recovered_locally"
)

value_col_order <- c(
  "value_burglary_resident_night",
  "value_burglary_resident_day",
  "value_burglary_resident_unknown",
  "value_burglary_nonresident_night",
  "value_burglary_nonresident_day",
  "value_burglary_nonresident_unknown",
  "value_burglary_total",

  "value_motor_vehicle_theft",
  "value_murder",
  "value_rape",

  "value_robbery_bank",
  "value_robbery_chain_store",
  "value_robbery_gas_station",
  "value_robbery_highway",
  "value_robbery_house",
  "value_robbery_miscellaneous",
  "value_robbery_residence",
  "value_robbery_total",

  "value_theft_under_50",
  "value_theft_50_to_200",
  "value_theft_over_200",
  "value_theft_total",

  # Is total value for all above categories
  "value_total_all_values",

  # Not included in value_total_all_values
  "value_theft_auto_part",
  "value_theft_bicycle",
  "value_theft_coin_machine",
  "value_theft_from_auto",
  "value_theft_from_building",
  "value_theft_picking_pocket",
  "value_theft_purse_snatching",
  "value_theft_shoplifting",
  "value_theft_all_other",

  "value_stolen_clothing_or_fur",
  "value_stolen_consumable_good",
  "value_stolen_currency",
  "value_stolen_guns",
  "value_stolen_household_good",
  "value_stolen_jewelry_metal",
  "value_stolen_livestock",
  "value_stolen_local_motor_vehicle",
  "value_stolen_miscellaneous",
  "value_stolen_office_equipment",
  "value_stolen_tv_and_radio",
  "value_stolen_total",

  "value_recovered_clothing_or_fur",
  "value_recovered_consumable_good",
  "value_recovered_currency",
  "value_recovered_guns",
  "value_recovered_household_good",
  "value_recovered_jewelry_metal",
  "value_recovered_livestock",
  "value_recovered_local_motor_vehicle",
  "value_recovered_miscellaneous",
  "value_recovered_office_equipment",
  "value_recovered_tv_and_radio",
  "value_recovered_total"
)
