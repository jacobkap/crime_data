setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/SHR")
devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(data.table)
library(stringr)

shr <- data.table()
for (i in 1976:2015) {
  data <- spss_ascii_reader(dataset_name = paste0(i, "_SHR.txt"),
                               sps_name = paste0(i, "_SHR.sps"))
  names(data) <- str_replace_all(names(data), shr_names)
  data <- data[, !grepl("ICPSR", names(data))]
  data <- data.table(data)
  shr <- rbind(shr, data, fill = TRUE)


  message(i); rm(data); gc(); Sys.sleep(1)
}
shr <- data.frame(shr)
names(shr)

shr_names <- c("SUBC.*"                  = "SUBCIRCUMSTANCE",
               "ETHNC_ORIGN"             = "ETHNIC_ORIGIN",
               "ORIGN|ORGIN"             = "ORIGIN",
               "ETHNC"                   = "ETHNIC",
               "ETHNIC$"                 = "ETHNIC_ORIGIN",
               "GENDER"                  = "SEX",
               "OFFENDER_([0-9]+)_CIR.*" =  "CIRCUMSTANCE_\\1",
               "OFFENDER_([0-9]+)_SUB.*" = "SUBCIRCUMSTANCE_\\1",
               "OFFENDER_([0-9]+)_REL.*" =  "RELATIONSHIP_\\1",
               "SUB_CIRCUMSTANCE"        = "SUBCIRCUMSTANCE",
               "AGENCY_CODE"             = "ORI_CODE",
               "^STATE_CODE$"            = "STATE",
               "AGENCY_STATE"            = "STATE_NAME",
               "NUMERIC_STATE_CODE"      = "STATE",
               "SMSA"                    = "MSA",
               "TYPE_OF_OFFENSE_HOMI.*"  = "HOMICIDE_TYPE",
               "^OFFNDR_COUNT_ADD_L$"    = "ADDITIONAL_OFFENDER_COUNT",
               "^OFFNDR_COUNT_ADDITIONAL_OFFENDERS$" = "ADDITIONAL_OFFENDER_COUNT",
               "^OFFNDR_COUNT_ADDL_OFFNDR$" = "ADDITIONAL_OFFENDER_COUNT",
               "^OFFENDER_COUNT$"           = "ADDITIONAL_OFFENDER_COUNT",
               "^OFFNDR_COUNT_ADDL_OFFNDR$" = "ADDITIONAL_OFFENDER_COUNT",
               "VICTIM_COUNT_ADDITIONAL_VICTIMS" = "ADDITIONAL_VICTIM_COUNT",
               "VICTIM_COUNT_ADDL_VICT"  = "ADDITIONAL_VICTIM_COUNT",
               "^VICTIM_COUNT$"          = "ADDITIONAL_VICTIM_COUNT",
               "^PART_NUMBER$"           = "ICPSR_PART_NUMBER",
               "^EDITION_NUMBER$"        = "ICPSR_EDITION_NUMBER",
               "^SEQUENCE_NUMBER$"       = "ICPSR_SEQUENCE_NUMBER",
               "_1$|_9028$"              = "",
               "ICPSR_SEQ_ID_NUMBER"     = "ICPSR_SEQUENCE_NUMBER",
               "COUNTIM"                 = "COUNT",
               "MSA_CODE"                = "MSA",
               "IDENTIFIER_CODE"         = "ICPSR_IDENTIFIER_CODE",
               "^RELATIONSHIP$"          = "RELATIONSHIP_1",
               "RELATIONSHIP_([0-9]+)"   = "OFFENDER_\\1_RELATIONSHIP_TO_VICTIM_1")


race_cols            <- names(shr[grepl("RACE", names(shr))])
ethnic_cols          <- names(shr[grepl("ETHNIC", names(shr))])
weapon_cols          <- names(shr[grepl("WEAPON", names(shr))])
relationship_cols    <- names(shr[grepl("RELATION", names(shr))])
circumstance_cols    <- names(shr[grepl("^CIRC", names(shr))])
subcircumstance_cols <- names(shr[grepl("SUB", names(shr))])
age_cols             <- names(shr[grepl("_AGE", names(shr))])
