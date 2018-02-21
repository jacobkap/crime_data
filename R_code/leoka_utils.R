setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/leoka")
devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(dplyr)
library(stringr)
library(data.table)


leoka1990 <- spss_ascii_reader(dataset_name = "1990_leoka.txt",
                               sps_name = "1990_leoka.sps")
leoka1991 <- spss_ascii_reader(dataset_name = "1991_leoka.txt",
                               sps_name = "1991_leoka.sps")

names(leoka1990) <- name_fixer(names(leoka1990))
names(leoka1991) <- name_fixer(names(leoka1991))
length(unique(names(leoka1990)))
length(unique(names(leoka1991)))
table(names(leoka1991) %in% names(leoka1990))
table(names(leoka1990) %in% names(leoka1991))
names(leoka1990)[!names(leoka1990) %in% names(leoka1991)]
names(leoka1991)[!names(leoka1991) %in% names(leoka1990)]
names(leoka1990)[duplicated(names(leoka1990))]


name_fixer <- function(col_names) {
  col_names <- gsub("(.*)_JAN", "JAN_\\1", col_names)
  col_names <- gsub("(.*)_FEB", "FEB_\\1", col_names)
  col_names <- gsub("(.*)_MAR", "MAR_\\1", col_names)
  col_names <- gsub("(.*)_APR", "APR_\\1", col_names)
  col_names <- gsub("(.*)_MAY", "MAY_\\1", col_names)
  col_names <- gsub("(.*)_JUN", "JUN_\\1", col_names)
  col_names <- gsub("(.*)_JUL", "JUL_\\1", col_names)
  col_names <- gsub("(.*)_AUG", "AUG_\\1", col_names)
  col_names <- gsub("(.*)_SEP", "SEP_\\1", col_names)
  col_names <- gsub("(.*)_OCT", "OCT_\\1", col_names)
  col_names <- gsub("(.*)_NOV", "NOV_\\1", col_names)
  col_names <- gsub("(.*)_DEC", "DEC_\\1", col_names)
  col_names <- gsub("_ASLT_", "_ASSLTS_", col_names)



  col_names <- gsub("_([0-9]{2})$", "_\\100", col_names)
  col_names <- gsub("_([0-9]{2})_", "_\\101_TO_", col_names)
  col_names <- gsub("_TOT_WPN$", "_TOT_ASSLTS", col_names)
  col_names <- gsub("IES_", "Y_", col_names)
  col_names <- gsub("BURGLAR_", "BURGLARY_", col_names)
  col_names <- gsub("_OTHRS_|_OTHR_", "_OTH_", col_names)
  col_names <- gsub("_OTHR$", "_OTHER", col_names)
  col_names <- gsub("_ALOE|_AONE|_ALN$|_ALNE$|_LONE$|_AL$", "_ALONE", col_names)
  col_names <- gsub("_ONE_ALONE|_1_ALONE|_1_MA$|_ASSNMT_1$|_1_ALON$|_ONE_ALONE",
                    "_1MAN_ALONE", col_names)
  col_names <- gsub("1_ASSI$|1MAN_ASST$", "1MAN_ASSISTED", col_names)
  col_names <- gsub("VEHICLE|VEHIC$|VEHI$|VEHILE", "VEH", col_names)
  col_names <- gsub("2_VEH", "2MAN_VEH", col_names)
  col_names <- gsub("_TYPE_OF_WEAP_", "_WEAP_", col_names)
  col_names <- gsub("_TOT_CALLS_", "_TOT_ASSLTS_", col_names)

  # Shift schedule
  col_names <- gsub("DAY$", "DAY_SHIFT", col_names)
  col_names <- gsub("EVENING$", "EVENING_SHIFT", col_names)
  col_names <- gsub("NIGHT$", "NIGHT_SHIFT", col_names)


  # Injury
  col_names <- gsub("_NO_INJ_", "_WITHOUT_INJURY_", col_names)

  # Crime types
  col_names <- gsub("_TRAFF_PURS_STOPS_", "_TRAFFIC_", col_names)
  col_names <- gsub("_MENT_DERANGED_|_MENTAL_", "_DERANGED_", col_names)
  col_names <- gsub("_AMBUSH_NO_WARN_", "_AMBUSH_", col_names)
  col_names <- gsub("_CUSTODY_", "_CUST_OF_PRISONERS_", col_names)
  col_names <- gsub("^(...)_DISORDER", "\\1_CIVIL_DISORDER", col_names)
  col_names <- gsub("_DISTRBNC_CALLS_|_DISTURB_", "_DISTURBANCE_", col_names)
  col_names <- gsub("_SUSPIC_PERSONS_", "_SUSP_PERS_", col_names)

  # Assignment
  col_names <- gsub("_2_VE.*|_2_V$", "_2MAN_VEH", col_names)
  col_names <- gsub("_DETE$", "_DET_ALONE", col_names)

  # Killed
  col_names <- gsub("_ACS$", "_ACTS",
                    col_names)
  col_names <- gsub("_OFC_KILLED_FELONY", "_OFFICERS_KILLED_FELONIOUS_ACTS",
                    col_names)
  col_names <- gsub("_OFC_KILLED_ACCID", "_OFFICERS_KILLED_ACCIDENT",
                    col_names)
  col_names <- gsub("_WITH_INJURY_", "_INJURY_", col_names)
  col_names <- gsub("_TOTAL$", "_TOT", col_names)
  col_names <- gsub("_DTV_", "_DET_", col_names)
  col_names <- gsub("_OTHR_ALONE", "_OTH_ALONE", col_names)
  col_names <- gsub("_ASSI|_ASST", "_ASSISTED", col_names)
  col_names <- gsub("_OTHR_ASS|_OTHR_ASI|_OTHR_SSI$|_OTH_SSI", "_OTH_ASS", col_names)
  col_names <- gsub("_ASSNMT_|_ASSN_", "_", col_names)
  col_names <- gsub("_ASSISTEDSTED|_ASI$|_ASS$", "_ASSISTED", col_names)

  # Assaults cleared
  col_names <-
    gsub("_ASSLTS_CLRD|_ASSLTS_CLRS|_ASSLT_CLRD|_ASSLTS_CRD|_ASSLTS_LRD",
                    "_ASSLT_CLEARED", col_names)
  col_names <-
    gsub("_ASSLTSCLRD|_ASSLTS_CLD", "_ASSLT_CLEARED", col_names)
  col_names <- gsub("_PLCE_|_POL_", "_", col_names)
  col_names <- gsub("_OTH_ARRS_|_ATTMPT_OTHR_ARR_", "_ATT_OTH_ARREST_", col_names)


  col_names <- gsub("ARMS", "ARM", col_names)
  col_names <- gsub("_TYPE_", "_", col_names)
  col_names <- gsub("_TOT$", "_TOTAL", col_names)
  col_names <- gsub("TOT_ASSLTS_ASLT_CLRS", "_TOT_ASSLTS_OF_ASSLT_CLEARED",
                    col_names)

  # Weapons
  col_names <- gsub("_NO_WPN", "_HAND_FT", col_names)
  col_names <- gsub("_GUN$|_WEAP_FIREARM.*|_WEAP_FIREAMS|_FIREARM$|_FIREARS",
                    "_WEAP_GUN", col_names)
  col_names <- gsub("_FEE$|_FE$", "_FT", col_names)
  col_names <- gsub("_HAND_FT", "_WEAP_HAND_FT", col_names)
  col_names <- gsub("_KNIFE$", "_WEAP_KNIFE", col_names)
  col_names <- gsub("_OTHER$", "_WEAP_OTHER", col_names)
  col_names <- gsub("_+", "_", col_names)
  col_names <- gsub("WEAP_WEAP", "WEAP_", col_names)
  col_names <- gsub("HANDS", "HAND", col_names)
  col_names <- gsub("HAND_F$|HAND_T$|HANDFT", "HAND_FT", col_names)
  col_names <- gsub("_+", "_", col_names)

  col_names <- gsub("_ATTMPT_", "_ATT_", col_names)
  col_names <- gsub("_ARR_", "_ARREST_", col_names)
  col_names <- gsub("_W_O_|_WITHOUT_", "_NO_", col_names)
  col_names <- gsub("^(...)_ASSLTS_INJURY", "\\1_ASSAULT_WITH_INJURY", col_names)
  col_names <- gsub("^(...)_ASSLTS_NO_INJURY", "\\1_ASSAULT_NO_INJURY", col_names)
  col_names <- gsub("_ASLT$", "_ASSLTS", col_names)
  col_names <- gsub("_1_", "_1MAN_", col_names)
  col_names <- gsub("_WEAP_", "_", col_names)

  col_names <- gsub("^ONE_VEH", "ONE_MAN_VEH", col_names)
  col_names <- gsub("^ONE_FOOT", "ONE_MAN_FOOT", col_names)

  shifts <- c("^ONE_MAN_VEH_OTHER$" = "ONE_MAN_VEH_OTHER_SHIFT",
              "^ONE_MAN_VEH_TOTAL$" = "ONE_MAN_VEH_TOTAL_SHIFT",
              "^TWO_MAN_VEH_OTHER$" = "TWO_MAN_VEH_OTHER_SHIFT",
              "^TWO_MAN_VEH_TOTAL$" = "TWO_MAN_VEH_TOTAL_SHIFT",
              "^ONE_MAN_FOOT_OTHER$" = "ONE_MAN_FOOT_OTHER_SHIFT",
              "^ONE_MAN_FOOT_TOTAL$" = "ONE_MAN_FOOT_TOTAL_SHIFT",
              "^TWO_MAN_FOOT_OTHER$" = "TWO_MAN_FOOT_OTHER_SHIFT",
              "^TWO_MAN_FOOT_TOTAL$" = "TWO_MAN_FOOT_TOTAL_SHIFT",
              "^OTHER_PATROLS_OTHER$" = "OTHER_PATROLS_OTHER_SHIFT",
              "^OTHER_PATROLS_TOTAL$" = "OTHER_PATROLS_TOTAL_SHIFT",
              "^TOTAL_PATROLS_OTHER$" = "TOTAL_PATROLS_OTHER_SHIFT",
              "^TOTAL_PATROLS_TOTAL$" = "TOTAL_PATROLS_TOTAL_SHIFT")

  count <- c("^NUMBER_MALE_OFFICERS$"    = "MALE_EMPLOYEES_OFFICERS",
             "^NUMBER_MALE_CIVILIANS$"   = "MALE_EMPLOYEES_CIVILIANS",
             "^TOTAL_MALE_EMPLOYEES$"    = "MALE_EMPLOYEES_TOTAL",
             "^NUMBER_FEMALE_OFFICERS$"  = "FEMALE_EMPLOYEES_OFFICERS",
             "^NUMBER_FEMALE_CIVILIANS$" = "FEMALE_EMPLOYEES_CIVILIANS",
             "^TOTAL_FEMALE_EMPLOYEES$"  = "FEMALE_EMPLOYEES_TOTAL",                        "^OFFICER_RATE_PER_1MAN_000_POP$"     = "OFFICERS_PER_1K_POP",
             "^EMPLOYEE_RATE_PER_1MAN_000_POP$"    = "EMPLOYEES_PER_1K_POP")

  misc <- c("^POP$"           = "POPULATION",
            "^STATE_CODE$"    = "NUMERIC_STATE_CODE",
            "^SEQUENTIAL_ID$" = "ICPSR_SEQ_ID_NUMBER",
            "^DIVISION$"      = "GEOGRAPHIC_DIVISION",
            "^SEQUENCE_NUMBER$" = "CITY_SEQUENCE",
            "METROPOLITAN_STATISTICAL_AREA" = "MSA",
            "_ASSLTS_" =  "_ASSLT_",
            "_DETECT_" =  "_DET_",
            "_TOTAL_" =  "_TOTAL_ASSLT_",
            "_TOTAL_TOTAL_" =  "_TOTAL_",
            "TOTAL" = "TOT",
            "ASSLT_ASSLT" = "ASSLT_",
            "STEDST" = "STED",
            "_OTHER_" = "_OTH_",
            "_2400$" = "_0000",
            "FEET" = "FT",
            "2_MAN" = "2MAN",
            "0101" = "0001",
            "_SUSPIC_" = "_SUSP_PERS_",
            "_$" = "",
            "MAN_MAN_" = "MAN_",
            "^(...)_OTH" = "\\1_ALL_OTH",
            "_CIV_DIS_" = "_CIVIL_DISORDER_",
            "_ASSLT_ASSAULT$|_ASSLTS" = "_ASSLT",
            "CLEAR$" = "CLEARED",
            "_OTHER_" = "_OTH_",
            "_ATTEMPT_" = "_ATT_",
            "_ATT_" = "_ATT_OTH_ARREST_",
            "_OTH_ARREST_OTH_ARREST_" = "_OTH_ARREST_",
            "_DIST_" = "_DISTURBANCE_",
            "_DISTRB_" = "_DISTURBANCE_",
            "VEHICL" = "VEH",
            "_FELONIOUS_ACTS" = "_FELONY",
            "_ACCDNT" = "_ACCIDENT",
            "_W_" = "_WITH_",
            "_INJ_" = "_INJURY_",
            "ASSAULT" = "ASSLT",
            "_WITH_" = "_",
            "_DETEC_" = "_DET_",
            "_OFFCRS_" = "_OFFICERS_",
            "ASSLTS" = "ASSLT",
            "_ASSLT_ASSLT_CLEARED" = "_ASSLT_OF_ASSLT_CLEARED",
            "_DT_RB_" = "_DISTURBANCE_",
            "_9028" = "",
            "ICPSR_SEQ.*" = "ICPSR_SEQUENCE_ID",
            "OFFICER_RATE_PER_1K_POP" = "OFFICERS_PER_1K_POP",
            "EMPLOYEE_RATE_PER_1K_POP" = "EMPLOYEES_PER_1K_POP",
            "NUMERIC_STATE_CODE"       = "STATE"
            )

  col_names <- stringr::str_replace_all(col_names, shifts)
  col_names <- stringr::str_replace_all(col_names, count)
  col_names <- stringr::str_replace_all(col_names, misc)
}

