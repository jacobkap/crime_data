source('R/make_sps/make_sps_utils.R')

starting_numbers <- c("1",
                      "2-3",
                      "4-10",
                      "11-12",
                      "13",
                      "14-15",
                      "16-20",
                      "21-23",
                      "24-32",
                      "33-56",
                      "57-62",
                      "63-67",
                      "68-72",
                      "73-77",
                      "78-82",
                      "83-87",
                      "88-92",
                      "93-97",
                      "98-100",
                      "101-103")
starting_names <- c("identifier_code",
                    "state",
                    "ori",
                    "population_group",
                    "country_division",
                    "year",
                    "sequence_number",
                    "msa",
                    "population",
                    "agency_name",
                    "state_name",
                    "male_employees_officers",
                    "male_employees_civilians",
                    "male_employees_total",
                    "female_employees_officers",
                    "female_employees_civilians",
                    "female_employees_total",
                    "total_employees",
                    "officer_rate_per_1000_pop",
                    "employee_rate_per_1000_pop")


patrol_type_nums <- c("104-108",
                      "109-113",
                      "114-118",
                      "119-123",
                      "124-128")
patrol_type_nums <- c(patrol_type_nums,
                      setup_num_adder(patrol_type_nums, 25, 5))


middle_numbers <- c("254",
                    "255",
                    "256",
                    "257",
                    "258",
                    "259",
                    "260",
                    "261",
                    "262",
                    "263",
                    "264",
                    "265",
                    "266",
                    "267",
                    "268-269",
                    "270",
                    "271",
                    "272",
                    "273")

middle_names <- c("report_indicator",
                  "record_indicator",
                  "jan_month_indicator",
                  "feb_month_indicator",
                  "mar_month_indicator",
                  "apr_month_indicator",
                  "may_month_indicator",
                  "jun_month_indicator",
                  "jul_month_indicator",
                  "aug_month_indicator",
                  "sep_month_indicator",
                  "oct_month_indicator",
                  "nov_month_indicator",
                  "dec_month_indicator",
                  "month_included",
                  "covered_by",
                  "shift_data",
                  "blank",
                  "no_male_female_breakdown")

patrol_type_names <- c("one_man_vehicle_day_shift",
                       "one_man_vehicle_evening_shift",
                       "one_man_vehicle_night_shift",
                       "one_man_vehicle_other_shift",
                       "one_man_vehicle_total_shift",

                       "two_man_vehicle_day_shift",
                       "two_man_vehicle_evening_shift",
                       "two_man_vehicle_night_shift",
                       "two_man_vehicle_other_shift",
                       "two_man_vehicle_total_shift",

                       "one_man_foot_day_shift",
                       "one_man_foot_evening_shift",
                       "one_man_foot_night_shift",
                       "one_man_foot_other_shift",
                       "one_man_foot_total_shift",

                       "two_man_foot_day_shift",
                       "two_man_foot_evening_shift",
                       "two_man_foot_night_shift",
                       "two_man_foot_other_shift",
                       "two_man_foot_total_shift",

                       "other_patrols_day_shift",
                       "other_patrols_evening_shift",
                       "other_patrols_night_shift",
                       "other_patrols_other_shift",
                       "other_patrols_total_shift",

                       "total_patrols_vehicle_day_shift",
                       "total_patrols_evening_shift",
                       "total_patrols_night_shift",
                       "total_patrols_other_shift",
                       "total_patrols_total_shift")

monthly_assault_names <- c("assault_injury_indicator",
                           "assault_no_injury_indicator",
                           "officers_killed_by_felony",
                           "officers_killed_by_accident",
                           "assaults_with_injury_gun",
                           "assaults_with_injury_knife",
                           "assaults_with_injury_other_weapon",
                           "assaults_with_injury_unarmed",
                           "assaults_with_injury_total",
                           "assaults_no_injury_gun",
                           "assaults_no_injury_knife",
                           "assaults_no_injury_other_weapon",
                           "assaults_no_injury_unarmed",
                           "assaults_no_injury_total")

assault_by_call_type_names <- c("total_assaults",
                                "assault_gun",
                                "assault_knife",
                                "assault_other_weapon",
                                "assault_unarmed",
                                "two_man_veh",
                                "one_man_alone",
                                "one_man_assist",
                                "detective_alone",
                                "detective_assist",
                                "other_alone",
                                "other_assist",
                                "assaults_cleared")
disturbance_names    <- paste0("disturbance_", assault_by_call_type_names)
burglary_names       <- paste0("burglary_", assault_by_call_type_names)
robbery_names        <- paste0("robbery_", assault_by_call_type_names)
other_arrest_names     <- paste0("other_arrest_", assault_by_call_type_names)
riot_names           <- paste0("riot_", assault_by_call_type_names)
riot_names           <- gsub("riot_detective_assist",
                             'riot_detective_assiste',
                             riot_names)
