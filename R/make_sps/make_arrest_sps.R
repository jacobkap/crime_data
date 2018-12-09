source('C:/Users/user/Dropbox/R_project/crime_data/R/make_sps/make_sps_utils.R')


# Setup value labels ------------------------------------------------------

agency_header_values <- c(state_group_division_value_labels,
                          "identifier_code = ",
                          "3 = ASR master file",
                          "agency_header_designation = ",
                          "00 = agency header",
                          "suburban = ",
                          "1 = suburban",
                          "0 = non-suburban",
                          "core_city = ",
                          "Y = agency is core city of an MSA",
                          "N = agency is not a core city of an MSA",
                          "covered_by = ",
                          "0 = not covered by another agency",
                          "1 = covered by another agency")

monthly_header_values <- c(state_group_division_value_labels,
                           "identifier_code = ",
                           "3 = ASR master file",
                           "monthly_header_designation = ",
                           "000 = monthly header",
                           "breakdown_indicator = ",
                           " = totals and breakdowns for both offenses of drugs and gambling",
                           "1 = totals for both but no breakdowns for either",
                           "2 = totals for drugs but no breakdowns",
                           "3 = totals for gambling but no breakdowns",
                           "age_race_ethnic_origin_indicator = ",
                           " = data for age, race, and ethnic origin",
                           "2 = no race information",
                           "3 = no ethnic origin information",
                           "4 = no race or ethnic origin information",
                           "juvenile_and_adult_indicators = ",
                           " = data for juvenile and adult",
                           "1 = no adult information",
                           "2 = no juvenile information",
                           "zero_data_indicator = ",
                           "0 = not used",
                           "1 = reported no data",
                           "juvenile_disposition_indicator = ",
                           " = update juvenile disposition data",
                           "1 = no juvenile disposition data",
                           "2 = delete juvenile disposition data",
                           "3 = adjust juvenile disposition data",
                           "month = ",
                           "1 = january",
                           "2 = february",
                           "3 = march",
                           "4 = april",
                           "5 = may",
                           "6 = june",
                           "7 = july",
                           "8 = august",
                           "9 = september",
                           "10 = october",
                           "11 = november",
                           "12 = december")


offense_codes <- c("identifier_code = ",
                   "3 = ASR master file",
                   "month = ",
                   "1 = january",
                   "2 = february",
                   "3 = march",
                   "4 = april",
                   "5 = may",
                   "6 = june",
                   "7 = july",
                   "8 = august",
                   "9 = september",
                   "10 = october",
                   "11 = november",
                   "12 = december",
                   "offense_code = ",
                   "000 = monthly header",
                   "01A = murder and non-negligent manslaughter",
                   "01B = manslaughter by negligence",
                   "02  = forcible rape",
                   "03  = robbery",
                   "04  = aggravated assault",
                   "05  = burglary",
                   "06  = theft",
                   "07  = motor vehicle theft",
                   "08  = other assault",
                   "09  = arson",
                   "10  = forgery and counterfeiting",
                   "11  = fraud",
                   "12  = embezzlement",
                   "13  = stolen property - buying, receiving, possessing",
                   "14  = vandalism",
                   "15  = weapons - carrying, possessing, etc.",
                   "16  = prostitution and commercialized vice",
                   "17  = other sex offenses",
                   "18  = drugs total",
                   "180 = drugs sale - total",
                   "18A = drugs sale - cocaine, heroin, and derivatives",
                   "18B = drugs sale - marijuana",
                   "18C = drugs sale - synthetic narcotics",
                   "18D = drugs sale - other dangerous non-narcotic drugs",
                   "185 = drugs possession - total",
                   "18E = drugs possession - cocaine, heroin, and derivatives",
                   "18F = drugs possession - marijuana",
                   "18G = drugs possession - synthetic narcotics",
                   "18H = drugs possession - other dangerous non-narcotic drugs",
                   "19  = gambling total",
                   "19A = gambling - bookmaking",
                   "19B = gambling - numbers and lottery",
                   "19C = gambling - other",
                   "20  = offenses against family and children",
                   "21  = DUI",
                   "22  = liquor laws",
                   "23  = drunkenness",
                   "24  = disorderly conduct",
                   "25  = vagrancy",
                   "26  = all other offenses - except traffic",
                   "27  = suspicion",
                   "28  = curfew and loitering",
                   "29  = runaways",
                   # 1974-1979 have extra 0 for these
                   "200 = offenses against family and children",
                   "210 = DUI",
                   "220 = liquor laws",
                   "230 = drunkenness",
                   "240 = disorderly conduct",
                   "250 = vagrancy",
                   "260 = all other offenses - except traffic",
                   "270 = suspicion",
                   "280 = curfew and loitering",
                   "290 = runaways")