employee_cols <- c("STATE", "ORI_CODE", "GROUP",
                   "GEOGRAPHIC_DIVISION", "YEAR",
                   "MSA", "POPULATION", "AGENCY_NAME",
                   "MALE_EMPLOYEES_OFFICERS", "MALE_EMPLOYEES_CIVILIANS",
                   "MALE_EMPLOYEES_TOT", "FEMALE_EMPLOYEES_OFFICERS",
                   "FEMALE_EMPLOYEES_CIVILIANS", "FEMALE_EMPLOYEES_TOT",
                   "TOT_EMPLOYEES")

leoka <- data.table()
for (i in 1975:2015) {
  temp <- spss_ascii_reader(dataset_name =
                              paste0(i, "_leoka.txt"),
                            sps_name =
                              paste0(i, "_leoka.sps"))
  names(temp) <- name_fixer(names(temp))
  usable_cols <- employee_cols[employee_cols %in% names(temp)]
  temp <- temp[, usable_cols]
  temp <- data.table(temp)

  leoka <- rbind(leoka, temp, fill = TRUE)
  message(paste(i, "Length:      ", length(names(leoka)),
                 "Duplicated:        ",
                 names(leoka)[duplicated(names(leoka))]))
  gc()

}


leoka <- leoka[leoka$YEAR %in% 1990:2015, ]
leoka$GEOGRAPHIC_DIVISION <- NULL
leoka$GROUP <- NULL
leoka$MSA <- NULL
leoka$AGENCY_NAME <- NULL
leoka$state_abb <- substr(leoka$ORI_CODE, 1, 2)
unique(leoka$state_abb)
leoka_agg <- aggregate(cbind(MALE_EMPLOYEES_OFFICERS, MALE_EMPLOYEES_CIVILIANS,
                             MALE_EMPLOYEES_TOT, FEMALE_EMPLOYEES_OFFICERS,
                             FEMALE_EMPLOYEES_CIVILIANS, FEMALE_EMPLOYEES_TOT,
                             TOT_EMPLOYEES) ~ state_abb + YEAR, data = leoka,
                       FUN = sum)
