source(here::here('R/make_sps/make_sps_utils.R'))


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
                   "30-33",
                   "34-35",
                   "36",
                   "37-45",
                   "46-69",
                   "70-75",
                   "76",
                   "77",
                   "78",
                   "79",
                   "80",
                   "81",
                   "82",
                   "83",
                   "84",
                   "85",
                   "86",
                   "87")

starting_names <- c("identifier_code",
                    "state",
                    "ori",
                    "population_group",
                    "country_division",
                    "year",
                    "sequence_number",
                    "core_city_indication",
                    "covered_by_ori",
                    "covered_by_population_group",
                    "fbi_field_office",
                    "number_of_months_reported",
                    "agency_count",
                    "population",
                    "agency_name",
                    "agency_state_name",
                    "jan_report_code",
                    "feb_report_code",
                    "mar_report_code",
                    "apr_report_code",
                    "may_report_code",
                    "jun_report_code",
                    "jul_report_code",
                    "aug_report_code",
                    "sep_report_code",
                    "oct_report_code",
                    "nov_report_code",
                    "dec_report_code")


monthly_nums <- c("88-92",
                  "93-97",
                  "98-102",
                  "103-107",
                  "108-112",
                  "113-117",
                  "118-122",
                  "123-127",
                  "128-132",
                  "133-137",
                  "138-142",
                  "143-147",
                  "148-152",
                  "153-157",
                  "158-162")

monthly_names <- c("replace_reported_commercial_sex_acts",
                   "replace_reported_involuntary_serv",
                   "replace_reported_total",
                   "replace_unfound_commercial_sex_acts",
                   "replace_unfound_involuntary_serv",
                   "replace_unfound_total",
                   "replace_actual_commercial_sex_acts",
                   "replace_actual_involuntary_serv",
                   "replace_actual_total",
                   "replace_tot_clr_commercial_sex_acts",
                   "replace_tot_clr_involuntary_serv",
                   "replace_tot_clr_total",
                   "replace_clr_18_commercial_sex_acts",
                   "replace_clr_18_involuntary_serv",
                   "replace_clr_18_total")

report_code_value_labels <- c("replace_report_code = ",
                              "X = no human trafficking information reported",
                              "Q = type 14, no report",
                              "N = data received")
report_code_value_labels <- repeated_label_replace_fixer(report_code_value_labels,
                                                         tolower(month.abb))

all_month_names <- repeated_label_replace_fixer(monthly_names, tolower(month.abb))

all_month_nums <- c(monthly_nums,
                    setup_num_adder(monthly_nums, 75, 11))



human_trafficking_value_labels <- c(state_group_division_value_labels,
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
                                    "9E = msa state police",
                                    report_code_value_labels)

col_positions <- c(starting_nums,
                   all_month_nums)

col_labels <- c(starting_names,
                all_month_names)

setwd(here::here("setup_files"))
make_sps_setup(file_name     = "human_trafficking",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = human_trafficking_value_labels)