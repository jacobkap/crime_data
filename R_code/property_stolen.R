devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(tidyverse)
setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/property_stolen")
for (year in 1998:2015) {
  data <- spss_ascii_reader(paste0("ucr_property_stolen_",
                                    year, ".txt"),
                             paste0("ucr_property_stolen_", year,
                                    ".sps"))
  data <-
    data %>%
    dplyr::rename_all(tolower)
  print(paste(year, "     cols:", ncol(data), "     rows:", nrow(data)))
}

make_property_stolen_yearly <- function(data, property_stolen_monthly_cols) {
  for (col in property_stolen_monthly_cols) {
    monthly_col       <- grep(col, names(data), value = TRUE)
    col               <- gsub("\\$", "", col)
  #  data[, col]       <- rowSums(data[, monthly_col], na.rm = TRUE)
  #  data              <- data[, -monthly_col]
    if (length(monthly_col) != 12) message(col)
  }
  return(data)
}

property_stolen_monthly_cols <- c("murder_offenses$",
                                  "rape_offenses$",
                                  "robbery_offenses_highway$",
                                  "robbery_offenses_common_house$",
                                  "robbery_offenses_gas_station$",
                                  "robbery_offenses_chain_store$",
                                  "robbery_offenses_residence$",
                                  "robbery_offenses_bank$",
                                  "robbery_offenses_miscellaneous$",
                                  "robbery_offenses_total_robbery$",
                                  "burglary_offenses_resident_night$",
                                  "burglary_offenses_resident_day$",
                                  "burglary_offenses_resident_unknown$",
                                  "burglary_offenses_non_resident_night$",
                                  "burglary_offenses_non_resident_day$",
                                  "burglary_offenses_non_resident_unknown$",
                                  "burglary_offenses_total_burglary$",
                                  "larceny_offenses_over_200$",
                                  "larceny_offenses_between_50_to_200$",
                                  "larceny_offenses_under_50$",
                                  "total_larceny_used_for_larceny_suppl$",
                                  "motor_vehicle_theft$",
                                  "larceny_analysis_pocket_picking$",
                                  "larceny_analysis_purse_snatching$",
                                  "larceny_analysis_shoplifting$",
                                  "larceny_analysis_from_auto$",
                                  "larceny_analysis_auto_accessories$",
                                  "larceny_analysis_bicycle$",
                                  "larceny_analysis_from_building$",
                                  "larceny_analysis_coin_machine$",
                                  "larceny_analysis_all_other$",
                                  "murder_value$",
                                  "rape_value$",
                                  "robbery_value_highway$",
                                  "robbery_value_common_house$",
                                  "robbery_value_gas_station$",
                                  "robbery_value_chain_store$",
                                  "robbery_value_residence$",
                                  "robbery_value_bank$",
                                  "robbery_value_miscellaneous$",
                                  "robbery_value_total_robbery_value$",
                                  "burglary_value_resident_night$",
                                  "burglary_value_resident_day$",
                                  "burglary_value_resident_unknown$",
                                  "burglary_value_non_resident_night$",
                                  "burglary_value_non_resident_day$",
                                  "burglary_value_non_resident_unknown$",
                                  "burglary_value_total_burglary_value$",
                                  "value_over_200$",
                                  "larceny_value_between_50_to_200$",
                                  "larceny_value_under_50$",
                                  "total_larceny_value$",
                                  "motor_vehicle_theft_value$",
                                  "total_value_above$",
                                  "analysis_value_pocket_picking$",
                                  "analysis_value_purse_snatching$",
                                  "analysis_value_shoplifting$",
                                  "analysis_value_from_auto$",
                                  "analysis_value_auto_accessories$",
                                  "analysis_value_bicycle$",
                                  "analysis_value_from_building$",
                                  "analysis_value_coin_machine$",
                                  "analysis_value_all_other$",
                                  "auto_stolen_and_recovered_locally$",
                                  "auto_stolen_and_recovered_other$",
                                  "total$",
                                  "auto_stolen_other_and_recovered_locally$",
                                  "currency$",
                                  "jewelry_and_precious_metals$",
                                  "clothing$",
                                  "locally_stolen_motor_vehicles$",
                                  "office_equipment$",
                                  "televisions_radios_stereos$",
                                  "firearms$",
                                  "household_goods$",
                                  "consumable_goods$",
                                  "livestock$",
                                  "miscellaneous$",
                                  "total_value_stolen$",
                                  "currency$",
                                  "jewelry_and_precious_metals$",
                                  "clothing$",
                                  "locally_stolen_motor_vehicles$",
                                  "office_equipment$",
                                  "televisions_radios_stereos$",
                                  "firearms$",
                                  "household_goods$",
                                  "consumable_goods$",
                                  "livestock$",
                                  "miscellaneous$",
                                  "total_value_stolen$" )
