supplement_remove_missing <- function(column) {
  column[column %in% c(1000,
                       2000,
                       3000,
                       4000,
                       5000,
                       6000,
                       7000,
                       8000,
                       9000,
                       10000,
                       20000,
                       30000,
                       40000,
                       50000,
                       60000,
                       70000,
                       80000,
                       90000,
                       100000,
                       99942)] <- NA
  return(column)
}

make_num_months_reported <- function(data) {
  status_cols <- grep("status", names(data), value = TRUE)

  data$number_of_months_reported <- 0
  for (col in status_cols) {
    # Some old years (1966-1973) have a 2 option which seems to
    # be they report offenses but not value.
    value <- data[, col]
    value[value %in% "not reported"]  <- 0
    value[value %in% c("regular", 2)] <- 1
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
  "offenses_burg_resident_day",
  "offenses_burg_resident_night",
  "offenses_burg_resident_unk",
  "offenses_burg_nonresident_day",
  "offenses_burg_nonresident_night",
  "offenses_burg_nonresident_unk",
  "offenses_burg_total",

  "offenses_motor_vehicle_theft",
  "offenses_murder",
  "offenses_rape",

  "offenses_robbery_bank",
  "offenses_robbery_chain_store",
  "offenses_robbery_gas_station",
  "offenses_robbery_highway",
  "offenses_robbery_house",
  "offenses_robbery_misc",
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
  "offenses_theft_pick_pocket",
  "offenses_theft_purse_snatch",
  "offenses_theft_shoplift",
  "offenses_theft_all_other",

  "auto_stolen_recover_local",
  "auto_stolen_recovered_other",
  "auto_theft_total",
  "auto_stole_oth_recover_local"
)

value_col_order <- c(
  "value_burg_resident_night",
  "value_burg_resident_day",
  "value_burg_resident_unk",
  "value_burg_nonresident_night",
  "value_burg_nonresident_day",
  "value_burg_nonresident_unk",
  "value_burg_total",

  "value_motor_vehicle_theft",
  "value_murder",
  "value_rape",

  "value_robbery_bank",
  "value_robbery_chain_store",
  "value_robbery_gas_station",
  "value_robbery_highway",
  "value_robbery_house",
  "value_robbery_misc",
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
  "value_theft_pick_pocket",
  "value_theft_purse_snatch",
  "value_theft_shoplift",
  "value_theft_all_other",

  "value_stolen_clothing_or_fur",
  "value_stolen_consumable_good",
  "value_stolen_currency",
  "value_stolen_guns",
  "value_stolen_household_good",
  "value_stolen_jewel_metal",
  "value_stolen_livestock",
  "value_stolen_local_mtr_veh",
  "value_stolen_misc",
  "value_stolen_office_equip",
  "value_stolen_tv_and_radio",
  "value_stolen_total",

  "value_recovered_clothing_or_fur",
  "value_recovered_consumable_good",
  "value_recovered_currency",
  "value_recovered_guns",
  "value_recovered_house_good",
  "value_recovered_jewel_metal",
  "value_recovered_livestock",
  "value_recovered_local_mtv_veh",
  "value_recovered_misc",
  "value_recovered_office_equip",
  "value_recovered_tv_and_radio",
  "value_recovered_total"
)