prisoners_names      <- paste0("prisoner_", assault_by_call_type_names)
suspicious_names     <- paste0("suspicious_person_", assault_by_call_type_names)
ambush_names         <- paste0("ambush_", assault_by_call_type_names)
deranged_names       <- paste0("deranged_", assault_by_call_type_names)
traffic_names        <- paste0("traffic_", assault_by_call_type_names)
all_other_names      <- paste0("all_other_", assault_by_call_type_names)
total_names          <- paste0("total_", assault_by_call_type_names)
total_names          <- gsub("total_total_assaults",
                             "total_assaults_total", total_names)

time_names <- c("time_of_assault_0001_to_0200",
                "time_of_assault_0201_to_0400",
                "time_of_assault_0401_to_0600",
                "time_of_assault_0601_to_0800",
                "time_of_assault_0801_to_1000",
                "time_of_assault_1001_to_1200",
                "time_of_assault_1201_to_1400",
                "time_of_assault_1401_to_1600",
                "time_of_assault_1601_to_1800",
                "time_of_assault_1801_to_2000",
                "time_of_assault_2001_to_2200",
                "time_of_assault_2201_to_0000",
                "blank")

monthly_names <- c(monthly_assault_names,
                   disturbance_names,
                   burglary_names,
                   robbery_names,
                   other_arrest_names,
                   riot_names,
                   prisoners_names,
                   suspicious_names,
                   ambush_names,
                   deranged_names,
                   traffic_names,
                   all_other_names,
                   total_names,
                   time_names)

monthly_names <- paste0("replace_", monthly_names)
all_month_names <- repeated_label_replace_fixer(monthly_names, tolower(month.abb))


monthly_assault_intro_nums <- c("274",
                                "275",
                                "276-278",
                                "279-281")

assaults_with_injury_nums <- c("282-286",
                               "287-291",
                               "292-296",
                               "297-301",
                               "302-306")
assaults_no_injury_nums <- setup_num_adder(assaults_with_injury_nums, 25, 1)
assault_by_call_type_nums <- c("332-334",
                               "335-337",
                               "338-340",
                               "341-343",
                               "344-346",
                               "347-349",
                               "350-352",
                               "353-355",
                               "356-358",
                               "359-361",
                               "362-364",
                               "365-367",
                               "368-370")
assault_by_call_type_nums <- c(assault_by_call_type_nums,
                               setup_num_adder(assault_by_call_type_nums, 39, 10))

total_assault_call_and_time_nums <- c("761-765",
                                      "766-770",
                                      "771-775",
                                      "776-780",
                                      "781-785",
                                      "786-790",
                                      "791-795",
                                      "796-800",
                                      "801-805",
                                      "806-810",
                                      "811-815",
                                      "816-820",
                                      "821-825",
                                      # Time cols
                                      "826-830",
                                      "831-835",
                                      "836-840",
                                      "841-845",
                                      "846-850",
                                      "851-855",
                                      "856-860",
                                      "861-865",
                                      "866-870",
                                      "871-875",
                                      "876-880",
                                      "881-885",
                                      # Blank
                                      "886-891")

monthly_assault_cols <- c(monthly_assault_intro_nums,
                          assaults_with_injury_nums,
                          assaults_no_injury_nums,
                          assault_by_call_type_nums,
                          total_assault_call_and_time_nums)


all_month_numbers <- c(monthly_assault_cols,
                       setup_num_adder(monthly_assault_cols, 618, 11))


injury_no_injury_indicator_labels <- c("replace_assault_injury_indicator = ",
                                       "0 = information complete",
                                       "1 = assaults not reported",
                                       "2 = assaults reported but no breakdowns",
                                       "replace_assault_no_injury_indicator = ",
                                       "0 = information complete",
                                       "1 = assaults not reported",
                                       "2 = assaults reported but no breakdowns",
                                       "replace_month_indicator = ",
                                       "0 = normal update",
                                       "1 = not reported",
                                       "2 = reported, no data",
                                       "3 = deleted")

injury_no_injury_indicator_labels <- repeated_label_replace_fixer(injury_no_injury_indicator_labels,
                                                                  tolower(month.abb))



leoka_value_labels = c(state_group_division_value_labels,
                       "report_indicator = ",
                       "0 = for all reports",
                       "1 = city list and assault tabulations only",
                       "2 = city list only",
                       "record_indicator = ",
                       "0 = police employee data has been updated for current year",
                       "1 = not updated, no police employee data",
                       "2 = containts police employee data from previous year",
                       "covered_by = ",
                       "0 = no, it is not covered by another agency",
                       "1 = yes, it is covered by another agency",
                       "shift_data = ",
                       "0 = reported",
                       "1 = reported, no data",
                       "2 = not reported",
                       "no_male_female_breakdown = ",
                       "0 = normal",
                       "1 = no breakdowns, all data will be in the 'male employees' area",
                       injury_no_injury_indicator_labels)


col_positions <- c(starting_numbers,
                   patrol_type_nums,
                   middle_numbers,
                   all_month_numbers)
col_labels <- c(starting_names,
                patrol_type_names,
                middle_names,
                all_month_names)

# Remove last blank
col_positions <- col_positions[-length(col_positions)]
col_labels    <- col_labels[-length(col_labels)]


asciiSetupReader::make_sps_setup(file_name     = "setup_files/ucr_leoka",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = leoka_value_labels)
