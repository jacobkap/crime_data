
injury_cols <- c("JAN_ASSAULT_INJURY", "FEB_ASSLT_INJURY",
                 "MAR_ASSAULT_INJURY", "APR_ASSLT_INJURY",
                 "MAY_ASSAULT_INJURY", "JUN_ASSLT_INJURY",
                 "JUL_ASSAULT_INJURY", "AUG_ASSLT_INJURY",
                 "SEP_ASSAULT_INJURY", "OCT_ASSLT_INJURY",
                 "NOV_ASSAULT_INJURY", "DEC_ASSLT_INJURY",
                 "JAN_ASSAULT_NO_INJURY", "FEB_ASSLT_NO_INJURY",
                 "MAR_ASSAULT_NO_INJURY", "APR_ASSLT_NO_INJURY",
                 "MAY_ASSAULT_NO_INJURY", "JUN_ASSLT_NO_INJURY",
                 "JUL_ASSAULT_NO_INJURY", "AUG_ASSLT_NO_INJURY",
                 "SEP_ASSAULT_NO_INJURY", "OCT_ASSAULT_NO_INJURY",
                 "NOV_ASSAULT_NO_INJURY", "DEC_ASSAULT_NO_INJURY")
indicator_cols <- c("JAN_MONTH_INDICATOR", "FEB_MONTH_INDICATOR",
                    "MAR_MONTH_INDICATOR", "APR_MONTH_INDICATOR",
                    "MAY_MONTH_INDICATOR", "JUN_MONTH_INDICATOR",
                    "JUL_MONTH_INDICATOR", "AUG_MONTH_INDICATOR",
                    "SEP_MONTH_INDICATOR", "OCT_MONTH_INDICATOR",
                    "NOV_MONTH_INDICATOR", "DEC_MONTH_INDICATOR")
misc_cols <- c("STATE", "GROUP", "SUB_GROUP", "GEOGRAPHIC_DIVISION",
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
  "_CUSTODY_"                  = "_CUST_PRISONERS_",
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
  "_ASSLT_OF_ASSLT_"             = "_ASSLT_",
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
            "^OTHER_PATROLS_OTHER$" = "OTHER_PATROL_OTHER_SHIFT",
            "^OTHER_PATROLS_TOTAL$" = "OTHER_PATROL_TOTAL_SHIFT",
            "^TOTAL_PATROLS_OTHER$" = "TOTAL_PATROL_OTHER_SHIFT",
            "^TOTAL_PATROLS_TOTAL$" = "TOTAL_PATROL_TOTAL_SHIFT")

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
          "ORI_CODE"                      = "ORI",
          "TOT_EMPLOYEES"                 = "TOTAL_EMPLOYEES",
          "SMSA"                          = "MSA",
          "TOT_ASSLT_OF_ASSLT_CLEARED"    = "TOT_ASSLT_CLEARED",
          "CUST_OF_PRISONERS"             = "CUST_PRISONERS",
          "ASSLT"                         = "ASSAULT",
          "TOT"                           = "TOTAL",
          "_FT"                           = "_FEET",
          "TOTALAL"                       = "TOTAL",
          "TOT_ASSLT_TOT_ASSLT"           = "TOT_ASSLT",
          "ASSISTED"                      = "ASSIST",
          "CLEARED"                       = "CLEAR",
          "PATROLS"                       = "PATROL",
          "TOTAL_ASSAULT_TOTAL_ASSAULT"   = "TOTAL_ASSAULT_TOTAL"
)

