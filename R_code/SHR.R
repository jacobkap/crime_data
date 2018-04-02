setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/SHR")
devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(data.table)
library(stringr)
library(dplyr)

shr <- agg_shr()
shr <- clean_shr(shr)
agg_shr <- function() {
  shr <- data.table()
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/SHR_utils.R')
  for (i in 1976:2015) {
    data <- spss_ascii_reader(dataset_name = paste0(i, "_SHR.txt"),
                              sps_name = paste0(i, "_SHR.sps"))
    names(data) <- str_replace_all(names(data), shr_names)
    data$ORI <- NULL
    data$STATE_NAME <- NULL

    # Adds ORI codes cause some years choose to value-label them
    ori_col <- "ORI_CODE"
    if (i %in% c(1975:1979, 1984:1988)) ori_col <- "AGENCY_CODE"

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
                            "TYPE_OF_ACTION", "MSA_INDICATION")

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
  data$GROUP                   <- str_replace_all_lower(data$GROUP, group_number)
  data$SUB_GROUP               <- str_replace_all_lower(data$SUB_GROUP, sub_group)
  data$GEOGRAPHIC_DIVISION     <- str_replace_all_lower(data$GEOGRAPHIC_DIVISION,
                                                        division)
  data$POPULATION     <- str_replace_all_lower(data$POPULATION,
                                               population)
  data$POPULATION     <- as.numeric(data$POPULATION)
  data$COUNTY                  <- gsub("Inapplicable", NA, data$COUNTY)

#  names(data) <- tolower(names(data))

  return(data)
}

# Checks for accuracy
data <- shr
cols <- c(race_cols, ethnic_cols, weapon_cols, relationship_cols,
          circumstance_cols, subcircumstance_cols, age_cols, sex_cols,
          count_cols, misc_cols)

sapply(shr[, race_cols], unique)
sapply(shr[, ethnic_cols], unique)
sapply(shr[, weapon_cols], unique)
sapply(shr[, relationship_cols], unique)
sapply(shr[, circumstance_cols], unique)
sapply(shr[, subcircumstance_cols], unique)
sapply(shr[, age_cols], unique)
sapply(shr[, sex_cols], unique)
sapply(shr[, count_cols], unique)
table(sort(shr$YEAR))
unique(shr$HOMICIDE_TYPE)
unique(shr$SITUATION)
unique(shr$GROUP)
unique(shr$SUB_GROUP)
unique(shr$GEOGRAPHIC_DIVISION)
unique(shr$STATE)
unique(shr$MONTH_OF_OFFENSE)
unique(shr$TYPE_OF_ACTION)
unique(shr$MSA_INDICATION)
table(nchar(shr$ORI))
names(shr)[!names(shr) %in% c(cols, "HOMICIDE_TYPE", "SITUATION",
                              "GROUP", "SUB_GROUP", "GEOGRAPHIC_DIVISION",
                              "ORI", "YEAR")]

table(substr(shr$ORI, 1, 2) == shr$state_abb)
table(shr$STATE[substr(shr$ORI, 1, 2) != shr$state_abb])
