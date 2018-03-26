injury_cols <- c("JAN_ASSLT_INJURY", "FEB_ASSLT_INJURY",
                 "MAR_ASSLT_INJURY", "APR_ASSLT_INJURY",
                 "MAY_ASSLT_INJURY", "JUN_ASSLT_INJURY",
                 "JUL_ASSLT_INJURY", "AUG_ASSLT_INJURY",
                 "SEP_ASSLT_INJURY", "OCT_ASSLT_INJURY",
                 "NOV_ASSLT_INJURY", "DEC_ASSLT_INJURY",
                 "JAN_ASSLT_NO_INJURY", "FEB_ASSLT_NO_INJURY",
                 "MAR_ASSLT_NO_INJURY", "APR_ASSLT_NO_INJURY",
                 "MAY_ASSLT_NO_INJURY", "JUN_ASSLT_NO_INJURY",
                 "JUL_ASSLT_NO_INJURY", "AUG_ASSLT_NO_INJURY",
                 "SEP_ASSLT_NO_INJURY", "OCT_ASSLT_NO_INJURY",
                 "NOV_ASSLT_NO_INJURY", "DEC_ASSLT_NO_INJURY")
indicator_cols <- c("JAN_MONTH_INDICATOR", "FEB_MONTH_INDICATOR",
                    "MAR_MONTH_INDICATOR", "APR_MONTH_INDICATOR",
                    "MAY_MONTH_INDICATOR", "JUN_MONTH_INDICATOR",
                    "JUL_MONTH_INDICATOR", "AUG_MONTH_INDICATOR",
                    "SEP_MONTH_INDICATOR", "OCT_MONTH_INDICATOR",
                    "NOV_MONTH_INDICATOR", "DEC_MONTH_INDICATOR")
misc_cols <- c("STATE", "GROUP", "GEOGRAPHIC_DIVISION",
               "YEAR", "REPORT_INDICATOR", "RECORD_INDICATOR",
               "MONTH_INCLUDED", "COVERED_BY_OTH_AGENCY", "SHIFT_DATA",
               "POPULATION")

