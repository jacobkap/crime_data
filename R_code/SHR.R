devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(data.table)
library(stringr)
library(dplyr)
library(haven)
library(readr)
library(memisc)

shr <- agg_shr()
shr <- clean_shr(shr)
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/SHR")
shr_1976_2015 <- shr
save(shr_1976_2015,            file = "shr_1976_2015.rda")
write_csv(shr_1976_2015,       path = "shr_1976_2015.csv")
write_sav(shr_1976_2015,       path = "shr_1976_2015.sav")
Write(codebook(shr_1976_2015), file = "shr_1976_2015_codebook.txt")
names(shr_1976_2015) <- gsub("relationship", "rel", names(shr_1976_2015))
write_dta(shr_1976_2015,       path = "shr_1976_2015.dta")
save_as_zip("shr_1976_2015_")

agg_shr <- function() {
  shr <- data.table()
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/SHR")
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/SHR_utils.R')
  for (i in 1976:2015) {
    data <- spss_ascii_reader(dataset_name = paste0(i, "_SHR.txt"),
                              sps_name = paste0(i, "_SHR.sps"))
    names(data) <- str_replace_all(names(data), shr_names)
    data$ORI <- NULL
    data$STATE_NAME <- NULL

    # Adds ORI codes cause some years choose to value-label them
    ori_col <- "ORI_CODE"
    if (i %in% c(1976:1979, 1984:1988)) ori_col <- "AGENCY_CODE"

    ORIs <- spss_ascii_reader(dataset_name = paste0(i, "_SHR.txt"),
                              sps_name = paste0(i, "_SHR.sps"),
                              keep_columns = ori_col,
                              value_label_fix = FALSE)
    names(ORIs) <- "ORI"

    data <- bind_cols(ORIs, data)
    data <- data[, !grepl("ICPSR", names(data))]
    data <- data.table(data)
    shr <- rbind(shr, data, fill = TRUE)


    message(i); rm(data); rm(ORIs); gc(); Sys.sleep(1)
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

  data$state_abb <- state.abb[match(data$STATE,toupper(state.name))]
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
  data$SITUATION               <- str_replace_all_lower(data$SITUATION, situation)
  data$GROUP                   <- str_replace_all(data$GROUP, group_number)
  data$SUB_GROUP               <- str_replace_all_lower(data$SUB_GROUP, sub_group)
  data$GEOGRAPHIC_DIVISION     <- str_replace_all_lower(data$GEOGRAPHIC_DIVISION,
                                                        division)
  data$POPULATION     <- str_replace_all_lower(data$POPULATION,
                                               population)
  data$POPULATION     <- as.numeric(data$POPULATION)
  data$COUNTY                  <- gsub("Inapplicable", NA, data$COUNTY)

  # Reorder columns so state_abb is 3rd column
  other_cols <- names(data)[!names(data) %in% c("ORI", "STATE", "state_abb")]
  data <- data[,  c("ORI", "STATE", "state_abb", other_cols)]

  # Reorder so victim 11 is with other victims
  vic_11_cols <- names(data)[grepl("^VICTIM_11", names(data))]
  off_cols <- names(data)[grepl("^OFFENDER", names(data))]
  other_cols <- names(data)[!names(data) %in% c(vic_11_cols, off_cols)]
  data <- data[, c(other_cols, vic_11_cols, off_cols)]

  data <- fix_additionals(data)
  names(data) <- tolower(names(data))

  return(data)
}

# For victim/offender columns where there is no additional victim/offender,
# makes all values NA
fix_additionals <- function(data) {
  victim_cols   <- names(data)[grepl("^VICTIM", names(data))]
  victim_col_numbers <- as.numeric(gsub("^VICTIM_([0-9]+)_.*", "\\1",
                                        victim_cols))
  offender_cols <- names(data)[grepl("^OFFENDER", names(data))]
  offender_col_numbers <- as.numeric(gsub("^OFFENDER_([0-9]+)_.*", "\\1",
                                        offender_cols))
  for (i in 1:10) {
    vic_cols <- victim_cols[victim_col_numbers >= i + 1]
    off_cols <- offender_cols[offender_col_numbers >= i + 1]
    data[data$ADDITIONAL_VICTIM_COUNT < i, vic_cols] <- NA
    data[data$ADDITIONAL_OFFENDER_COUNT < i, off_cols] <- NA

  }
  return(data)
}