arrest_code_values_1980 <- c("arrest_code_num = ",
                             "001 = male_under_10",
                             "002 = male_10_12",
                             "003 = male_13_14",
                             "004 = male_15",
                             "005 = male_16",
                             "006 = male_17",
                             "007 = male_18",
                             "008 = male_19",
                             "009 = male_20",
                             "010 = male_21",
                             "011 = male_22",
                             "012 = male_23",
                             "013 = male_24",
                             "014 = male_25_29",
                             "015 = male_30_34",
                             "016 = male_35_39",
                             "017 = male_40_44",
                             "018 = male_45_49",
                             "019 = male_50_54",
                             "020 = male_55_59",
                             "021 = male_60_64",
                             "022 = male_over_64",
                             "023 = female_under_10",
                             "024 = female_10_12",
                             "025 = female_13_14",
                             "026 = female_15",
                             "027 = female_16",
                             "028 = female_17",
                             "029 = female_18",
                             "030 = female_19",
                             "031 = female_20",
                             "032 = female_21",
                             "033 = female_22",
                             "034 = female_23",
                             "035 = female_24",
                             "036 = female_25_29",
                             "037 = female_30_34",
                             "038 = female_35_39",
                             "039 = female_40_44",
                             "040 = female_45_49",
                             "041 = female_50_54",
                             "042 = female_55_59",
                             "043 = female_60_64",
                             "044 = female_over_64",
                             "045 = adult_white",
                             "046 = adult_black",
                             "047 = adult_american_indian",
                             "048 = adult_asian",
                             "049 = juvenile_white",
                             "050 = juvenile_black",
                             "051 = juvenile_american_indian",
                             "052 = juvenile_asian",
                             "053 = adult_hispanic",
                             "054 = adult_non_hispanic",
                             "055 = juvenile_hispanic",
                             "056 = juvenile_non_hispanic")
arrest_code_values_1980_final <- c()
for (i in 1:55) {
  arrest_code_values_1980_final <- c(arrest_code_values_1980_final,
                                     gsub("num", i, arrest_code_values_1980))
}



arrest_code_values_1974 <- c("arrest_code_num = ",
                             "001 = male_under_11",
                             "002 = male_11_12",
                             "003 = male_13_14",
                             "004 = male_15",
                             "005 = male_16",
                             "006 = male_17",
                             "007 = male_juvenile_unknown_age",
                             "008 = male_18",
                             "009 = male_19",
                             "010 = male_20",
                             "011 = male_21",
                             "012 = male_22",
                             "013 = male_23",
                             "014 = male_24",
                             "015 = male_25_29",
                             "016 = male_30_34",
                             "017 = male_35_39",
                             "018 = male_40_44",
                             "019 = male_45_49",
                             "020 = male_50_54",
                             "021 = male_55_59",
                             "022 = male_60_64",
                             "023 = male_over_64",
                             "024 = male_adult_unknown_age",
                             "025 = female_under_11",
                             "026 = female_11_12",
                             "027 = female_13_14",
                             "028 = female_15",
                             "029 = female_16",
                             "030 = female_17",
                             "031 = female_juvenile_unknown_age",
                             "032 = female_18",
                             "033 = female_19",
                             "034 = female_20",
                             "035 = female_21",
                             "036 = female_22",
                             "037 = female_23",
                             "038 = female_24",
                             "039 = female_25_29",
                             "040 = female_30_34",
                             "041 = female_35_39",
                             "042 = female_40_44",
                             "043 = female_45_49",
                             "044 = female_50_54",
                             "045 = female_55_59",
                             "046 = female_60_64",
                             "047 = female_over_64",
                             "048 = female_adult_unknown_age",
                             "049 = adult_white",
                             "050 = adult_black",
                             "051 = adult_american_indian",
                             "052 = adult_chinese",
                             "053 = adult_japanese",
                             "054 = adult_other",
                             "055 = juvenile_white",
                             "056 = juvenile_black",
                             "057 = juvenile_american_indian",
                             "058 = juvenile_chinese",
                             "059 = juvenile_japanese",
                             "060 = juvenile_other")
