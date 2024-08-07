source(here::here('R/crosswalk.R'))
source(here::here('R/utils/global_utils.R'))
source(here::here('R/utils/SHR_utils.R'))
source(here::here('R/make_sps/make_shr_sps.R'))

crosswalk     <- read_merge_crosswalks()
cross_names   <- names(crosswalk)
cross_names   <- cross_names[!cross_names %in% c("ori", "ori9")]
shr_1976_2021 <- agg_shr(crosswalk, cross_names)

global_checks(shr_1976_2021)
table(shr_1976_2021$month_of_offense)
table(shr_1976_2021$victim_1_race[shr_1976_2021$year %in% 2019])
table(shr_1976_2021$victim_1_race[shr_1976_2021$year %in% 2021])
table(shr_1976_2021$offender_1_sex[shr_1976_2021$year %in% 2019])
table(shr_1976_2021$offender_1_sex[shr_1976_2021$year %in% 2021])
table(shr_1976_2021$offender_1_circumstance[shr_1976_2021$year %in% 2019])
table(shr_1976_2021$offender_1_circumstance[shr_1976_2021$year %in% 2021])
table(shr_1976_2021$month_of_offense[shr_1976_2021$year %in% 2019])
table(shr_1976_2021$month_of_offense[shr_1976_2021$year %in% 2021])

shr_checks(shr_1976_2021, age = FALSE)
shr_checks(shr_1976_2021, age = TRUE)
setwd(here::here("E:/ucr_data_storage/clean_data/SHR"))
save_files(data = shr_1976_2021,
           year = "1976_2021",
           file_name = "shr_",
           save_name = "shr_")
save_as_zip("shr_1976_2021_")

agg_shr <- function(crosswalk, cross_names) {
  source(here::here('R/utils/global_utils.R'))
  shr <- data.table()

  setwd(here::here("D:/ucr_data_storage/raw_data/shr_from_fbi"))
  files <- list.files()
  print(files)
  for (file in files) {
    data <- read_ascii_setup(file, here::here("setup_files/ucr_shr.sps"))
    data <- data[!is.na(data$ori), ]
    data$state_name <- NULL
    data$state_abb  <- make_state_abb(data$state)
    data$year       <- fix_years(data$year)
    data            <- combine_rename_shr(data, crosswalk)
    shr             <- rbind(shr, data, fill = TRUE)
    message(file)
  }

  # Until FBI sends me the ASCII files for all years, will use NACJD data
  # for years 1976-1985!
  setwd(here::here("D:/ucr_data_storage/raw_data/nacjd_data/SHR"))
  for (year in 1976:1984) {
    data <- read_ascii_setup(data       = paste0("ucr_shr_", year, ".txt"),
                             setup_file = paste0("ucr_shr_", year, ".sps"))
    names(data) <- gsub("^AGENCY_CODE$", "ORI", names(data))
    names(data) <- str_replace_all(names(data), shr_names)


    data                 <- clean_shr(data)
    data$sub_group       <- NULL
    data$state_name      <- NULL
    data <- combine_rename_shr(data, crosswalk)
    shr  <- rbind(shr, data, fill = TRUE)
    message(year);
  }
  shr <- data.frame(shr)
  month_number_name        <- tolower(month.name)
  names(month_number_name) <- paste0("^", 1:12, "$")


  shr$month_of_offense <- str_replace_all(shr$month_of_offense, month_number_name)
  shr <- reorder_shr_columns(shr, cross_names)

  shr$state[shr$state %in% c("69", "98", "99")] <- NA
  return(shr)
}

combine_rename_shr <- function(data, crosswalk) {
  data <-
    data %>%
    left_join(crosswalk, by = "ori") %>%
    mutate_if(is.character, tolower) %>%
    mutate(ori = toupper(ori),
           ori9 = toupper(ori9),
           state_abb = toupper(state_abb))
  names(data) <- gsub("^geographic_division$", "country_division", names(data))
  names(data) <- gsub("^group$", "population_group", names(data))
  names(data) <- gsub("^msa_indication$", "suburban_indicator", names(data))
  data <- data.table::data.table(data)
  return(data)
}



clean_shr <- function(data) {
  race_cols            <- names(data[grepl("RACE", names(data))])
  ethnic_cols          <- names(data[grepl("ETHNIC", names(data))])
  weapon_cols          <- names(data[grepl("WEAPON", names(data))])
  relationship_cols    <- names(data[grepl("RELATION", names(data))])
  circumstance_cols    <- names(data[grepl("_CIRC", names(data))])
  subcircumstance_cols <- names(data[grepl("_SUBC", names(data))])
  age_cols             <- names(data[grepl("_AGE", names(data))])
  sex_cols             <- names(data[grepl("SEX", names(data))])
  count_cols           <- names(data[grepl("COUNT$", names(data))])
  misc_cols            <- c("STATE",
                            "MONTH_OF_OFFENSE",
                            "TYPE_OF_ACTION",
                            "MSA_INDICATION",
                            "AGENCY_NAME")

  data$YEAR                    <- fix_years(data$YEAR)
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
  data$GEOGRAPHIC_DIVISION     <- str_replace_all_lower(data$GEOGRAPHIC_DIVISION,
                                                        country_division_fix)
  data$GEOGRAPHIC_DIVISION     <- gsub(" States$", "", data$GEOGRAPHIC_DIVISION,
                                       ignore.case = TRUE)
  data$POPULATION     <- str_replace_all_lower(data$POPULATION,
                                               population)
  data$POPULATION     <- parse_number(data$POPULATION)
  data$COUNTY         <- gsub("Inapplicable", NA, data$COUNTY)


  data        <- fix_additionals(data)
  names(data) <- tolower(names(data))
  names(data) <- gsub("relationship", "relation", names(data))
  names(data) <- gsub("offender_(.*)_relation_to_victim_1",
                      "victim_1_relation_to_offender_\\1",
                      names(data))
  data$state <- gsub("^washington, d.c$", "district of columbia", data$state)
  data$state_abb  <- make_state_abb(data$state)

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

reorder_shr_columns <- function(data, cross_names) {
  starting_cols <- c("ori",
                     "ori9",
                     "year",
                     "state",
                     "state_abb",
                     "month_of_offense")
  offenders     <- grep("^offender",        names(data), value = TRUE)
  vic_age       <- grep("victim.*age",      names(data), value = TRUE)
  vic_sex       <- grep("victim.*sex",      names(data), value = TRUE)
  vic_race      <- grep("victim.*race",     names(data), value = TRUE)
  vic_ethnic    <- grep("victim.*origin",   names(data), value = TRUE)
  vic_relation  <- grep("victim.*relation", names(data), value = TRUE)
  others <- names(data)[!names(data) %in%
                          c(all_of(cross_names),
                            all_of(starting_cols),
                            all_of(offenders),
                            all_of(vic_age),
                            all_of(vic_sex),
                            all_of(vic_race),
                            all_of(vic_ethnic),
                            all_of(vic_relation))]
  others <- others[-grep("icpsr|identifier_code", others)]
  data <-
    data %>%
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

shr_checks <- function(data, age = FALSE) {
  victim_offender_columns   <- grep("^victim|^offender", names(data), value = TRUE)
  if (age) {
    victim_offender_columns <- grep("age$", names(data), value = TRUE)
  } else {
    victim_offender_columns <- victim_offender_columns[-grep("age", victim_offender_columns)]
  }

  for (col in victim_offender_columns) {
    message(col)
    print(sort(unique(data[, col])))
  }
}

