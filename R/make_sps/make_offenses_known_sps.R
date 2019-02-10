source('C:/Users/user/Dropbox/R_project/crime_data/R/make_sps/make_sps_utils.R')

starting_nums <- c("1",
                   "2-3",
                   "4-10",
                   "11-12",
                   "13",
                   "14-15",
                   "16-20",
                   "21-22",
                   "23",
                   "24-30",
                   "31",
                   "32-37",
                   "38-41",
                   "42-43",
                   "44",
                   "45-53",
                   "54-56",
                   "57-59",

                   "60-68",
                   "69-71",
                   "72-74",

                   "75-83",
                   "84-86",
                   "87-89",

                   "90-98",
                   "99-107",
                   "108-116",
                   "117",
                   "118",
                   "119",
                   "120",
                   "121-144",
                   "145-150",
                   "151-180",
                   "181-210",
                   "211-240",
                   "241-270",
                   "271-275",
                   "276",
                   "277-305")

starting_names <- c("identifier_code",
                    "state",
                    "ori",
                    "population_group",
                    "country_division",
                    "year",
                    "sequence_number",
                    "juvenile_age",
                    "core_city_indication",
                    "covered_by_ori",
                    "covered_by_population_group",
                    "last_update",
                    "fbi_field_office",
                    "number_of_months_reported",
                    "agency_count",
                    "population_1",
                    "population_1_county",
                    "population_1_msa",
                    "population_2",
                    "population_2_county",
                    "population_2_msa",
                    "population_3",
                    "population_3_county",
                    "population_3_msa",
                    "last_population_1",
                    "last_population_2",
                    "last_population_3",
                    "population_source",
                    "followup_indication",
                    "special_mailing_group",
                    "special_mailing_address",
                    "agency_name",
                    "agency_state_name",
                    "first_line_of_mailing_address",
                    "second_line_of_mailing_address",
                    "third_line_of_mailing_address",
                    "fourth_line_of_mailing_address",
                    "zip_code",
                    "population_group_in_previous_year",
                    "blank")

card_types_nums <- c("306-307",
                     "308-313",
                     "314",
                     "315",
                     "316",
                     "317",
                     "318",
                     "319",
                     "320",
                     "321",
                     "322")

monthly_card_unfound_nums <- c("323-327",
                         "328-332",
                         "333-337",
                         "338-342",
                         "343-347",
                         "348-352",
                         "353-357",
                         "358-362",
                         "363-367",
                         "368-372",
                         "373-377",
                         "378-382",
                         "383-387",
                         "388-392",
                         "393-397",
                         "398-402",
                         "403-407",
                         "408-412",
                         "413-417",
                         "418-422",
                         "423-427",
                         "428-432",
                         "433-437",
                         "438-442",
                         "443-447",
                         "448-452",
                         "453-457",
                         "458-462")
monthly_card_nums <- c(monthly_card_unfound_nums,
                       setup_num_adder(monthly_card_unfound_nums, 140, 3))

card_types_names <- c("month_included_in",
                      "date_of_last_update",
                      "card_unfound_type",
                      "card_actual_type",
                      "card_tot_clr_type",
                      "card_clr_18_type",
                      "card_officers_type",
                      "card_unfound_pt",
                      "card_actual_pt",
                      "card_tot_clr_pt",
                      "card_clr_18_pt")

card_names <- c("murder",
                "manslaughter",
                "rape_total",
                "rape_by_force",
                "rape_attempted",
                "robbery_total",
                "robbery_with_a_gun",
                "robbery_with_a_knife",
                "robbery_other_weapon",
                "robbery_unarmed",
                "assault_total",
                "assault_with_a_gun",
                "assault_with_a_knife",
                "assault_other_weapon",
                "assault_unarmed",
                "assault_simple",
                "burg_total",
                "burg_force_entry",
                "burg_nonforce_entry",
                "burg_attempted",
                "theft_total",
                "mtr_veh_theft_total",
                "mtr_veh_theft_car",
                "mtr_veh_theft_truck",
                "mtr_veh_theft_other",
                "all_crimes",
                "theft_under50_dollar",
                "blank")
unfound_card_names       <- paste0("unfound_", card_names)
actual_card_names        <- paste0("actual_", card_names)
total_cleared_card_names <- paste0("tot_clr_", card_names)
cleared_18_card_names    <- paste0("clr_18_", card_names)

monthly_card_names <- c(card_types_names,
                        unfound_card_names,
                        actual_card_names,
                        total_cleared_card_names,
                        cleared_18_card_names)

officers_nums <- c("883-885",
                   "886-888",
                   "889-895")

officers_names <- c("officers_killed_by_felony",
                    "officers_killed_by_accident",
                    "officers_assaulted")

monthly_nums <- c(card_types_nums,
                  monthly_card_nums,
                  officers_nums)
monthly_names <- c(monthly_card_names,
                   officers_names)


all_month_nums <- c(monthly_nums,
                    setup_num_adder(monthly_nums, 590, 11))

jan_monthly_names <- paste0("jan_", monthly_names)
feb_monthly_names <- paste0("feb_", monthly_names)
mar_monthly_names <- paste0("mar_", monthly_names)
apr_monthly_names <- paste0("apr_", monthly_names)
may_monthly_names <- paste0("may_", monthly_names)
jun_monthly_names <- paste0("jun_", monthly_names)
jul_monthly_names <- paste0("jul_", monthly_names)
aug_monthly_names <- paste0("aug_", monthly_names)
sep_monthly_names <- paste0("sep_", monthly_names)
oct_monthly_names <- paste0("oct_", monthly_names)
nov_monthly_names <- paste0("nov_", monthly_names)
dec_monthly_names <- paste0("dec_", monthly_names)



