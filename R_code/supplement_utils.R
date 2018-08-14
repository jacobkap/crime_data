supplement_month_wide_to_long <- function(data) {
  crime_cols <- grep("offenses|value|auto|status|fbi", names(data), value = TRUE)
  crime_only_data <- data[, crime_cols]
  data <- data %>% dplyr::select(-one_of(crime_cols))

  final <- data.frame()
  for (month in tolower(month.abb)) {
    temp        <- crime_only_data[, grep(paste0("^", month, "_"), crime_cols)]
    names(temp) <- gsub("^....", "", names(temp))
    temp        <- dplyr::bind_cols(data, temp)
    temp$month  <- tolower(month.name)[tolower(month.abb) == month]
    temp$date   <- lubridate::ymd(paste(temp$year, temp$month, "1"))
    temp$date   <- as.character(temp$date)

    final       <- dplyr::bind_rows(final, temp)
  }
  return(final)
}

supplement_remove_missing <- function(column) {
  column[column %in% c(1000, 2000, 3000, 4000, 5000,
                       6000, 7000, 8000, 9000, 10000,
                       20000, 30000, 40000, 50000, 60000,
                       70000, 80000, 90000, 100000,
                       99942)] <- NA
  return(column)
}

supplement_negatives <- c("000000+\\}"                = "0",
                          "000000+j"                  = "-1",
                          "000000+k"                  = "-2",
                          "000000+l"                  = "-3",
                          "000000+m"                  = "-4",
                          "000000+n"                  = "-5",
                          "000000+o"                  = "-6",
                          "000000+p"                  = "-7",
                          "000000+q"                  = "-8",
                          "000000+r"                  = "-9",
                          "000000+1\\}"               = "-10",
                          "000000+1j"                 = "-11",
                          "000000+1k"                 = "-12",
                          "000000+1l"                 = "-13",
                          "000000+1m"                 = "-14",
                          "000000+1n"                 = "-15",
                          "zero or not reported"      = "0")

supplement_group <- c(
  "^0$"  = "possession",
  "^1$"  = "city 250,000+",
  "^1a$" = "city 1,000,000+",
  "^1b$" = "city 500,000 thru 999,999",
  "^1c$" = "city 250,000 thru 499,999",
  "^2$"  = "city 100,000 thru 249,999",
  "^3$"  = "city 50,000 thru 99,999",
  "^4$"  = "city 25,000 thru 49,999",
  "^5$"  = "city 10,000 thru 24,999",
  "^6$"  = "city 2,500 thru 9,999",
  "^7$"  = "city under 2,500",
  "^8$"  = "non-msa county",
  "^8a$" = "non-msa county 100,000+",
  "^8b$" = "non-msa county 25,000 thru 99,999",
  "^8c$" = "non-msa county 10,000 thru 24,999",
  "^8d$" = "non-msa county under 10,000",
  "^8e$" = "non-msa state police",
  "^9$"  = "msa county",
  "^9a$" = "msa county 100,000+",
  "^9b$" = "msa county 25,000 thru 99,999",
  "^9c$" = "msa county 10,000 thru 24,999",
  "^9d$" = "msa county under 10,000",
  "^9e$" = "msa state police",
  "^2c$" = NA
)

supplement_division <- c(
  "^0$" = "possessions",
  "^1$" = "new england",
  "^2$" = "middle atlantic",
  "^3$" = "east north central",
  "^4$" = "west north central",
  "^5$" = "south atlantic",
  "^6$" = "east south central",
  "^7$" = "west south central",
  "^8$" = "mountain",
  "^9$" = "pacific",

  "^a$" = "new england",
  "^b$" = "middle atlantic",
  "^c$" = "east north central",
  "^d$" = "west north central",
  "^e$" = "south atlantic",
  "^f$" = "east south central",
  "^g$" = "west south central",
  "^h$" = "mountain",
  "^i$" = "pacific"
)

supplement_status <- c(
  "^0$" = "not reported",
  "^1$" = "regular"
)

supplement_states <- c(
  "^01$" = "alabama",
  "^02$" = "arizona",
  "^03$" = "arkansas",
  "^04$" = "california",
  "^05$" = "colorado",
  "^06$" = "connecticut",
  "^07$" = "delaware",
  "^08$" = "district of columbia",
  "^09$" = "florida",
  "^10$" = "georgia",
  "^11$" = "idaho",
  "^12$" = "illinois",
  "^13$" = "indiana",
  "^14$" = "iowa",
  "^15$" = "kansas",
  "^16$" = "kentucky",
  "^17$" = "louisiana",
  "^18$" = "maine",
  "^19$" = "maryland",
  "^20$" = "massachusetts",
  "^21$" = "michigan",
  "^22$" = "minnesota",
  "^23$" = "mississippi",
  "^24$" = "missouri",
  "^25$" = "montana",
  "^26$" = "nebraska",
  "^27$" = "nevada",
  "^28$" = "new hampshire",
  "^29$" = "new jersey",
  "^30$" = "new mexico",
  "^31$" = "new york",
  "^32$" = "north carolina",
  "^33$" = "north dakota",
  "^34$" = "ohio",
  "^35$" = "oklahoma",
  "^36$" = "oregon",
  "^37$" = "pennsylvania",
  "^38$" = "rhode island",
  "^39$" = "south carolina",
  "^40$" = "south dakota",
  "^41$" = "tennessee",
  "^42$" = "texas",
  "^43$" = "utah",
  "^44$" = "vermont",
  "^45$" = "virginia",
  "^46$" = "washington",
  "^47$" = "west virginia",
  "^48$" = "wisconsin",
  "^49$" = "wyoming",
  "^50$" = "alaska",
  "^51$" = "hawaii",
  "^52$" = "canal zone",
  "^53$" = "puerto rico",
  "^54$" = "american samoa",
  "^55$" = "guam",
  "^62$" = "virgin islands"
)

unzip_files <- function() {
  files <- list.files(pattern = ".zip")
  for (file in files) {
    unzip(file)
  }
  # If not file type, sets file type as .DAT
  files <- list.files()
  temp <- grep(".y01", files, value = TRUE)
  files <- grep("\\.", files, invert = TRUE, value = TRUE)
  files <- c(files, temp)
  for (file in files) {
    new_name <- file
    new_name <- gsub(".y01", "", new_name)
    new_name <- paste0(new_name, ".DAT")
    file.rename(file, new_name)
  }
}

fix_negatives_supplement <- function(column) {
  column <- str_replace_all(column, supplement_negatives)
  column <- parse_number(column)
  return(column)
}

fix_status_supplement <- function(column) {
  column <- str_replace_all(column, supplement_status)
  return(column)
}

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