yearly_cols <- c("officers_killed_felony",
                 "officers_killed_accident",
                 "assault_injury_gun",
                 "assault_injury_knife",
                 "assault_injury_other",
                 "assault_injury_hand_feet",
                 "assault_injury_total",
                 "assault_no_injury_gun",
                 "assault_no_injury_knife",
                 "assault_no_injury_other",
                 "assault_no_injury_hand_feet",
                 "assault_no_injury_total",
                 "disturbance_total_assault",
                 "disturbance_gun",
                 "disturbance_knife",
                 "disturbance_other",
                 "disturbance_hand_feet",
                 "disturbance_2man_veh",
                 "disturbance_1man_alone",
                 "disturbance_1man_assist",
                 "disturbance_det_alone",
                 "disturbance_det_assist",
                 "disturbance_oth_alone",
                 "disturbance_oth_assist",
                 "disturbance_assault_clear",
                 "burglary_total_assault",
                 "burglary_gun",
                 "burglary_knife",
                 "burglary_other",
                 "burglary_hand_feet",
                 "burglary_2man_veh",
                 "burglary_1man_alone",
                 "burglary_1man_assist",
                 "burglary_det_alone",
                 "burglary_det_assist",
                 "burglary_oth_alone",
                 "burglary_oth_assist",
                 "burglary_assault_clear",
                 "robbery_total_assault",
                 "robbery_gun",
                 "robbery_knife",
                 "robbery_other",
                 "robbery_hand_feet",
                 "robbery_2man_veh",
                 "robbery_1man_alone",
                 "robbery_1man_assist",
                 "robbery_det_alone",
                 "robbery_det_assist",
                 "robbery_oth_alone",
                 "robbery_oth_assist",
                 "robbery_assault_clear",
                 "att_oth_arrest_total_assault",
                 "att_oth_arrest_gun",
                 "att_oth_arrest_knife",
                 "att_oth_arrest_other",
                 "att_oth_arrest_hand_feet",
                 "att_oth_arrest_2man_veh",
                 "att_oth_arrest_1man_alone",
                 "att_oth_arrest_1man_assist",
                 "att_oth_arrest_det_alone",
                 "att_oth_arrest_det_assist",
                 "att_oth_arrest_oth_alone",
                 "att_oth_arrest_oth_assist",
                 "att_oth_arrest_assault_clear",
                 "civil_disorder_total_assault",
                 "civil_disorder_gun",
                 "civil_disorder_knife",
                 "civil_disorder_other",
                 "civil_disorder_hand_feet",
                 "civil_disorder_2man_veh",
                 "civil_disorder_1man_alone",
                 "civil_disorder_1man_assist",
                 "civil_disorder_det_alone",
                 "civil_disorder_det_assist",
                 "civil_disorder_oth_alone",
                 "civil_disorder_oth_assist",
                 "civil_disorder_assault_clear",
                 "cust_prisoners_total_assault",
                 "cust_prisoners_gun",
                 "cust_prisoners_knife",
                 "cust_prisoners_other",
                 "cust_prisoners_hand_feet",
                 "cust_prisoners_2man_veh",
                 "cust_prisoners_1man_alone",
                 "cust_prisoners_1man_assist",
                 "cust_prisoners_det_alone",
                 "cust_prisoners_det_assist",
                 "cust_prisoners_oth_alone",
                 "cust_prisoners_oth_assist",
                 "cust_prisoners_assault_clear",
                 "susp_pers_total_assault",
                 "susp_pers_gun",
                 "susp_pers_knife",
                 "susp_pers_other",
                 "susp_pers_hand_feet",
                 "susp_pers_2man_veh",
                 "susp_pers_1man_alone",
                 "susp_pers_1man_assist",
                 "susp_pers_det_alone",
                 "susp_pers_det_assist",
                 "susp_pers_oth_alone",
                 "susp_pers_oth_assist",
                 "susp_pers_assault_clear",
                 "ambush_total_assault",
                 "ambush_gun",
                 "ambush_knife",
                 "ambush_other",
                 "ambush_hand_feet",
                 "ambush_2man_veh",
                 "ambush_1man_alone",
                 "ambush_1man_assist",
                 "ambush_det_alone",
                 "ambush_det_assist",
                 "ambush_oth_alone",
                 "ambush_oth_assist",
                 "ambush_assault_clear",
                 "deranged_total_assault",
                 "deranged_gun",
                 "deranged_knife",
                 "deranged_other",
                 "deranged_hand_feet",
                 "deranged_2man_veh",
                 "deranged_1man_alone",
                 "deranged_1man_assist",
                 "deranged_det_alone",
                 "deranged_det_assist",
                 "deranged_oth_alone",
                 "deranged_oth_assist",
                 "deranged_assault_clear",
                 "traffic_total_assault",
                 "traffic_gun",
                 "traffic_knife",
                 "traffic_other",
                 "traffic_hand_feet",
                 "traffic_2man_veh",
                 "traffic_1man_alone",
                 "traffic_1man_assist",
                 "traffic_det_alone",
                 "traffic_det_assist",
                 "traffic_oth_alone",
                 "traffic_oth_assist",
                 "traffic_assault_clear",
                 "all_oth_total_assault",
                 "all_oth_gun",
                 "all_oth_knife",
                 "all_oth_other",
                 "all_oth_hand_feet",
                 "all_oth_2man_veh",
                 "all_oth_1man_alone",
                 "all_oth_1man_assist",
                 "all_oth_det_alone",
                 "all_oth_det_assist",
                 "all_oth_oth_alone",
                 "all_oth_oth_assist",
                 "all_oth_assault_clear",
                 "total_assault_total",
                 "total_assault_gun",
                 "total_assault_knife",
                 "total_assault_other",
                 "total_assault_hand_feet",
                 "total_assault_2man_veh",
                 "total_assault_1man_alone",
                 "total_assault_1man_assist",
                 "total_assault_det_alone",
                 "total_assault_det_assist",
                 "total_assault_oth_alone",
                 "total_assault_oth_assist",
                 "total_assault_clear",
                 "time_of_assault_0001_to_0200",
                 "time_of_assault_0201_to_0400",
                 "time_of_assault_0401_to_0600",
                 "time_of_assault_0601_to_0800",
                 "time_of_assault_0801_to_1000",
                 "time_of_assault_1001_to_1200",
                 "time_of_assault_1201_to_1400",
                 "time_of_assault_1401_to_1600",
                 "time_of_assault_1601_to_1800",
                 "time_of_assault_1801_to_2000",
                 "time_of_assault_2001_to_2200",
                 "time_of_assault_2201_to_0000")

