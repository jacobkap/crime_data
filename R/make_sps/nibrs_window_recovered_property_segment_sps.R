source('R/make_sps/nibrs_property_segment_sps.R')
# Page 54-61

col_positions <- c(col_positions,
                   "103-105",
                   "106-108",
                   "109-111",
                   "112-114",
                   "115-117",
                   "118-120",
                   "121-123",
                   "124-126",
                   "127-129",
                   "130-132")

col_labels <- c(col_labels,
                repeated_label_replace_fixer("ucr_offense_code_replace",
                                             1:10))

nibrs_window_property_segment_value_labels <-
  c(nibrs_property_segment_value_labels,
    repeated_label_replace_fixer(ucr_offense_code_value_labels_replace,
                                 1:10))

make_sps_setup(file_name     = "setup_files/nibrs_window_recovered_property_segment",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = nibrs_window_property_segment_value_labels)
