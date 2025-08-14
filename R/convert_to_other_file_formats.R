source("R/utils/global_utils.R")

# Convert to Stata --------------------------------------------------------
files <- list.files("E:/ucr_data_storage/clean_data/",
                    full.names = TRUE,
                    recursive = TRUE,
                    pattern = ".rds")
files
for (file in files) {
  file_name_stata <- gsub(".rds", ".dta", file)
  if (file_name_stata %in% list.files("E:/ucr_data_storage/clean_data/",
                                      full.names = TRUE,
                                      recursive = TRUE)) {
    message(paste0("Skipping ", file))
    next
  }
  data <- readRDS(file) %>%
    mutate_if(is.Date, as.character)
  names(data) <- gsub("population_group_in_previous_year",
                      "population_group_in_prev_year",
                      names(data))
  names(data) <- gsub("cleared_18_", "clr_18_", names(data))
  names(data) <- gsub("total_cleared_", "tot_clr_", names(data))
  names(data) <- gsub("_vehicle_", "_veh_", names(data))
  names(data) <- gsub("unfounded_burglary_nonforce_entry",
                      "unfounded_burg_nonforce_entry", names(data))
  names(data) <- gsub("estimated_damage_",
                      "est_damage_", names(data))
  names(data) <- gsub("suspicious_person_",
                         "susp_person_", names(data))
  names(data) <- gsub("assaults_with_injury_other_weapon",
                      "assaults_with_injury_oth_weapon", names(data))
  names(data) <- gsub("other_arrest_assault_other_weapon",
                      "other_arrest_assault_oth_weapon", names(data))

  names(data) <- gsub("burglary_resident",
                      "burg_resident", names(data))
  names(data) <- gsub("burglary_nonresident",
                      "burg_nonresident", names(data))
  names(data) <- gsub("offenses_burg_nonresident_unknown",
                      "offenses_burg_nonresident_unkn", names(data))
  names(data) <- gsub("auto_stolen_and_recovered_locally",
                      "auto_stolen_recovered_locally", names(data))
  names(data) <- gsub("auto_stolen_and_recovered_other_agency",
                      "auto_stolen_recovered_oth_agency", names(data))


  names(data) <- gsub("value_recovered_local_motor_vehicle",
                      "value_recovered_local_motor_veh", names(data))
  names(data) <- gsub("auto_stole_other_agency_and_recovered_locally",
                      "auto_stole_oth_agency_recov_loc", names(data))

  if (any(nchar(names(data)) > 32)) {
  print(table(nchar(names(data))))
  }
  haven::write_dta(data,
                   file_name_stata)

  rm(data); gc()
  message(file)
}


# Convert to CSV --------------------------------------------------------
files <- list.files("E:/ucr_data_storage/clean_data/",
                    full.names = TRUE,
                    recursive = TRUE,
                    pattern = ".rds")
files
for (file in files) {
  file_name_csv <- gsub(".rds", ".csv", file)
  if (file_name_csv %in% list.files("E:/ucr_data_storage/clean_data/",
                                    full.names = TRUE,
                                    recursive = TRUE)) {
    message(paste0("Skipping ", file))
    next
  }
  data <- readRDS(file) %>%
    mutate_if(is.Date, as.character)

  readr::write_csv(data,
                   file_name_csv)

  rm(data); gc()
  message(file)
}


#
#
# # Convert to SPSS --------------------------------------------------------
# files <- list.files("E:/ucr_data_storage/clean_data/",
#                     full.names = TRUE,
#                     recursive = TRUE,
#                     pattern = "[0-9]{4}_[0-9]{4}.rds")
# files
# for (file in files) {
#   file_name_spss <- gsub(".rds", ".sav", file)
#   if (file_name_spss %in% list.files("E:/ucr_data_storage/clean_data/",
#                                      full.names = TRUE,
#                                      recursive = TRUE)) {
#     message(paste0("Skipping ", file))
#     next
#   }
#   data <- readRDS(file) %>%
#     mutate_if(is.Date, as.character)
#   haven::write_sav(data,
#                    file_name_spss)
#
#   rm(data); gc()
#   message(file)
# }
