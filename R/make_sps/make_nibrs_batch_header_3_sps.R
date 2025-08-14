source('R/make_sps/make_sps_utils.R')


month <- c("58-58",
           "59-59",
           "60-60")
col_positions <- c("1-2",
                   "3-4",
                   "5-13",
                   "14-25",
                   "26-34",
                   "35-37",
                   "38-40",
                   "41-49",
                   "50-51",
                   "52-53",
                   "54-57",
                   month <- c(month, setup_num_adder(month, 3, 11)),
                   "94-96",
                   "97-99",
                   "100-102",
                   "103-105",
                   "106-108",
                   "109-132")


col_labels <- c("segment_level",
                "state",
                "ori",
                "incident_number",
                "current_population_5",
                "ucr_county_code_5",
                "msa_code_5",
                "last_population_5",
                "x01_06_12_indicator",
                "number_of_months_reported",
                "master_file_year",
                paste0(rep(tolower(month.name), each = 3), c("_zero_report_submitted",
                                                             "_group_a_b_submitted",
                                                             "_window_record_submitted")),
                paste0("fips_county_code_", 1:5),
                "blank")


make_sps_setup(file_name = "setup_files/nibrs_batch_header_3",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels = c(state_value_labels,
                                agency_activity_indicators))
