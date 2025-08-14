source("R/utils/global_utils.R")


# NIBRS Window Arrestee ---------------------------------------------------------
windows_arrest_files <- list.files("E:/ucr_data_storage/clean_data/nibrs/window_arrestee_segment/",
                             pattern = ".rds",
                             full.names = TRUE)
windows_arrest_files
windows_arrest <- data.frame()
for (file in windows_arrest_files) {
  temp <- readRDS(file) %>%
    mutate(automatic_weapon_indicator_1 = as.character(automatic_weapon_indicator_1),
           arrestee_weapon_2 = as.character(arrestee_weapon_2),
           age_of_arrestee = as.character(age_of_arrestee),
           ucr_offense_code_2 = as.character(ucr_offense_code_2),
           ucr_offense_code_3 = as.character(ucr_offense_code_3),
           ucr_offense_code_4 = as.character(ucr_offense_code_4),
           ucr_offense_code_5 = as.character(ucr_offense_code_5),
           ucr_offense_code_6 = as.character(ucr_offense_code_6),
           ucr_offense_code_7 = as.character(ucr_offense_code_7),
           ucr_offense_code_8 = as.character(ucr_offense_code_8),
           ucr_offense_code_9 = as.character(ucr_offense_code_9),
           ucr_offense_code_10 = as.character(ucr_offense_code_10))
  windows_arrest <-
    windows_arrest %>%
    bind_rows(temp)
  message(file)
}
saveRDS(windows_arrest,
        paste0("E:/ucr_data_storage/clean_data/nibrs/window_arrestee_segment/",
               "nibrs_window_arrestee_segment_",
               min(windows_arrest$year),
               "_",
               max(windows_arrest$year),
               ".rds"))

# NIBRS Window Exceptional Clearance --------------------------------------------
windows_exceptional_files <- list.files("E:/ucr_data_storage/clean_data/nibrs/window_exceptional_clearance_segment/",
                                   pattern = ".rds",
                                   full.names = TRUE)
windows_exceptional_files
windows_exceptional <- data.frame()
for (file in windows_exceptional_files) {
  temp <- readRDS(file) %>%
    mutate(report_date_indicator = as.character(report_date_indicator),
           ucr_offense_code_1 = as.character(ucr_offense_code_1),
           ucr_offense_code_2 = as.character(ucr_offense_code_2),
           ucr_offense_code_3 = as.character(ucr_offense_code_3),
           ucr_offense_code_4 = as.character(ucr_offense_code_4),
           ucr_offense_code_5 = as.character(ucr_offense_code_5),
           ucr_offense_code_6 = as.character(ucr_offense_code_6),
           ucr_offense_code_7 = as.character(ucr_offense_code_7),
           ucr_offense_code_8 = as.character(ucr_offense_code_8),
           ucr_offense_code_9 = as.character(ucr_offense_code_9),
           ucr_offense_code_10 = as.character(ucr_offense_code_10),
           cargo_theft_indicator = as.character(cargo_theft_indicator))
  windows_exceptional <-
    windows_exceptional %>%
    bind_rows(temp)
  message(file)
}
saveRDS(windows_exceptional,
        paste0("E:/ucr_data_storage/clean_data/nibrs/window_exceptional_clearance_segment/",
               "nibrs_window_exceptional_clearance_segment_",
               min(windows_exceptional$year),
               "_",
               max(windows_exceptional$year),
               ".rds"))

# NIBRS Window Recovered Property -----------------------------------------------
windows_property_files <- list.files("E:/ucr_data_storage/clean_data/nibrs/window_recovered_property_segment/",
                                        pattern = ".rds",
                                        full.names = TRUE)
windows_property_files
windows_property <- data.frame()
for (file in windows_property_files) {
  temp <- readRDS(file) %>%
    mutate(ucr_offense_code_1 = as.character(ucr_offense_code_1),
           ucr_offense_code_2 = as.character(ucr_offense_code_2),
           ucr_offense_code_3 = as.character(ucr_offense_code_3),
           ucr_offense_code_4 = as.character(ucr_offense_code_4),
           ucr_offense_code_5 = as.character(ucr_offense_code_5),
           ucr_offense_code_6 = as.character(ucr_offense_code_6),
           ucr_offense_code_7 = as.character(ucr_offense_code_7),
           ucr_offense_code_8 = as.character(ucr_offense_code_8),
           ucr_offense_code_9 = as.character(ucr_offense_code_9),
           ucr_offense_code_10 = as.character(ucr_offense_code_10))
  windows_property <-
    windows_property %>%
    bind_rows(temp)
  message(file)
}
saveRDS(windows_property,
        paste0("E:/ucr_data_storage/clean_data/nibrs/window_recovered_property_segment/",
               "nibrs_window_recovered_property_segment_",
               min(windows_property$year),
               "_",
               max(windows_property$year),
               ".rds"))

