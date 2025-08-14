source('R/make_sps/nibrs_arrestee_segment_sps.R')
# Page 78-82

col_positions <- c("1-2",
                   "3-4",
                   "5-13",
                   "14-25",
                   "26-33",
                   "34-35",
                   "36-39",
                   "40",
                   "41-43",
                   "44-45",
                   "46",
                   "47-48",
                   "49",
                   "50-51",
                   "52",
                   "53",
                   "54",
                   "55",
                   "56")


col_labels <- c("segment_level",
                "state",
                "ori",
                "arrest_transaction_incident_num",
                "arrest_date",
                "arrestee_sequence_number",
                "city_submission",
                "type_of_arrest",
                "ucr_arrest_offense_code",
                "arrestee_weapon_1",
                "automatic_weapon_indicator_1",
                "arrestee_weapon_2",
                "automatic_weapon_indicator_2",
                "age_of_arrestee",
                "sex_of_arrestee",
                "race_of_arrestee",
                "ethnicity_of_arrestee",
                "resident_status_of_arrestee",
                "disposition_of_arrestee_under18")




make_sps_setup(file_name = "setup_files/nibrs_group_b_arrest_report_segment",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels = nibrs_arrestee_value_labels[1:202])