arrest_code_values_1974_final <- c()
for (i in 1:55) {
  arrest_code_values_1974_final <- c(arrest_code_values_1974_final,
                                     gsub("num", i, arrest_code_values_1974))
}

detail_header_value_labels_1980 <- c(state_group_division_value_labels,
                                     offense_codes,
                                     arrest_code_values_1980_final)

detail_header_value_labels_1974 <- c(state_group_division_value_labels,
                                     offense_codes,
                                     arrest_code_values_1974_final)

# Setup column numbers and names ------------------------------------------


agency_header_cols_1980 <- c("1",
                             "2-3",
                             "4-10",
                             "11-12",
                             "13",
                             "14-15",
                             "16-17",
                             "18-20",
                             "21-23",
                             "24-28",
                             "29",
                             "30",
                             "31",
                             "32-40",
                             "41-64",
                             "65-70")

agency_header_names_1980 <- c("identifier_code",
                              "state",
                              "ori",
                              "population_group",
                              "country_division",
                              "agency_header_designation",
                              "year",
                              "msa",
                              "county",
                              "sequence_number",
                              "suburban",
                              "core_city",
                              "covered_by",
                              "population",
                              "agency_name",
                              "state_name")



monthly_header_cols_1980 <- c("1",
                              "2-3",
                              "4-10",
                              "11-12",
                              "13",
                              "14-15",
                              "16-17",
                              "18-20",
                              "21",
                              "22",
                              "23",
                              "24",
                              "25-31",
                              "32-38",
                              "39-45",
                              "46",
                              "47-51",
                              "52-56",
                              "57-61",
                              "62-66",
                              "67-71")

monthly_header_names_1980 <- c("identifier_code",
                               "state",
                               "ori",
                               "population_group",
                               "country_division",
                               "month",
                               "year",
                               "monthly_header_designation",
                               "breakdown_indicator",
                               "age_race_ethnic_origin_indicator",
                               "juvenile_and_adult_indicators",
                               "zero_data_indicator",
                               "date_of_last_update",
                               "date_of_1st_previous_update",
                               "date_of_2nd_previous_update",
                               "juvenile_disposition_indicator",
                               "juvenile_handled_within_department",
                               "juvenile_referred_to_juvenile_court",
                               "juvenile_referred_to_welfare",
                               "juvenile_referred_to_police",
                               "juvenile_referred_to_criminal_court")

detail_header_cols_1980 <- c("1",
                             "2-3",
                             "4-10",
                             "11-12",
                             "13",
                             "14-15",
                             "16-17",
                             "18-20",
                             "21-23")

detail_header_names_1980 <- c("identifier_code",
                              "state",
                              "ori",
                              "population_group",
                              "country_division",
                              "month",
                              "year",
                              "offense_code",
                              "occurrences")

arrest_codes_1980 <- c("24-26",
                       "27-31")
arrest_codes_1980 <- c(arrest_codes_1980,
                       setup_num_adder(arrest_codes_1980, adder = 8, iterations = 55))
arrest_names_1980 <- paste0(c("arrest_code_", "arrest_counter_"), sort(rep(1:56, 2)))

detail_header_cols_1980 <- c(detail_header_cols_1980, arrest_codes_1980)
detail_header_names_1980 <- c(detail_header_names_1980, arrest_names_1980)



# Setup files for 1974-1979 -----------------------------------------------

agency_header_cols_1974 <- c("1",
                             "2-3",
                             "4-10",
                             "11-12",
                             "13",
                             "14-15",
                             "16-17",
                             "18-20",
                             "21-23",
                             "24-28",
                             "29",
                             "30",
                             "31",
                             "32-38",
                             "39",
                             "40-63",
                             "64-69")

agency_header_names_1974 <- c("identifier_code",
                              "state",
                              "ori",
                              "population_group",
                              "country_division",
                              "agency_header_designation",
                              "year",
                              "msa",
                              "county",
                              "sequence_number",
                              "suburban",
                              "core_city",
                              "covered_by",
                              "population",
                              "agency_count",
                              "agency_name",
                              "state_name")

