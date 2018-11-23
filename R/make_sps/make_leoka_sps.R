source('C:/Users/user/Dropbox/R_project/crime_data/R/make_sps/make_sps_utils.R')

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

patrol_type_names <- c("one_man_veh_day_shift",
                       "one_man_veh_evening_shift",
                       "one_man_veh_night_shift",
                       "one_man_veh_other_shift",
                       "one_man_veh_total_shift",

                       "two_man_veh_day_shift",
                       "two_man_veh_evening_shift",
                       "two_man_veh_night_shift",
                       "two_man_veh_other_shift",
                       "two_man_veh_total_shift",

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

                       "total_patrols_veh_day_shift",
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
                           "assaults_with_injury_oth_weap",
                           "assaults_with_injury_unarmed",
                           "assaults_with_injury_total",
                           "assaults_no_injury_gun",
                           "assaults_no_injury_knife",
                           "assaults_no_injury_oth_weap",
                           "assaults_no_injury_unarmed",
                           "assaults_no_injury_total")

assault_by_call_type_names <- c("total_assaults",
                                "assault_gun",
                                "assault_knife",
                                "assault_oth_weap",
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
oth_arrest_names     <- paste0("oth_arrest_", assault_by_call_type_names)
riot_names           <- paste0("riot_", assault_by_call_type_names)
riot_names           <- gsub("riot_detective_assist",
                             'riot_detective_assiste',
                             riot_names)
prisoners_names <- paste0("prisoner_", assault_by_call_type_names)
suspicious_names     <- paste0("susp_pers_", assault_by_call_type_names)
ambush_names         <- paste0("ambush_", assault_by_call_type_names)
deranged_names       <- paste0("deranged_", assault_by_call_type_names)
traffic_names        <- paste0("traffic_", assault_by_call_type_names)
all_other_names      <- paste0("all_other_", assault_by_call_type_names)
total_names          <- paste0("total_", assault_by_call_type_names)
total_names          <- gsub("total_total_assaults", "total_assaults_total", total_names)

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
                   oth_arrest_names,
                   riot_names,
                   prisoners_names,
                   suspicious_names,
                   ambush_names,
                   deranged_names,
                   traffic_names,
                   all_other_names,
                   total_names,
                   time_names)

jan_names <- paste0("jan_", monthly_names)
feb_names <- paste0("feb_", monthly_names)
mar_names <- paste0("mar_", monthly_names)
apr_names <- paste0("apr_", monthly_names)
may_names <- paste0("may_", monthly_names)
jun_names <- paste0("jun_", monthly_names)
jul_names <- paste0("jul_", monthly_names)
aug_names <- paste0("aug_", monthly_names)
sep_names <- paste0("sep_", monthly_names)
oct_names <- paste0("oct_", monthly_names)
nov_names <- paste0("nov_", monthly_names)
dec_names <- paste0("dec_", monthly_names)


all_month_names <- c(jan_names,
                     feb_names,
                     mar_names,
                     apr_names,
                     may_names,
                     jun_names,
                     jul_names,
                     aug_names,
                     sep_names,
                     oct_names,
                     nov_names,
                     dec_names)



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


injury_no_injury_labels <- c("_assault_injury_indicator = ",
                             "0 = information complete",
                             "1 = assaults not reported",
                             "2 = assaults reported but no breakdowns",
                             "_assault_no_injury_indicator = ",
                             "0 = information complete",
                             "1 = assaults not reported",
                             "2 = assaults reported but no breakdowns")
jan_injury_no_injury_labels <- gsub("^_", "jan_", injury_no_injury_labels)
feb_injury_no_injury_labels <- gsub("^_", "feb_", injury_no_injury_labels)
mar_injury_no_injury_labels <- gsub("^_", "mar_", injury_no_injury_labels)
apr_injury_no_injury_labels <- gsub("^_", "apr_", injury_no_injury_labels)
may_injury_no_injury_labels <- gsub("^_", "may_", injury_no_injury_labels)
jun_injury_no_injury_labels <- gsub("^_", "jun_", injury_no_injury_labels)
jul_injury_no_injury_labels <- gsub("^_", "jul_", injury_no_injury_labels)
aug_injury_no_injury_labels <- gsub("^_", "aug_", injury_no_injury_labels)
sep_injury_no_injury_labels <- gsub("^_", "sep_", injury_no_injury_labels)
oct_injury_no_injury_labels <- gsub("^_", "oct_", injury_no_injury_labels)
nov_injury_no_injury_labels <- gsub("^_", "nov_", injury_no_injury_labels)
dec_injury_no_injury_labels <- gsub("^_", "dec_", injury_no_injury_labels)

all_injury_no_injury_labels <- c(jan_injury_no_injury_labels,
                                 feb_injury_no_injury_labels,
                                 mar_injury_no_injury_labels,
                                 apr_injury_no_injury_labels,
                                 may_injury_no_injury_labels,
                                 jun_injury_no_injury_labels,
                                 jul_injury_no_injury_labels,
                                 aug_injury_no_injury_labels,
                                 sep_injury_no_injury_labels,
                                 oct_injury_no_injury_labels,
                                 nov_injury_no_injury_labels,
                                 dec_injury_no_injury_labels)

month_indicator_labels <- c("_month_indicator = ",
                            "0 = normal update",
                            "1 = not reported",
                            "2 = reported, no data",
                            "3 = deleted")
jan_month_indicator_labels <- gsub("^_", "jan_", month_indicator_labels)
feb_month_indicator_labels <- gsub("^_", "feb_", month_indicator_labels)
mar_month_indicator_labels <- gsub("^_", "mar_", month_indicator_labels)
apr_month_indicator_labels <- gsub("^_", "apr_", month_indicator_labels)
may_month_indicator_labels <- gsub("^_", "may_", month_indicator_labels)
jun_month_indicator_labels <- gsub("^_", "jun_", month_indicator_labels)
jul_month_indicator_labels <- gsub("^_", "jul_", month_indicator_labels)
aug_month_indicator_labels <- gsub("^_", "aug_", month_indicator_labels)
sep_month_indicator_labels <- gsub("^_", "sep_", month_indicator_labels)
oct_month_indicator_labels <- gsub("^_", "oct_", month_indicator_labels)
nov_month_indicator_labels <- gsub("^_", "nov_", month_indicator_labels)
dec_month_indicator_labels <- gsub("^_", "dec_", month_indicator_labels)

all_month_indicator_labels <- c(jan_month_indicator_labels,
                                feb_month_indicator_labels,
                                mar_month_indicator_labels,
                                apr_month_indicator_labels,
                                may_month_indicator_labels,
                                jun_month_indicator_labels,
                                jul_month_indicator_labels,
                                aug_month_indicator_labels,
                                sep_month_indicator_labels,
                                oct_month_indicator_labels,
                                nov_month_indicator_labels,
                                dec_month_indicator_labels)


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
                       all_injury_no_injury_labels,
                       all_month_indicator_labels)


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


setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/leoka_from_fbi")
asciiSetupReader::make_sps_setup(file_name     = "ucr_leoka",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = leoka_value_labels)
setwd("C:/Users/user/Dropbox/R_project/crime_data/setup_files")
asciiSetupReader::make_sps_setup(file_name     = "ucr_leoka",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = leoka_value_labels)