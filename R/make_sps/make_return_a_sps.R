setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/return_a_from_fbi")
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
                   "60-74",
                   "75-89",
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
                    "population_3",
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

monthly_nums <- c("306-307",
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

monthly_card_0_nums <- c("323-327",
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
monthly_card_nums <- c(monthly_card_0_nums,
                       setup_num_adder(monthly_card_0_nums, 140, 3))


card_names <- c("murder",
                "manslaughter",
                "rape_total",
                "rape_by_force",
                "rape_attempted",
                "robbery_total",
                "robbery_with_a_gun",
                "robbery_with_a_knife",
                "robbery_other_weapon",
                "robbery_strong_arm",
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

monthly_card_names <- c(unfound_card_names,
                        actual_card_names,
                        total_cleared_card_names,
                        cleared_18_card_names)

officers_nums <- c("883-885",
                   "886-888",
                   "889-895")

officers_names <- c("officers_killed_by_felony",
                    "officers_killed_by_accident",
                    "officers_assaulted")

monthly_nums <- c(monthly_card_nums,
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

return_a_value_labels <- c(state_group_division_value_labels,
                           "core_city_indication = ",
                           "Y = core city of MSA",
                           "N = not core city of MSA",
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
                           "9E = msa state police")

asciiSetupReader::make_sps_setup(file_name     = "ucr_return_a",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = return_a_value_labels)


