source(here::here('R/make_sps/make_sps_utils.R'))

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
                   "58-93",
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
                "01_06_12_indicator",
                "number_of_months_reported",
                "master_file_year",
                "agency_activity_indicators",
                "fips_county_1",
                "fips_county_2",
                "fips_county_3",
                "fips_county_4",
                "fips_county_5",
                "blank")


setwd(here::here("setup_files"))
make_sps_setup(file_name = "nibrs_batch_header_3",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels = state_value_labels)