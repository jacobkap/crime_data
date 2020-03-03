source(here::here('R/make_sps/nibrs_arrestee_segment_sps.R'))
# Page 72-77

col_positions <- c(col_positions,
                   "74",
                   "75-77",
                   "78-80",
                   "81-83",
                   "84-86",
                   "87-89",
                   "90-92",
                   "93-95",
                   "96-98",
                   "99-101",
                   "102-104")

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

setwd(here::here("setup_files"))
make_sps_setup(file_name     = "nibrs_window_arrestee_segment",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = nibrs_window_arrestee_segment_value_labels)