many_col_names <- c(
  # Months
  "(.*)_JAN" = "JAN_\\1",
  "(.*)_FEB" = "FEB_\\1",
  "(.*)_MAR" = "MAR_\\1",
  "(.*)_APR" = "APR_\\1",
  "(.*)_MAY" = "MAY_\\1",
  "(.*)_JUN" = "JUN_\\1",
  "(.*)_JUL" = "JUL_\\1",
  "(.*)_AUG" = "AUG_\\1",
  "(.*)_SEP" = "SEP_\\1",
  "(.*)_OCT" = "OCT_\\1",
  "(.*)_NOV" = "NOV_\\1",
  "(.*)_DEC" = "DEC_\\1",


  "_ASLT_"                               = "_ASSLTS_",
  "_([0-9]{2})$"                         = "_\\100",
  "_([0-9]{2})_"                         = "_\\101_TO_",
  "_TOT_WPN$"                            = "_TOT_ASSLTS",
  "IES_"                                 = "Y_",
  "BURGLAR_"                             = "BURGLARY_",
  "_OTHRS_|_OTHR_"                       = "_OTH_",
  "_OTHR$"                               = "_OTHER",
  "_ALOE|_AONE|_ALN$|_ALNE$|_LONE$|_AL$" = "_ALONE",
  "_ONE_ALONE|_1_ALONE|_1_MA$"           = "_1MAN_ALONE",
  "ASSNMT_1$|_1_ALON$|_ONE_ALONE"        = "_1MAN_ALONE",
  "1_ASSI$|1MAN_ASST$"                   = "1MAN_ASSISTED",
  "VEHICLE|VEHIC$|VEHI$|VEHILE"          = "VEH",
  "2_VEH"                                = "2MAN_VEH",
  "_TYPE_OF_WEAP_"                       = "_WEAP_",
  "_TOT_CALLS_"                          = "_TOT_ASSLTS_",

  # Shift schedule
  "DAY$"     = "DAY_SHIFT",
  "EVENING$" = "EVENING_SHIFT",
  "NIGHT$"   = "NIGHT_SHIFT",

  # Injury
  "_NO_INJ_" = "_WITHOUT_INJURY_",

  # Crime types
  "_TRAFF_PURS_STOPS_"         = "_TRAFFIC_",
  "_MENT_DERANGED_|_MENTAL_"   = "_DERANGED_",
  "_AMBUSH_NO_WARN_"           = "_AMBUSH_",
  "_CUSTODY_"                  = "_CUST_OF_PRISONERS_",
  "^(...)_DISORDER"            = "\\1_CIVIL_DISORDER",
  "_DISTRBNC_CALLS_|_DISTURB_" = "_DISTURBANCE_",
  "_SUSPIC_PERSONS_"           = "_SUSP_PERS_",

  # Assignment
  "_2_VE.*|_2_V$" = "_2MAN_VEH",
  "_DETE$"        = "_DET_ALONE",

  # Killed
  "_ACS$"                     = "_ACTS",
  "_OFC_KILLED_FELONY"        = "_OFFICERS_KILLED_FELONIOUS_ACTS",
  "_OFC_KILLED_ACCID"         = "_OFFICERS_KILLED_ACCIDENT",
  "_WITH_INJURY_"             = "_INJURY_",
  "_TOTAL$"                   = "_TOT",
  "_DTV_"                     = "_DET_",
  "_OTHR_ALONE"               = "_OTH_ALONE",
  "_ASSI|_ASST"               = "_ASSISTED",
  "_OTHR_ASS|_OTHR_ASI"       = "_OTH_ASS",
  "_OTHR_SSI$|_OTH_SSI"       = "_OTH_ASS",
  "_ASSNMT_|_ASSN_"           = "_",
  "_ASSISTEDSTED|_ASI$|_ASS$" = "_ASSISTED",

  # Assaults cleared
  "_ASSLTS_CLRD|_ASSLTS_CLR"     = "_ASSLT_CLEARED",
  "_ASSLTS_CRD|_ASSLTS_LRD"      = "_ASSLT_CLEARED",
  "_ASSLTSCLRD|_ASSLT_CLRD"      = "_ASSLT_CLEARED",
  "_ASSLTS_CLRD|ASSLT_CLD"       = "_ASSLT_CLEARED",
  "_PLCE_|_POL_"                 = "_",
  "_OTH_ARRS_|_ATTMPT_OTHR_ARR_" = "_ATT_OTH_ARREST_",
  "ARMS"                         = "ARM",
  "_TYPE_"                       = "_",
  "_TOT$"                        = "_TOTAL",
  "TOT_ASSLTS_ASLT_CLRS"         = "_TOT_ASSLT_CLEARED",
  "CLEAREDS"                     = "CLEARED",
  "_CLD$"                        = "_CLEARED",
  "_ASSLT_OF_ASSLT_"              = "_ASSLT_",
  "_TOT_ASSLT_TOT_"              = "_TOT_",


  # Weapons
  "_NO_WPN"                             = "_HAND_FT",
  "_GUN$|_WEAP_FIREARM.*|_WEAP_FIREAMS" = "_WEAP_GUN",
  "_FIREARM$|_FIREARS"                  = "_WEAP_GUN",
  "_FEE$|_FE$"                          = "_FT",
  "_HAND_FT"                            = "_WEAP_HAND_FT",
  "_KNIFE$"                             = "_WEAP_KNIFE",
  "_OTHER$"                             = "_WEAP_OTHER",
  "_+"                                  = "_",
  "WEAP_WEAP"                           = "WEAP_",
  "HANDS"                               = "HAND",
  "HAND_F$|HAND_T$|HANDFT"              = "HAND_FT",
  "_+"                                  = "_",
  "_ATTMPT_"                            = "_ATT_",
  "_ARR_"                               = "_ARREST_",
  "_W_O_|_WITHOUT_"                     = "_NO_",
  "^(...)_ASSLTS_INJURY"                = "\\1_ASSAULT_WITH_INJURY",
  "^(...)_ASSLTS_NO_INJURY"             = "\\1_ASSAULT_NO_INJURY",
  "_ASLT$"                              = "_ASSLTS",
  "_1_"                                 = "_1MAN_",
  "_WEAP_"                              = "_",
  "^ONE_VEH"                            = "ONE_MAN_VEH",
  "^ONE_FOOT"                           = "ONE_MAN_FOOT"
)


