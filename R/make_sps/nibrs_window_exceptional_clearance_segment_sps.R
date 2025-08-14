source('R/make_sps/nibrs_administrative_segment_sps.R')
# Page 42-45

col_positions <- c(col_positions,
                   "59-61",
                   "62-64",
                   "65-67",
                   "68-70",
                   "71-73",
                   "74-76",
                   "77-79",
                   "80-82",
                   "83-85",
                   "86-88",
                   "89")

col_labels <- c(col_labels,
                repeated_label_replace_fixer("ucr_offense_code_replace",
                                             1:10),
                "cargo_theft_indicator")

nibrs_window_exceptional_clearance_segment_value_labels <-
  c(nibrs_administrative_segment_value_labels,
    repeated_label_replace_fixer(ucr_offense_code_value_labels_replace,
                                              1:10),
    "cargo_theft_indicator = ",
    "Y = yes",
    "N = no"
    )


make_sps_setup(file_name     = "setup_files/nibrs_window_exceptional_clearance_segment",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = nibrs_window_exceptional_clearance_segment_value_labels)