monthly_header_cols_1974 <- c("1",
                              "2-3",
                              "4-10",
                              "11-12",
                              "13",
                              "14-15",
                              "16-17",
                              "18-20",
                              "21",
                              "22",
                              "23",
                              "24",
                              "25-31",
                              "32-38",
                              "39-45",
                              "46",
                              "47-51",
                              "52-56",
                              "57-61",
                              "62-66",
                              "67-71")

monthly_header_names_1974 <- c("identifier_code",
                               "state",
                               "ori",
                               "population_group",
                               "country_division",
                               "month",
                               "year",
                               "monthly_header_designation",
                               "breakdown_indicator",
                               "age_race_ethnic_origin_indicator",
                               "juvenile_and_adult_indicators",
                               "zero_data_indicator",
                               "date_of_last_update",
                               "date_of_1st_previous_update",
                               "date_of_2nd_previous_update",
                               "juvenile_disposition_indicator",
                               "juvenile_handled_within_department",
                               "juvenile_referred_to_juvenile_court",
                               "juvenile_referred_to_welfare",
                               "juvenile_referred_to_police",
                               "juvenile_referred_to_criminal_court")

detail_header_cols_1974 <- c("1",
                             "2-3",
                             "4-10",
                             "11-12",
                             "13",
                             "14-15",
                             "16-17",
                             "18-20",
                             "21-23")

detail_header_names_1974 <- c("identifier_code",
                              "state",
                              "ori",
                              "population_group",
                              "country_division",
                              "month",
                              "year",
                              "offense_code",
                              "occurrences")

arrest_codes_1974 <- c("24-26",
                       "27-31")
arrest_codes_1974 <- c(arrest_codes_1974,
                       setup_num_adder(arrest_codes_1974, adder = 8, iterations = 59))
arrest_names_1974 <- paste0(c("arrest_code_", "arrest_counter_"), sort(rep(1:60, 2)))

detail_header_cols_1974 <- c(detail_header_cols_1974, arrest_codes_1974)
detail_header_names_1974 <- c(detail_header_names_1974, arrest_names_1974)






setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/asr_from_fbi")
asciiSetupReader::make_sps_setup(file_name     = "arrests_agency_header_1980_present",
                                 col_positions = agency_header_cols_1980,
                                 col_labels    = agency_header_names_1980,
                                 value_labels  = agency_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_monthly_header_1980_present",
                                 col_positions = monthly_header_cols_1980,
                                 col_labels    = monthly_header_names_1980,
                                 value_labels  = monthly_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_detail_header_1980_present",
                                 col_positions = detail_header_cols_1980,
                                 col_labels    = detail_header_names_1980,
                                 value_labels  = detail_header_value_labels_1980)

asciiSetupReader::make_sps_setup(file_name     = "arrests_agency_header_1974_1979",
                                 col_positions = agency_header_cols_1974,
                                 col_labels    = agency_header_names_1974,
                                 value_labels  = agency_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_monthly_header_1974_1979",
                                 col_positions = monthly_header_cols_1974,
                                 col_labels    = monthly_header_names_1974,
                                 value_labels  = monthly_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_detail_header_1974_1979",
                                 col_positions = detail_header_cols_1974,
                                 col_labels    = detail_header_names_1974,
                                 value_labels  = detail_header_value_labels_1974)

setwd("C:/Users/user/Dropbox/R_project/crime_data/setup_files")
asciiSetupReader::make_sps_setup(file_name     = "arrests_agency_header_1980_present",
                                 col_positions = agency_header_cols_1980,
                                 col_labels    = agency_header_names_1980,
                                 value_labels  = agency_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_monthly_header_1980_present",
                                 col_positions = monthly_header_cols_1980,
                                 col_labels    = monthly_header_names_1980,
                                 value_labels  = monthly_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_detail_header_1980_present",
                                 col_positions = detail_header_cols_1980,
                                 col_labels    = detail_header_names_1980,
                                 value_labels  = detail_header_value_labels_1980)

asciiSetupReader::make_sps_setup(file_name     = "arrests_agency_header_1974_1979",
                                 col_positions = agency_header_cols_1974,
                                 col_labels    = agency_header_names_1974,
                                 value_labels  = agency_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_monthly_header_1974_1979",
                                 col_positions = monthly_header_cols_1974,
                                 col_labels    = monthly_header_names_1974,
                                 value_labels  = monthly_header_values)