injury_col_fix <- c("^informt complete$"      = "information complete",
                    "^asslts not reptd$"      = "assaults not reported",
                    "^assaults not reported$" = "assaults not reported",
                    "^information complete$"  = "information complete",
                    "^assaults not rep$"     = "assaults not reported",
                    "^informat complet$"      = "information complete",
                    "^info complete$"         = "information complete")

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
                "the "               = "")

shift_data <- c("reported,no data" = "reported, no data",
                "09"               = NA,
                "^n$"              = NA)

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

  data[injury_cols2] <- sapply(data[injury_cols2], tolower)
  data[indicator_cols2] <- sapply(data[indicator_cols2], tolower)

  data[injury_cols2] <- sapply(data[injury_cols2], str_replace_all,
                               injury_col_fix)
  data[indicator_cols2] <- sapply(data[indicator_cols2], str_replace_all,
                                  indicator_col_fix)
  data$STATE <- str_replace_all(data$STATE, states)
  data$GEOGRAPHIC_DIVISION <- str_replace_all(data$GEOGRAPHIC_DIVISION,
                                              division)
  data$GROUP <- str_replace_all(data$GROUP, group_number)
  if (any(grepl("SUB_GROUP", names(data)))) {
    data$SUB_GROUP <- str_replace_all(data$SUB_GROUP, sub_group)
    data$SUB_GROUP <- str_replace_all(data$SUB_GROUP, group_number)
  }
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

  data$YEAR <- as.numeric(data$YEAR)
  data$POPULATION <- as.numeric(data$POPULATION)
  return(data)
}


name_fixer <- function(col_names) {
  col_names <- stringr::str_replace_all(col_names, many_col_names)
  col_names <- stringr::str_replace_all(col_names, shifts)
  col_names <- stringr::str_replace_all(col_names, count)
  col_names <- stringr::str_replace_all(col_names, misc)
}

# Fixes officers/employees per 1k pop. columns
fix_persons_per_1k <- function(data) {
  data$TOTAL_OFFICERS       <- rowSums(data[, c("MALE_EMPLOYEES_OFFICERS",
                                                "FEMALE_EMPLOYEES_OFFICERS")])
  data$TOTAL_CIVILIANS      <- rowSums(data[, c("MALE_EMPLOYEES_CIVILIANS",
                                                "FEMALE_EMPLOYEES_CIVILIANS")])
  data$OFFICERS_PER_1K_POP  <- NULL
  data$EMPLOYEES_PER_1K_POP <- NULL

  # data$EMPLOYEES_PER_1K_POP <- data$TOTAL_EMPLOYEES / data$POPULATION * 1000
  # data$OFFICERS_PER_1K_POP  <- data$TOTAL_OFFICERS  / data$POPULATION * 1000
  # data$CIVILIANS_PER_1K_POP <- data$TOTAL_CIVILIANS / data$POPULATION * 1000
  #
  # data$EMPLOYEES_PER_1K_POP[is.nan(data$EMPLOYEES_PER_1K_POP) |
  #                             is.infinite(data$EMPLOYEES_PER_1K_POP)] <- NA
  # data$OFFICERS_PER_1K_POP[is.nan(data$OFFICERS_PER_1K_POP) |
  #                            is.infinite(data$OFFICERS_PER_1K_POP) ] <- NA
  # data$CIVILIANS_PER_1K_POP[is.nan(data$CIVILIANS_PER_1K_POP) |
  #                             is.infinite(data$CIVILIANS_PER_1K_POP)] <- NA
  return(data)
}