all_month_names <- c(jan_monthly_names,
                     feb_monthly_names,
                     mar_monthly_names,
                     apr_monthly_names,
                     may_monthly_names,
                     jun_monthly_names,
                     jul_monthly_names,
                     aug_monthly_names,
                     sep_monthly_names,
                     oct_monthly_names,
                     nov_monthly_names,
                     dec_monthly_names)


col_positions <- c(starting_nums,
                   all_month_nums)

col_labels <- c(starting_names,
                all_month_names)

card_value_labels <- c( "_card_unfound_type = ",
                        "0 = not updated",
                        "2 = adjustment",
                        "4 = not available",
                        "5 = normal return",
                        "_card_actual_type = ",
                        "0 = not updated",
                        "2 = adjustment",
                        "4 = not available",
                        "5 = normal return",
                        "_card_tot_clr_type = ",
                        "0 = not updated",
                        "2 = adjustment",
                        "4 = not available",
                        "5 = normal return",
                        "_card_clr_18_type = ",
                        "0 = not updated",
                        "2 = adjustment",
                        "4 = not available",
                        "5 = normal return",
                        "_card_officers_type = ",
                        "0 = not updated",
                        "2 = adjustment",
                        "4 = not available",
                        "5 = normal return",
                        "_card_unfound_pt = ",
                        " = no return received",
                        "0 = missing",
                        "P = breakdown offenses",
                        "T = totals only",
                        "_card_actual_pt = ",
                        " = no return received",
                        "0 = missing",
                        "P = breakdown offenses",
                        "T = totals only",
                        "_card_tot_clr_pt = ",
                        " = no return received",
                        "0 = missing",
                        "P = breakdown offenses",
                        "T = totals only",
                        "_card_clr_18_pt = ",
                        " = no return received",
                        "0 = missing",
                        "P = breakdown offenses",
                        "T = totals only")
jan_card_value_labels <- gsub("^_card", "jan_card", card_value_labels)
feb_card_value_labels <- gsub("^_card", "feb_card", card_value_labels)
mar_card_value_labels <- gsub("^_card", "mar_card", card_value_labels)
apr_card_value_labels <- gsub("^_card", "apr_card", card_value_labels)
may_card_value_labels <- gsub("^_card", "may_card", card_value_labels)
jun_card_value_labels <- gsub("^_card", "jun_card", card_value_labels)
jul_card_value_labels <- gsub("^_card", "jul_card", card_value_labels)
aug_card_value_labels <- gsub("^_card", "aug_card", card_value_labels)
sep_card_value_labels <- gsub("^_card", "sep_card", card_value_labels)
oct_card_value_labels <- gsub("^_card", "oct_card", card_value_labels)
nov_card_value_labels <- gsub("^_card", "nov_card", card_value_labels)
dec_card_value_labels <- gsub("^_card", "dec_card", card_value_labels)

all_card_value_labels <- c(jan_card_value_labels,
                           feb_card_value_labels,
                           mar_card_value_labels,
                           apr_card_value_labels,
                           may_card_value_labels,
                           jun_card_value_labels,
                           jul_card_value_labels,
                           aug_card_value_labels,
                           sep_card_value_labels,
                           oct_card_value_labels,
                           nov_card_value_labels,
                           dec_card_value_labels)



return_a_value_labels <- c(state_group_division_value_labels,
                           all_card_value_labels,
                           "core_city_indication = ",
                           "Y = core city of MSA",
                           "N = not core city of MSA",
                           "followup_indication = ",
                           "Y = send a follow-up",
                           "N = do not send a follow-up",

                           "covered_by_population_group = ",
                           "0  = possessions",
                           "1  = city 250,000+",
                           "1A = city 1,000,000+",
                           "1B = city 500,000 thru 999,999",
                           "1C = city 250,000 thru 499,999",
                           "2  = city 100,000 thru 249,999",
                           "3  = city 50,000 thru 99,999",
                           "4  = city 25,000 thru 49,999",
                           "5  = city 10,000 thru 24,999",
                           "6  = city 2,500 thru 9,999",
                           "7  = city under 2,500",
                           "8  = non-msa county",
                           "8A = non-msa county 100,000+",
                           "8B = non-msa county 25,000 thru 99,999",
                           "8C = non-msa county 10,000 thru 24,999",
                           "8D = non-msa county under 10,000",
                           "8E = non-msa state police",
                           "9  = msa-county",
                           "9A = msa-county 100,000+",
                           "9B = msa-county 25,000 thru 99,999",
                           "9C = msa-county 10,000 thru 24,999",
                           "9D = msa-county under 10,000",
                           "9E = msa state police",
                           "special_mailing_group = ",
                           "0 = not a special mailing group agency.",
                           "1 = the return is to be sent to another agency.",
                           "2 = small city (groups 5 -7) to be sent a large city (groups 1 -4) form.",
                           "7 = the agency is a 'non-contributor', it is not sent forms.",
                           "9 = the agency is a contributor but not on the mailing list,they are not sent forms.",
                           "special_mailing_address = ",
                           "Y = special mailing address",
                           "N = not a special mailing address")



setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/offenses_known_from_fbi")
asciiSetupReader::make_sps_setup(file_name     = "ucr_return_a",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = return_a_value_labels)
setwd("C:/Users/user/Dropbox/R_project/crime_data/setup_files")
asciiSetupReader::make_sps_setup(file_name     = "ucr_return_a",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = return_a_value_labels)