asciiSetupReader::make_sps_setup(file_name     = "arrests_detail_header_1974_1979",
                                 col_positions = detail_header_cols_1974,
                                 col_labels    = detail_header_names_1974,
                                 value_labels  = detail_header_value_labels_1974)



source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/global_utils.R')
setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/asr_from_fbi")
files = list.files(pattern = "DAT|dat|TXT|txt")
library(tidyverse)
file = "ASR00.DAT"

data = asciiSetupReader::read_ascii_setup(file, "arrests_agency_header_1980_present.sps")
# Agency Header code
agency_header <-
  data %>%
  dplyr::filter(agency_header_designation %in% "agency header",
                !is.na(ori)) %>%
  dplyr::select(-state_name,
                -identifier_code,
                -agency_header_designation,
                -sequence_number,
                -county) %>%
  dplyr::mutate(year = fix_years(year),
                population = readr::parse_number(population))
rm(data); gc()

# Monthly Header code
data = asciiSetupReader::read_ascii_setup(file, "arrests_monthly_header_1980_present.sps")
monthly_header <-
  data %>%
  dplyr::filter(monthly_header_designation %in% "monthly header",
                !is.na(ori)) %>%
  dplyr::select(-identifier_code,
                -monthly_header_designation,
                -population_group,
                -country_division,
                -state) %>%
  dplyr::mutate(year = fix_years(year)) %>%
  dplyr::mutate_at(vars(matches("referred|handled")), fix_negatives)
rm(data); gc()

# Detail Header code
data = asciiSetupReader::read_ascii_setup(file, "arrests_detail_header_1980_present.sps",
                                          coerce_numeric = FALSE)
detail_header <-
  data %>%
  dplyr::filter(!month %in% "00",
                !offense_code %in% "monthly header",
                !is.na(ori)) %>%
  dplyr::select(-identifier_code,
                -occurrences,
                -population_group,
                -country_division,
                -state) %>%
  dplyr::mutate(year = fix_years(year)) %>%
  dplyr::mutate_at(vars(contains("arrest_counter")), fix_negatives)

detail_header <- make_arrest_category_cols(detail_header, arrest_cols)

rm(data); gc()

arrest_cols <- c("adult_american_indian",
                 "adult_asian",
                 "adult_black",
                 "adult_white",
                 "female_10_12",
                 "female_13_14",
                 "female_15",
                 "female_16",
                 "female_17",
                 "female_18",
                 "female_19",
                 "female_20",
                 "female_21",
                 "female_22",
                 "female_23",
                 "female_24",
                 "female_25_29",
                 "female_30_34",
                 "female_35_39",
                 "female_40_44",
                 "female_45_49",
                 "female_50_54",
                 "female_55_59",
                 "female_60_64",
                 "female_over_64",
                 "female_under_10",
                 "juvenile_american_indian",
                 "juvenile_asian",
                 "juvenile_black",
                 "juvenile_white",
                 "male_10_12",
                 "male_13_14",
                 "male_15",
                 "male_16",
                 "male_17",
                 "male_18",
                 "male_19",
                 "male_20",
                 "male_21",
                 "male_22",
                 "male_23",
                 "male_24",
                 "male_25_29",
                 "male_30_34",
                 "male_35_39",
                 "male_40_44",
                 "male_45_49",
                 "male_50_54",
                 "male_55_59",
                 "male_60_64",
                 "male_over_64",
                 "male_under_10")

make_arrest_category_cols <- function(data, arrest_cols) {
  arrest_code_cols <- grep("arrest_code", names(data), value = TRUE)
  arrest_code_cols <- readr::parse_number(arrest_code_cols)
  for (col in arrest_cols) {
    message(col)
    data[, col] <- 0
    for (i in arrest_code_cols) {
      data[, col][data[, paste0("arrest_code_", i)] %in% col] <-
        data[, col][data[, paste0("arrest_code_", i)] %in% col] +
        data[, paste0("arrest_counter_", i)][data[, paste0("arrest_code_", i)] %in% col]
    }
  }

  data <-
    data %>%
    dplyr::select(-contains("arrest"))
  return(data)
}