words_in_num_cols <- c("^$"      = "",
                       "blank"   = NA,
                       "missing" = NA)


# These columns should be first in the final monthly/yearly data
starting_cols <- c("covered_by_oth_agency",
                   "group",
                   "sub_group",
                   "geographic_division",
                   "city_sequence",
                   "msa",
                   "population",
                   "agency_name",
                   "total_officers",
                   "male_employees_officers",
                   "female_employees_officers",
                   "total_civilians",
                   "male_employees_civilians",
                   "female_employees_civilians",
                   "total_employees",
                   "male_employees_total",
                   "female_employees_total",
                   "month_included",
                   "shift_data",
                   "no_male_female_breakdown")


order_columns <- function(data, monthly = TRUE) {

  crosswalk <- read_merge_crosswalks()
  crosswalk_cols <- names(crosswalk)
  crosswalk_cols <- crosswalk_cols[!crosswalk_cols %in% c("ori", "ori9")]
  crosswalk_cols <- c("ori", "ori9", "year", "state", "state_abb",
                      crosswalk_cols)

  indicator_cols <- grep("asslt_(no_)?injury$|indicator",
                         names(data),
                         value = TRUE)
  starting_cols  <- starting_cols[starting_cols %in% names(data)]
  starting_cols  <- starting_cols[starting_cols != "ori"]


  killed_felony_cols     <- grep("officers_killed_felony",
                                 names(data), value = TRUE)
  killed_accident_cols   <- grep("officers_killed_accident",
                                 names(data), value = TRUE)
  assault_injury_cols    <- grep("assault_injury$",
                                 names(data), value = TRUE)
  assault_no_injury_cols <- grep("assault_no_injury$",
                                 names(data), value = TRUE)
  other_assault_injury_cols    <- grep("assault_injury_",
                                       names(data), value = TRUE)
  other_assault_no_injury_cols <- grep("assault_no_injury_",
                                       names(data), value = TRUE)
  shift_cols             <- grep("_shift",
                                 names(data), value = TRUE)
  disturbance_cols       <- grep("disturbance_",
                                 names(data), value = TRUE)
  burglary_cols          <- grep("burglary_",
                                 names(data), value = TRUE)
  robbery_cols           <- grep("robbery_",
                                 names(data), value = TRUE)
  att_other_arrest_cols  <- grep("att_oth_arrest_",
                                 names(data), value = TRUE)
  civil_disorder_cols    <- grep("civil_disorder_",
                                 names(data), value = TRUE)
  cust_prisoners_cols    <- grep("cust_prisoners_",
                                 names(data), value = TRUE)
  susp_pers_cols         <- grep("susp_pers_",
                                 names(data), value = TRUE)
  ambush_cols            <- grep("ambush_",
                                 names(data), value = TRUE)
  deranged_cols          <- grep("deranged_",
                                 names(data), value = TRUE)
  traffic_cols           <- grep("traffic_",
                                 names(data), value = TRUE)
  all_other_cols         <- grep("all_oth_",
                                 names(data), value = TRUE)
  total_assault          <- grep("total_assault_",
                                 names(data), value = TRUE)
  time_cols              <- grep("time_of_assault",
                                 names(data), value = TRUE)
  if (monthly) {
    data <- left_join(data, crosswalk)
  }
  data <-
    data %>%
    dplyr::select(crosswalk_cols,
                  starting_cols,
                  indicator_cols,
                  assault_injury_cols,
                  assault_no_injury_cols,
                  killed_felony_cols,
                  killed_accident_cols,
                  other_assault_injury_cols,
                  other_assault_no_injury_cols,
                  disturbance_cols,
                  burglary_cols,
                  robbery_cols,
                  att_other_arrest_cols,
                  civil_disorder_cols,
                  cust_prisoners_cols,
                  susp_pers_cols,
                  ambush_cols,
                  deranged_cols,
                  traffic_cols,
                  all_other_cols,
                  total_assault,
                  time_cols,
                  shift_cols,
                  dplyr::everything())

  return(data)
}