shifts <- c("^ONE_MAN_VEH_OTHER$"   = "ONE_MAN_VEH_OTHER_SHIFT",
            "^ONE_MAN_VEH_TOTAL$"   = "ONE_MAN_VEH_TOTAL_SHIFT",
            "^TWO_MAN_VEH_OTHER$"   = "TWO_MAN_VEH_OTHER_SHIFT",
            "^TWO_MAN_VEH_TOTAL$"   = "TWO_MAN_VEH_TOTAL_SHIFT",
            "^ONE_MAN_FOOT_OTHER$"  = "ONE_MAN_FOOT_OTHER_SHIFT",
            "^ONE_MAN_FOOT_TOTAL$"  = "ONE_MAN_FOOT_TOTAL_SHIFT",
            "^TWO_MAN_FOOT_OTHER$"  = "TWO_MAN_FOOT_OTHER_SHIFT",
            "^TWO_MAN_FOOT_TOTAL$"  = "TWO_MAN_FOOT_TOTAL_SHIFT",
            "^OTHER_PATROLS_OTHER$" = "OTHER_PATROLS_OTHER_SHIFT",
            "^OTHER_PATROLS_TOTAL$" = "OTHER_PATROLS_TOTAL_SHIFT",
            "^TOTAL_PATROLS_OTHER$" = "TOTAL_PATROLS_OTHER_SHIFT",
            "^TOTAL_PATROLS_TOTAL$" = "TOTAL_PATROLS_TOTAL_SHIFT")

count <- c("^NUMBER_MALE_OFFICERS$"    = "MALE_EMPLOYEES_OFFICERS",
           "^NUMBER_MALE_CIVILIANS$"   = "MALE_EMPLOYEES_CIVILIANS",
           "^TOTAL_MALE_EMPLOYEES$"    = "MALE_EMPLOYEES_TOTAL",
           "^NUMBER_FEMALE_OFFICERS$"  = "FEMALE_EMPLOYEES_OFFICERS",
           "^NUMBER_FEMALE_CIVILIANS$" = "FEMALE_EMPLOYEES_CIVILIANS",
           "^TOTAL_FEMALE_EMPLOYEES$"  = "FEMALE_EMPLOYEES_TOTAL",
           "^OFFICER_RATE.*$"          = "OFFICERS_PER_1K_POP",
           "^EMPLOYEE_RATE.*"          = "EMPLOYEES_PER_1K_POP")

misc <- c("^POP$"                         = "POPULATION",
          "^STATE_CODE$"                  = "NUMERIC_STATE_CODE",
          "^SEQUENTIAL_ID$"               = "ICPSR_SEQ_ID_NUMBER",
          "^DIVISION$"                    = "GEOGRAPHIC_DIVISION",
          "^SEQUENCE_NUMBER$"             = "CITY_SEQUENCE",
          "METROPOLITAN_STATISTICAL_AREA" = "MSA",
          "_ASSLTS_"                      =  "_ASSLT_",
          "_DETECT_"                      =  "_DET_",
          "_TOTAL_"                       =  "_TOTAL_ASSLT_",
          "_TOTAL_TOTAL_"                 =  "_TOTAL_",
          "TOTAL"                         = "TOT",
          "ASSLT_ASSLT"                   = "ASSLT_",
          "STEDST"                        = "STED",
          "_OTHER_"                       = "_OTH_",
          "_2400$"                        = "_0000",
          "FEET"                          = "FT",
          "2_MAN"                         = "2MAN",
          "0101"                          = "0001",
          "_SUSPIC_"                      = "_SUSP_PERS_",
          "_$"                            = "",
          "MAN_MAN_"                      = "MAN_",
          "^(...)_OTH"                    = "\\1_ALL_OTH",
          "_CIV_DIS_"                     = "_CIVIL_DISORDER_",
          "_ASSLT_ASSAULT$|_ASSLTS"       = "_ASSLT",
          "CLEAR$"                        = "CLEARED",
          "_OTHER_"                       = "_OTH_",
          "_ATTEMPT_"                     = "_ATT_",
          "_ATT_"                         = "_ATT_OTH_ARREST_",
          "_OTH_ARREST_OTH_ARREST_"       = "_OTH_ARREST_",
          "_DIST_"                        = "_DISTURBANCE_",
          "_DISTRB_"                      = "_DISTURBANCE_",
          "VEHICL"                        = "VEH",
          "_FELONIOUS_ACTS"               = "_FELONY",
          "_ACCDNT"                       = "_ACCIDENT",
          "_W_"                           = "_WITH_",
          "_INJ_"                         = "_INJURY_",
          "ASSAULT"                       = "ASSLT",
          "_WITH_"                        = "_",
          "_DETEC_"                       = "_DET_",
          "_OFFCRS_"                      = "_OFFICERS_",
          "ASSLTS"                        = "ASSLT",
          "_ASSLT_ASSLT_CLEARED"          = "_ASSLT_CLEARED",
          "_DT_RB_"                       = "_DISTURBANCE_",
          "_9028"                         = "",
          "ICPSR_SEQ.*"                   = "ICPSR_SEQUENCE_ID",
          "NUMERIC_STATE_CODE"            = "STATE",
          "ORI_CODE"                      = "ORI"
)