leoka_agg$total_officers <- leoka_agg$MALE_EMPLOYEES_OFFICERS +
  leoka_agg$FEMALE_EMPLOYEES_OFFICERS
leoka_agg$YEAR <- as.numeric(as.character(leoka_agg$YEAR))
names(leoka_agg)[3:10] <- paste0("leoka_", names(leoka_agg)[3:10])
names(leoka_agg) <- tolower(names(leoka_agg))
leoka_agg$state_abb <- gsub("NB", "NE", leoka_agg$state_abb)
leoka_agg <- leoka_agg[!leoka_agg$state_abb %in% c("VI", "CZ", "GM", "PR"), ]

setwd("C:/Users/user/Dropbox/R_project/aspep/data/state_and_local")
aspep <- readr::read_csv("aspep_1993_2016_state_and_local.csv")
aspep <- aspep[aspep$government_function %in% "police protection - officers", ]
aspep <- aspep[, c("state", "year", "full_time_equivalent_employees",
                   "full_time_employees",
                   "part_time_employees")]
names(aspep)[3:5] <- paste0("aspep_police_", names(aspep)[3:5])
names(aspep)[1] <- "state_abb"
names(aspep) <- tolower(names(aspep))


leoka_aspep <- dplyr::left_join(leoka_agg, aspep)
leoka_aspep <- leoka_aspep[order(leoka_aspep$year, leoka_aspep$state_abb), ]
readr::write_csv(leoka_aspep, "leoka_aspep.csv")
