source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')

crosswalk <- read_merge_crosswalks()
cross_names <- names(crosswalk)
cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]
shr_1976_2017 <- agg_shr()
shr_1976_2017 <- reorder_SHR_columns(shr_1976_2017)
summary(shr_1976_2017)
table(shr_1976_2017$state)
table(shr_1976_2017$group)
table(shr_1976_2017$geographic_division)
table(is.na(shr_1976_2017$ori))
table(shr_1976_2017$year)
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/SHR")
save_files(data = shr_1976_2017,
           year = "1976_2017",
           file_name = "shr_",
           save_name = "shr_")
save_as_zip("shr_1976_2017_")

agg_shr <- function() {
  shr <- data.table()
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/SHR")
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/SHR_utils.R')
  for (year in 1976:2017) {
    data <- spss_ascii_reader(dataset_name = paste0("ucr_shr_", year, ".txt"),
                              sps_name = paste0("ucr_shr_", year, ".sps"))
    names(data) <- str_replace_all(names(data), shr_names)
    data$ORI <- NULL
    data$STATE_NAME <- NULL

    # Adds ORI codes cause some years choose to value-label them
    ori_col <- "ORI_CODE"
    if (year %in% c(1976:1979, 1984:1988)) ori_col <- "AGENCY_CODE"

    ORIs <- spss_ascii_reader(dataset_name = paste0("ucr_shr_", year, ".txt"),
                              sps_name = paste0("ucr_shr_", year, ".sps"),
                              keep_columns = ori_col,
                              value_label_fix = FALSE)
    names(ORIs) <- "ORI"

    data <- bind_cols(ORIs, data)
    data <- data[, !grepl("ICPSR", names(data))]

    data <- clean_shr(data)
    data <- left_join(data, crosswalk)
    char_cols <- sapply(data, is.character)
    data[char_cols] <- sapply(data[char_cols],
                              function(x) tolower(x))
    data$ori <- toupper(data$ori)
    data$ori9 <- toupper(data$ori9)
    data$state_abb <- toupper(data$state_abb)

    data <- data.table(data)
    shr <- rbind(shr, data, fill = TRUE)


    message(year); rm(data); rm(ORIs); gc(); Sys.sleep(1)
  }
  shr <- data.frame(shr)
  return(shr)
}



