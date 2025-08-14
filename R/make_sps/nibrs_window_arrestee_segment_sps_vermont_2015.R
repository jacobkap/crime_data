source('R/make_sps/nibrs_arrestee_segment_sps_vermont_2015.R')
# Page 72-77
col_positions <- c(col_positions,
                   "75",
                   "76-78",
                   "79-81",
                   "82-84",
                   "85-87",
                   "88-90",
                   "91-93",
                   "94-96",
                   "97-99",
                   "100-102",
                   "103-105")

col_labels <- c(col_labels,
                "window_clearance_flag",
                repeated_label_replace_fixer("ucr_offense_code_replace",
                                             1:10))

nibrs_window_arrestee_segment_value_labels <-
  c(nibrs_arrestee_value_labels,
    "window_clearance_flag = ",
    "Y = yes (clears the case)",
    "N = no (already cleared)",
    repeated_label_replace_fixer(ucr_offense_code_value_labels_replace,
                                 1:10))


make_sps_setup(file_name     = "setup_files/nibrs_window_arrestee_segment_vermont_2015",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = nibrs_window_arrestee_segment_value_labels)
