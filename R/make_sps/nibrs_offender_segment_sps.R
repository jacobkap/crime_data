source(here::here('R/make_sps/make_sps_utils.R'))
source(here::here('R/make_sps/nibrs_sps_utils.R'))
# Page 70-71


col_positions <- c("1-2",
                   "3-4",
                   "5-13",
                   "14-25",
                   "26-33",
                   "34-35",
                   "36-37",
                   "38",
                   "39")

col_labels <- c("segment_level",
                "state",
                "ori",
                "incident_number",
                "incident_date",
                "offender_sequence_number",
                "age_of_offender",
                "sex_of_offender",
                "race_of_offender")

nibrs_offender_value_labels <- c("offender_sequence_number = ",
                                 "00 = unknown",
                                 "age_of_offender = ",
                                 "00 = unknown",
                                 "99 = over 98 years old",
                                 "sex_of_offender = ",
                                 "M = male",
                                 "F = female",
                                 "U = unknown",
                                 "race_of_offender = ",
                                 "W = white",
                                 "B = black",
                                 "I = american indian/alaskan native",
                                 "A = asian/pacific islander",
                                 "U = unknown")

setwd(here::here("setup_files"))
make_sps_setup(file_name = "nibrs_offender_segment",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels = nibrs_offender_value_labels)