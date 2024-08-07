source(here::here('R/make_sps/make_sps_utils.R'))
source(here::here('R/make_sps/nibrs_sps_utils.R'))
# Page 20-32

county <- c("106-114",
            "115-117",
            "118-120",
            "121-129")
county <- c(county, setup_num_adder(county, 24, 4))
month <- c("234-234",
           "235-235",
           "236-236")
month <- c(month, setup_num_adder(month, 3, 11))
col_positions <- c("1-2",
                   "3-4",
                   "5-13",
                   "14-25",
                   "26-33",
                   "34-41",
                   "42-71",
                   "72-73",
                   "74-75",
                   "76-76",
                   "77-77",
                   "78-78",
                   "79-79",
                   "80-88",
                   "89-92",
                   "93-96",
                   "97-97",
                   "98-105",
                   county,
                   "226-227",
                   "228-229",
                   "230-233",
                   month,
                   "270-272",
                   "273-275",
                   "276-278",
                   "279-281",
                   "282-284")


col_labels <- c("segment_level",
                "state",
                "ori",
                "incident_number",
                "date_ori_was_added",
                "date_ori_went_nibrs",
                "city_name",
                "state_abbreviation",
                "population_group",
                "country_division",
                "country_region",
                "agency_indicator",
                "core_city",
                "covered_by_ori",
                "fbi_field_office",
                "judicial_district",
                "agency_nibrs_flag",
                "agency_inactive_date",
                paste0(rep(c("current_population_",
                             "ucr_county_code_",
                             "msa_code_",
                             "last_population_"), 5),
                       sort(rep(1:5, 4))),
                "x01_06_12_indicator",
                "number_of_months_reported",
                "year",
                paste0(rep(tolower(month.name), each = 3), c("_zero_report_submitted",
                                              "_group_a_b_submitted",
                                              "_window_record_submitted")),
                paste0("fips_county_code_", 1:5))


country_region <- c("country_region = ",
                    "1 = north east",
                    "2 = north central",
                    "3 = south",
                    "4 = west",
                    "agency_indicator = ",
                    "0 = covered-by another agency",
                    "1 = city",
                    "2 = county",
                    "3 = university or college",
                    "4 = state police",
                    "6 = other agencies",
                    "7 = tribal",
                    "8 = federal",
                    "core_city = ",
                    "y = yes",
                    "n = no",
                    "judicial_district = ",
                    "nnnn = northern",
                    "nnns = southern",
                    "nnne = eastern",
                    "nnnw = western",
                    "nnnm = middle",
                    "nnnc = central",
                    "nnna = entire state",
                    "agency_nibrs_flag = ",
                    "blank = does not yet participate",
                    " = does not yet participate",
                    "a = active",
                    "x01_06_12_indicator = ",
                    " = no months reported",
                    "01 = 1 or more months reported",
                    "06 = 6 or more months reported",
                    "12 = 12 months reported")



nibrs_batch_header_1_value_labels <-
  c(state_value_labels,
    state_group_division_value_labels,
    country_region,
    agency_activity_indicators)

setwd(here::here("setup_files"))
make_sps_setup(file_name = "nibrs_batch_header_1",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = nibrs_batch_header_1_value_labels)