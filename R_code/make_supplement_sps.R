setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/supplement")
column_positions <- c(starting_numbers,
                      final_month_numbers)
column_names <- c(starting_names,
                  final_month_names)
asciiSetupReader::make_sps_setup(file_name = "supplement_to_return_a",
                                 col_positions = column_positions,
                                 col_labels    = column_names)



starting_names <- c("identifier_code",
                    "state",
                    "ori",
                    "group",
                    "division",
                    "year",
                    "msa",
                    "agency_name",
                    "agency_state_name",
                    "population")

starting_numbers <- c("1",
                      "2-3",
                      "4-10",
                      "11-12",
                      "13",
                      "14-15",
                      "16-18",
                      "19-42",
                      "43-48",
                      "49-57")

month_names <- c("status",
                 "offenses_murder",
                 "offenses_rape",

                 "offenses_robbery_highway",
                 "offenses_robbery_house",
                 "offenses_robbery_gas_station",
                 "offenses_robbery_chain_store",
                 "offenses_robbery_residence",
                 "offenses_robbery_bank",
                 "offenses_robbery_misc",
                 "offenses_robbery_total",

                 "offenses_burg_resident_night",
                 "offenses_burg_resident_day",
                 "offenses_burg_resident_unk",
                 "offenses_burg_nonresident_night",
                 "offenses_burg_nonresident_day",
                 "offenses_burg_nonresident_unk",
                 "offenses_burg_total",

                 "offenses_theft_over_200",
                 "offenses_theft_50_to_200",
                 "offenses_theft_under_50",
                 "offenses_theft_total",

                 "offenses_motor_vehicle_theft",
                 "offenses_theft_pick_pocket",
                 "offenses_theft_purse_snatch",
                 "offenses_theft_shoplift",
                 "offenses_theft_from_auto",
                 "offenses_theft_auto_part",
                 "offenses_theft_bicycle",
                 "offenses_theft_from_building",
                 "offenses_theft_coin_machine",
                 "offenses_theft_all_other",

                 "value_murder",
                 "value_rape",

                 "value_robbery_highway",
                 "value_robbery_house",
                 "value_robbery_gas_station",
                 "value_robbery_chain_store",
                 "value_robbery_residence",
                 "value_robbery_bank",
                 "value_robbery_misc",
                 "value_robbery_total",

                 "value_burg_resident_night",
                 "value_burg_resident_day",
                 "value_burg_resident_unk",
                 "value_burg_nonresident_night",
                 "value_burg_nonresident_day",
                 "value_burg_nonresident_unk",
                 "value_burg_total",

                 "value_theft_over_200",
                 "value_theft_50_to_200",
                 "value_theft_under_50",
                 "value_theft_total",
                 "value_motor_vehicle_theft",
                 "value_total_all_values",

                 "value_theft_pick_pocket",
                 "value_theft_purse_snatch",
                 "value_theft_shoplift",
                 "value_theft_from_auto",
                 "value_theft_auto_part",
                 "value_theft_bicycle",
                 "value_theft_from_building",
                 "value_theft_coin_machine",
                 "value_theft_all_other",

                 "auto_stolen_recover_local",
                 "auto_stolen_recovered_other",
                 "auto_theft_total",
                 "auto_stole_oth_recover_local",

                 "value_stolen_currency",
                 "value_stolen_jewel_metal",
                 "value_stolen_clothing_or_fur",
                 "value_stolen_local_mtr_veh",
                 "value_stolen_office_equip",
                 "value_stolen_tv_and_radio",
                 "value_stolen_guns",
                 "value_stolen_household_good",
                 "value_stolen_consumable_good",
                 "value_stolen_livestock",
                 "value_stolen_misc",
                 "value_stolen_total",

                 "value_recovered_currency",
                 "value_recovered_jewel_metal",
                 "value_recovered_clothing_or_fur",
                 "value_recovered_local_mtv_veh",
                 "value_recovered_office_equip",
                 "value_recovered_tv_and_radio",
                 "value_recovered_guns",
                 "value_recovered_house_good",
                 "value_recovered_consumable_good",
                 "value_recovered_livestock",
                 "value_recovered_misc",
                 "value_recovered_total",
                 "fbi_batch_number")

month_numbers <- c("58-58",
                   "59-65",
                   "66-72",

                   "73-79",
                   "80-86",
                   "87-93",
                   "94-100",
                   "101-107",
                   "108-114",
                   "115-121",
                   "122-128",

                   "129-135",
                   "136-142",
                   "143-149",
                   "150-156",
                   "157-163",
                   "164-170",
                   "171-177",
                   "178-184",
                   "185-191",
                   "192-198",
                   "199-205",

                   "206-212",

                   "213-219",
                   "220-226",
                   "227-233",
                   "234-240",
                   "241-247",
                   "248-254",
                   "255-261",
                   "262-268",
                   "269-275",

                   "276-284",
                   "285-293",

                   "294-302",
                   "303-311",
                   "312-320",
                   "321-329",
                   "330-338",
                   "339-347",
                   "348-356",
                   "357-365",

                   "366-374",
                   "375-383",
                   "384-392",
                   "393-401",
                   "402-410",
                   "411-419",
                   "420-428",

                   "429-437",
                   "438-446",
                   "447-455",
                   "456-464",

                   "465-473",
                   "474-482",

                   "483-491",
                   "492-500",
                   "501-509",
                   "510-518",
                   "519-527",
                   "528-536",
                   "537-545",
                   "546-554",

                   "555-563",
                   "564-570",
                   "571-577",
                   "578-584",
                   "585-591",

                   "592-600",
                   "601-609",
                   "610-618",
                   "619-627",
                   "628-636",
                   "637-645",
                   "646-654",
                   "655-663",
                   "664-672",
                   "673-681",
                   "682-690",
                   "691-699",

                   "700-708",
                   "709-717",
                   "718-726",
                   "727-735",
                   "736-744",
                   "745-753",
                   "754-762",
                   "763-771",
                   "772-780",
                   "781-789",
                   "790-798",
                   "799-807",
                   "808-810")

final_month_names <- c(paste0("jan_", month_names))
final_month_numbers <- c(month_numbers)
adder <- 753
for (i in 2:12) {
  month <- tolower(month.abb)[i]
  temp_names <- paste0(month, "_", month_names)

  numbers_start <- stringr::str_split_fixed(month_numbers, "-", 2)[, 1]
  numbers_start <- as.numeric(numbers_start)
  numbers_start <- numbers_start + adder

  numbers_end   <- stringr::str_split_fixed(month_numbers, "-", 2)[, 2]
  numbers_end   <- as.numeric(numbers_end)
  numbers_end   <- numbers_end + adder
  temp_numbers  <- paste0(numbers_start, "-", numbers_end)

  final_month_names   <- c(final_month_names, temp_names)
  final_month_numbers <- c(final_month_numbers, temp_numbers)
  adder <- adder + 753
}

