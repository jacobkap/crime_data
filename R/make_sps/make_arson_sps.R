source('C:/Users/user/Dropbox/R_project/crime_data/R/make_sps/make_sps_utils.R')

starting_nums <- c("1",
                   "2-3",
                   "4-10",
                   "11-12",
                   "13",
                   "14-15",
                   "16-20",
                   "21",
                   "22-28",
                   "29",
                   "30-32",
                   "33-35",
                   "36-40",
                   "41-49",
                   "50-51",
                   "52-75",
                   "76-81")

starting_names <- c("identifier_code",
                    "state",
                    "ori",
                    "population_group",
                    "country_division",
                    "year",
                    "sequence_number",
                    "core_city_indicator",
                    "covered_by_ori",
                    "covered_by_group",
                    "msa",
                    "county",
                    "agency_count",
                    "population",
                    "number_of_months_reported",
                    "agency_name",
                    "state_name")


monthly_indicator_nums <- c("82-83",
                            "84-89",
                            "90",
                            "91",
                            "92",
                            "93",
                            "94",
                            "95",
                            "96",
                            "97",
                            "98",
                            "99",
                            "100",
                            "101",
                            "102",
                            "103")

monthly_indicator_names <- c("month_included_in",
                             "date_of_last_update",
                             "column_2_type",
                             "column_3_type",
                             "column_4_type",
                             "column_5_type",
                             "column_6_type",
                             "column_7_type",
                             "column_8_type",
                             "column_2_pt",
                             "column_3_pt",
                             "column_4_pt",
                             "column_5_pt",
                             "column_6_pt",
                             "column_7_pt",
                             "column_8_pt")

location_types <- c("single_occupancy",
                    "other_residential",
                    "storage",
                    "industrial",
                    "other_commercial",
                    "community_public",
                    "all_oth_structures",
                    "total_structures",
                    "motor_vehicles",
                    "other_mobile",
                    "total_mobile",
                    "all_other",
                    "grand_total")
abandoned_types <- c("single_occupancy",
                     "other_residential",
                     "storage",
                     "industrial",
                     "other_commercial",
                     "community_public",
                     "all_oth_structures",
                     "total_structures",
                     "grand_total")
single_month_names <- c(monthly_indicator_names,
                        paste0("reported_", location_types),
                        paste0("unfounded_", location_types),
                        paste0("actual_", location_types),
                        paste0("cleared_", location_types),
                        paste0("cleared_18_", location_types),
                        paste0("uninhabited_", abandoned_types),
                        paste0("est_damage_", location_types))
jan_month_names <- paste0("jan_", single_month_names)
feb_month_names <- paste0("feb_", single_month_names)
mar_month_names <- paste0("mar_", single_month_names)
apr_month_names <- paste0("apr_", single_month_names)
may_month_names <- paste0("may_", single_month_names)
jun_month_names <- paste0("jun_", single_month_names)
jul_month_names <- paste0("jul_", single_month_names)
aug_month_names <- paste0("aug_", single_month_names)
sep_month_names <- paste0("sep_", single_month_names)
oct_month_names <- paste0("oct_", single_month_names)
nov_month_names <- paste0("nov_", single_month_names)
dec_month_names <- paste0("dec_", single_month_names)

all_month_names <- c(jan_month_names,
                     feb_month_names,
                     mar_month_names,
                     apr_month_names,
                     may_month_names,
                     jun_month_names,
                     jul_month_names,
                     aug_month_names,
                     sep_month_names,
                     oct_month_names,
                     nov_month_names,
                     dec_month_names)

monthly_value_nums <- c("104-108",
                        "109-113",
                        "114-118",
                        "119-123",
                        "124-128",
                        "129-133",
                        "134-138",
                        "139-143",
                        "144-148",
                        "149-153",
                        "154-158",
                        "159-163",
                        "164-168")

monthly_value_nums <- c(monthly_value_nums,
                        setup_num_adder(monthly_value_nums,
                                        adder = 65,
                                        iterations = 4))

uninhabited_and_damage_nums <- c("429-433",
                                 "434-438",
                                 "439-443",
                                 "444-448",
                                 "449-453",
                                 "454-458",
                                 "459-463",
                                 "464-468",
                                 "469-473",
                                 "474-484",
                                 "485-495",
                                 "496-506",
                                 "507-517",
                                 "518-528",
                                 "529-539",
                                 "540-550",
                                 "551-561",
                                 "562-572",
                                 "573-583",
                                 "584-594",
                                 "595-605",
                                 "606-616")

total_single_month_nums <- c(monthly_indicator_nums,
                             monthly_value_nums,
                             uninhabited_and_damage_nums)


all_month_nums <- c(total_single_month_nums,
                    setup_num_adder(total_single_month_nums,
                                    adder = 535,
                                    iterations = 11))


col_positions <- c(starting_nums,
                   all_month_nums)

col_labels <- c(starting_names,
                all_month_names)


setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/arson_from_fbi")
asciiSetupReader::make_sps_setup(file_name     = "ucr_arson",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = state_group_division_value_labels)
setwd("C:/Users/user/Dropbox/R_project/crime_data/setup_files")
asciiSetupReader::make_sps_setup(file_name     = "ucr_arson",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = state_group_division_value_labels)