injury_col_fix <- c("informt complete"      = "information complete",
                    "asslts not reptd"      = "assaults not reported",
                    "assaults not reported" = "assaults not reported",
                    "information complete"  = "information complete",
                    "assaults not rep$"     = "assaults not reported",
                    "informat complet"      = "information complete",
                    "info complete"         = "information complete")
indicator_col_fix <- c("reported,no data"   = "reported, no data")

month_included <- c("12" = "december")

report_indicator <- c("asslt tabs only"  = "assault tabs only",
                      "city list assaul" = "city list and assault tabs only")

record_indicator <- c("^data not updated$" = "not updated, no police employee data",
                      "^data updated$"     = "police employee data has been updated",
                      "^prev yrs data$"    = "contains data from previous year",
                      "^not updated,none$" = "not updated, no police employee data",
                      "^pol employ data$"  = "police employee data has been updated",
                      "^contains pol da$"  = "contains data from previous year",
                      "^pol employ da$"    = "police employee data has been updated",
                      "^updated$"          = "police employee data has been updated",
                      "^not updated$"      = "not updated, no police employee data",
                      "^previous yr data$" = "contains data from previous year",
                      "^contains police employee data from pre$" = "contains data from previous year")

covered_by <- c("^all others$"       = "no, agency not covered by another",
                "^cvrd by othr agn$" = "yes, agency is covered by another",
                "^agency covered$"   = "yes, agency is covered by another",
                "^not covered$"      = "no, agency not covered by another",
                "^covered$"          = "yes, agency is covered by another",
                "^no, the agency is not covered by anoth$" = "no, agency not covered by another",
                "the " = "")

shift_data <- c("reported,no data" = "reported, no data",
                "09" = NA,
                "^n$" = NA)

remove_blanks <- function(x) {
  x <- tolower(x)
  x[x %in% c("blank", "missing")] <- NA
  x <- as.numeric(x)
  return(x)
}


clean_leoka_cols <- function(data, cols) {
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
  data[cols] <- sapply(data[cols], tolower)
  injury_cols2 <- injury_cols[injury_cols %in% cols]
  indicator_cols2 <- indicator_cols[indicator_cols %in% cols]

  data[injury_cols2] <- sapply(data[injury_cols2], str_replace_all,
                               injury_col_fix)
  data[indicator_cols2] <- sapply(data[indicator_cols2], str_replace_all,
                                  indicator_col_fix)
  data$STATE <- str_replace_all(data$STATE, states)
  data$GEOGRAPHIC_DIVISION <- str_replace_all(data$GEOGRAPHIC_DIVISION,
                                              division)
  data$GROUP <- str_replace_all(data$GROUP, group_number)
  data$YEAR <- str_replace_all(data$YEAR, years)
  data$MONTH_INCLUDED <- str_replace_all(data$MONTH_INCLUDED,
                                         month_included)
  data$REPORT_INDICATOR <- str_replace_all(data$REPORT_INDICATOR,
                                           report_indicator)
  data$RECORD_INDICATOR <- str_replace_all(data$RECORD_INDICATOR,
                                           record_indicator)
  data$COVERED_BY_OTH_AGENCY <- str_replace_all(data$COVERED_BY_OTH_AGENCY,
                                                covered_by)
  if ("SHIFT_DATA" %in% names(data)) {
    data$SHIFT_DATA <- str_replace_all(data$SHIFT_DATA, shift_data)
  }

  return(data)
}


name_fixer <- function(col_names) {
  col_names <- stringr::str_replace_all(col_names, many_col_names)
  col_names <- stringr::str_replace_all(col_names, shifts)
  col_names <- stringr::str_replace_all(col_names, count)
  col_names <- stringr::str_replace_all(col_names, misc)
}