clean_shr <- function(data) {
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
  race_cols            <- names(data[grepl("RACE", names(data))])
  ethnic_cols          <- names(data[grepl("ETHNIC", names(data))])
  weapon_cols          <- names(data[grepl("WEAPON", names(data))])
  relationship_cols    <- names(data[grepl("RELATION", names(data))])
  circumstance_cols    <- names(data[grepl("_CIRC", names(data))])
  subcircumstance_cols <- names(data[grepl("_SUBC", names(data))])
  age_cols             <- names(data[grepl("_AGE", names(data))])
  sex_cols             <- names(data[grepl("SEX", names(data))])
  count_cols           <- names(data[grepl("COUNT$", names(data))])
  misc_cols            <- c("STATE", "MONTH_OF_OFFENSE",
                            "TYPE_OF_ACTION", "MSA_INDICATION",
                            "AGENCY_NAME")

  data$state_abb <- state.abb[match(toupper(data$STATE),toupper(state.name))]
  data$YEAR <- str_replace_all(data$YEAR, year_fix)
  data$YEAR <- as.numeric(data$YEAR)
  data[, race_cols]            <- sapply(data[, race_cols],
                                         str_replace_all_lower, race)
  data[, ethnic_cols]          <- sapply(data[, ethnic_cols],
                                         str_replace_all_lower, ethnic)
  data[, weapon_cols]          <- sapply(data[, weapon_cols],
                                         str_replace_all_lower, weapons)
  data[, relationship_cols]    <- sapply(data[, relationship_cols],
                                         str_replace_all_lower, relationship)
  data[, circumstance_cols]    <- sapply(data[, circumstance_cols],
                                         str_replace_all_lower, circumstance)
  data[, subcircumstance_cols] <- sapply(data[, subcircumstance_cols],
                                         str_replace_all_lower, subcircumstance)
  data[, age_cols]             <- sapply(data[, age_cols],
                                         str_replace_all_lower, age)
  data[, sex_cols]             <- sapply(data[, sex_cols],
                                         str_replace_all_lower, sex)
  data[, count_cols]           <- sapply(data[, count_cols], as.numeric)
  data[, misc_cols]            <- sapply(data[, misc_cols], tolower)
  data$HOMICIDE_TYPE           <- str_replace_all_lower(data$HOMICIDE_TYPE,
                                                        homicide_type)
  data$SITUATION               <- str_replace_all_lower(data$SITUATION,
                                                        situation)
  data$GROUP                   <- str_replace_all_lower(data$GROUP,
                                                  group_number_fix)
  if ("SUB_GROUP" %in% names(data)) {
  data$SUB_GROUP               <- str_replace_all_lower(data$SUB_GROUP,
                                                        sub_group)
  }
  data$GEOGRAPHIC_DIVISION     <- str_replace_all_lower(data$GEOGRAPHIC_DIVISION,
                                                        division)
  data$POPULATION     <- str_replace_all_lower(data$POPULATION,
                                               population)
  data$POPULATION     <- as.numeric(data$POPULATION)
  data$COUNTY         <- gsub("Inapplicable", NA, data$COUNTY)

  # Reorder columns so state_abb is 3rd column
  other_cols <- names(data)[!names(data) %in% c("ORI", "STATE", "state_abb")]
  data       <- data[,  c("ORI", "STATE", "state_abb", other_cols)]

  # Reorder so victim 11 is with other victims
  vic_11_cols <- names(data)[grepl("^VICTIM_11", names(data))]
  off_cols    <- names(data)[grepl("^OFFENDER", names(data))]
  other_cols  <- names(data)[!names(data) %in% c(vic_11_cols, off_cols)]
  data        <- data[, c(other_cols, vic_11_cols, off_cols)]

  data        <- fix_additionals(data)
  names(data) <- tolower(names(data))
  names(data) <- gsub("relationship", "relation", names(data))
  names(data) <- gsub("offender_(.*)_relation_to_victim_1",
                      "victim_1_relation_to_offender_\\1",
                      names(data))

  return(data)
}

# For victim/offender columns where there is no additional victim/offender,
# makes all values NA
fix_additionals <- function(data) {
  victim_cols          <- names(data)[grepl("^VICTIM", names(data))]
  victim_col_numbers   <- as.numeric(gsub("^VICTIM_([0-9]+)_.*", "\\1",
                                        victim_cols))
  offender_cols        <- names(data)[grepl("^OFFENDER", names(data))]
  offender_col_numbers <- as.numeric(gsub("^OFFENDER_([0-9]+)_.*", "\\1",
                                        offender_cols))
  for (i in 1:10) {
    vic_cols           <- victim_cols[victim_col_numbers >= i + 1]
    off_cols           <- offender_cols[offender_col_numbers >= i + 1]
    data[data$ADDITIONAL_VICTIM_COUNT   < i, vic_cols] <- NA
    data[data$ADDITIONAL_OFFENDER_COUNT < i, off_cols] <- NA

  }
  return(data)
}

reorder_SHR_columns <- function(data) {
  starting_cols <- c("ori", "ori9", "year", "state", "state_abb")
  offenders     <- grep("^offender", names(data), value = TRUE)
  vic_age       <- grep("victim.*age", names(data), value = TRUE)
  vic_sex       <- grep("victim.*sex", names(data), value = TRUE)
  vic_race      <- grep("victim.*race", names(data), value = TRUE)
  vic_ethnic    <- grep("victim.*origin", names(data), value = TRUE)
  vic_relation  <- grep("victim.*relation", names(data), value = TRUE)
  others <- names(data)[!names(data) %in%
                                   c(cross_names,
                                     starting_cols,
                                     offenders,
                                     vic_age,
                                     vic_sex,
                                     vic_race,
                                     vic_ethnic,
                                     vic_relation)]
  data <-
    data %>%
    dplyr::select(-contains("icpsr")) %>%
    dplyr::select(starting_cols,
                  cross_names,
                  others,
                  vic_age,
                  vic_sex,
                  vic_race,
                  vic_ethnic,
                  vic_relation,
                  offenders) %>%
    dplyr::arrange(desc(year),
                   ori)
  return(data)

}

