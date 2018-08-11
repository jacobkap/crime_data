devtools::install_github("jacobkap/asciiSetupReader")
library(asciiSetupReader)
library(data.table)
library(stringr)
library(dplyr)
library(tidyr)
library(data.table)

offense_codes <- c("^01A$" = "Murder and non-negligent manslaughter",
                   "^01B$" = "Manslaughter by negligence",
                   "^02$"  = "Forcible rape",
                   "^03$"  = "Robbery",
                   "^04$"  = "Aggravated assault",
                   "^05$"  = "Burglary-breaking or entering",
                   "^06$"  = "Larceny-theft (not motor vehicle)",
                   "^07$"  = "Motor vehicle theft",
                   "^08$"  = "Other assaults",
                   "^09$"  = "Arson",
                   "^10$"  = "Forgery and counterfeiting",
                   "^11$"  = "Fraud",
                   "^12$"  = "Embezzlement",
                   "^13$"  = "Stolen property-buy, receive, poss.",
                   "^14$"  = "Vandalism",
                   "^15$"  = "Weapons-carry, posses, etc.",
                   "^16$"  = "Prostitution and commercialized vice",
                   "^17$"  = "Sex offenses (not rape or prostitution)",
                   "^18$"  = "Total drug abuse violations",
                   "^180$" = "Sale/manufacture (subtotal)",
                   "^185$" = "Possession (subtotal)",
                   "^18A$" = "Sale: Opium, coke, and their derivatives",
                   "^18B$" = "Sale: Marijuana",
                   "^18C$" = "Sale: Truly addicting synthetic narcotics",
                   "^18D$" = "Sale: Other dangerous non-narc drugs",
                   "^18E$" = "Possession: Opium, coke, and their derivatives",
                   "^18F$" = "Possession: Marijuana",
                   "^18G$" = "Possession: Truly addicting synthetic narcotics",
                   "^18H$" = "Possession: Other dangerous non-narc drugs",
                   "^19$"  = "Gambling (total)",
                   "^19A$" = "Bookmaking (horse and sports)",
                   "^19B$" = "Number and lottery",
                   "^19C$" = "All other gambling",
                   "^20$"  = "Offenses against family and children",
                   "^21$"  = "Driving under the influence",
                   "^22$"  = "Liquor laws",
                   "^23$"  = "Drunkenness",
                   "^24$"  = "Disorderly conduct",
                   "^25$"  = "Vagrancy",
                   "^26$"  = "All other offenses (not traffic)",
                   "^27$"  = "Suspicion",
                   "^28$"  = "Curfew and loitering violations",
                   "^29$"  = "Runaways",
                   "^998$" = "Not applicable")

offense_codes_yearly <- c("^11$" = "Murder and non-negligent manslaughter",
                          "^12$" = "Manslaughter by negligence",
                          "^20$"  = "Forcible rape",
                          "^30$"  = "Robbery",
                          "^40$"  = "Aggravated assault",
                          "^50$"  = "Burglary-breaking or entering",
                          "^60$"  = "Larceny-theft (not motor vehicle)",
                          "^70$"  = "Motor vehicle theft",
                          "^80$"  = "Other assaults",
                          "^90$"  = "Arson",
                          "^100$"  = "Forgery and counterfeiting",
                          "^110$"  = "Fraud",
                          "^120$"  = "Embezzlement",
                          "^130$"  = "Stolen property-buy, receive, poss.",
                          "^140$"  = "Vandalism",
                          "^150$"  = "Weapons-carry, posses, etc.",
                          "^160$"  = "Prostitution and commercialized vice",
                          "^170$"  = "Sex offenses (not rape or prostitution)",
                          "^18$"  = "Total drug abuse violations",
                          "^180$" = "Sale/manufacture (subtotal)",
                          "^185$" = "Possession (subtotal)",
                          "^181$" = "Sale: Opium, coke, and their derivatives",
                          "^182$" = "Sale: Marijuana",
                          "^183$" = "Sale: Truly addicting synthetic narcotics",
                          "^184$" = "Sale: Other dangerous non-narc drugs",
                          "^186$" = "Possession: Opium, coke, and their derivatives",
                          "^187$" = "Possession: Marijuana",
                          "^188$" = "Possession: Truly addicting synthetic narcotics",
                          "^189$" = "Possession: Other dangerous non-narc drugs",
                          "^190$"  = "Gambling (total)",
                          "^191$" = "Bookmaking (horse and sports)",
                          "^192$" = "Number and lottery",
                          "^193$" = "All other gambling",
                          "^200$"  = "Offenses against family and children",
                          "^210$"  = "Driving under the influence",
                          "^220$"  = "Liquor laws",
                          "^230$"  = "Drunkenness",
                          "^240$"  = "Disorderly conduct",
                          "^250$"  = "Vagrancy",
                          "^260$"  = "All other offenses (not traffic)",
                          "^270$"  = "Suspicion",
                          "^280$"  = "Curfew and loitering violations",
                          "^290$"  = "Runaways",
                          "^98$" = NA)

arrest_cols <- c("MALE_UNDER_10",
                 "MALE_10_12",
                 "MALE_13_14",
                 "MALE_15",
                 "MALE_16",
                 "MALE_17",
                 "MALE_18",
                 "MALE_19",
                 "MALE_20",
                 "MALE_21",
                 "MALE_22",
                 "MALE_23",
                 "MALE_24",
                 "MALE_25_29",
                 "MALE_30_34",
                 "MALE_35_39",
                 "MALE_40_44",
                 "MALE_45_49",
                 "MALE_50_54",
                 "MALE_55_59",
                 "MALE_60_64",
                 "MALE_OVER_64",
                 "FEMALE_UNDER_10",
                 "FEMALE_10_12",
                 "FEMALE_13_14",
                 "FEMALE_15",
                 "FEMALE_16",
                 "FEMALE_17",
                 "FEMALE_18",
                 "FEMALE_19",
                 "FEMALE_20",
                 "FEMALE_21",
                 "FEMALE_22",
                 "FEMALE_23",
                 "FEMALE_24",
                 "FEMALE_25_29",
                 "FEMALE_30_34",
                 "FEMALE_35_39",
                 "FEMALE_40_44",
                 "FEMALE_45_49",
                 "FEMALE_50_54",
                 "FEMALE_55_59",
                 "FEMALE_60_64",
                 "FEMALE_OVER_64",
                 "ADULT_WHITE",
                 "ADULT_BLACK",
                 "ADULT_INDIAN",
                 "ADULT_ASIAN",
                 "JUVENILE_WHITE",
                 "JUVENILE_BLACK",
                 "JUVENILE_INDIAN",
                 "JUVENILE_ASIAN")

other_cols <- c("NUMERIC_STATE_CODE_FBI_CODE",
                "GROUP",
                "GEOGRAPHIC_DIVISION_OF_STATE",
                "YEAR",
                "MONTH",
                "SUBURBAN_AGENCY",
                "CORE_CITY",
                "COVERED_BY_ANOTHER_AGENCY",
                "POPULATION",
                "AGENCY_NAME")

remove_missing <- function(column) {
  column[column %in% c(99999, 99998, 10000, 20000,
                       30000, 40000, 50000, 60000,
                       70000, 80000, 90000, 100000)] <- 0
  column <- as.numeric(column)
  return(column)
}

remove_not_reported <- function(x) {
  x <- tolower(x)
  x[x == "none/not reported"] <- 0
  x[x == "not applicable"] <- NA
  x <- as.numeric(x)
  return(x)
}


NA_to_zero <- function(column) {
  column[is.na(column)] <- 0
  return(column)
}

index_crimes <- c("murder",
                  "rape",
                  "robbery",
                  "agg_assault",
                  "burglary",
                  "theft",
                  "mtr_veh_theft",
                  "arson")

financial_crimes <- c("embezzlement",
                      "total_gambling",
                      "oth_gambling",
                      "bookmaking",
                      "number_lottery")

grey_collar_and_property_crimes <- c("forgery",
                                     "fraud",
                                     "stolen_property")

violent_crimes <- c("murder",
                    "robbery",
                    "agg_assault",
                    "oth_assault",
                    "weapons",
                    "manslaught_neg")

sex_or_dv_crimes <- c("prostitution",
                      "oth_sex_off",
                      "rape",
                      "family_offenses")

alcohol_crimes <- c("dui",
                    "liquor",
                    "drunkenness")

drug_crimes <- c("total_drug",
                 "sale_drug",
                 "poss_drug",
                 "poss_cannabis",
                 "sale_cannabis",
                 "poss_heroin_coke",
                 "sale_heroin_coke",
                 "poss_oth_drug",
                 "sale_oth_drug",
                 "poss_synth_narc",
                 "sale_synth_narc")

other_crimes <- c("vandalism",
                  "disorder_cond",
                  "oth_non_traffic",
                  "curfew",
                  "vagrancy",
                  # "runaway",
                  "suspicion")

simple_crimes <- c(index_crimes,
                   financial_crimes,
                   grey_collar_and_property_crimes,
                   violent_crimes,
                   sex_or_dv_crimes,
                   drug_crimes,
                   alcohol_crimes,
                   other_crimes)
simple_crimes <- unique(simple_crimes)

combined_crimes <- list(index_crimes,
                        financial_crimes,
                        grey_collar_and_property_crimes,
                        violent_crimes,
                        sex_or_dv_crimes,
                        drug_crimes,
                        alcohol_crimes,
                        other_crimes,
                        simple_crimes)
names(combined_crimes) <- c("index_crimes",
                            "financial_crimes",
                            "grey_collar_and_property_crimes",
                            "violent_crimes",
                            "sex_or_dv_crimes",
                            "drug_crimes",
                            "alcohol_crimes",
                            "other_crimes",
                            "simple_crimes")


offenses <- c("^murder and non-negligent manslaughter$" = "murder",
              "^forcible rape$"                         = "rape",
              "^robbery$"                               = "robbery",
              "^aggravated assault$"                    = "agg_assault",
              "^burglary-breaking or entering$"         = "burglary",
              "^larceny-theft \\(not motor.*"          = "theft",
              "^motor vehicle theft$"                   = "mtr_veh_theft",
              "^other assaults$"                        = "oth_assault",
              "^forgery and counterfeiting$"            = "forgery",
              "^fraud$"                                 = "fraud",
              "^embezzlement$"                          = "embezzlement",
              "^vandalism$"                             = "vandalism",
              "^weapons-carry, posses, etc.$"           = "weapons",
              "^total drug abuse violations"           = "total_drug",
              "^sale/manufacture \\(subtotal\\)$"       = "sale_drug",
              "^sale: opium, coke, and their derivatives$" = "sale_heroin_coke",
              "^possession \\(subtotal\\)$"             = "poss_drug",
              "^possession: marijuana$"                 = "poss_cannabis",
              "^offenses against family and children$"  = "family_offenses",
              "^driving under the influence$"           = "dui",
              "^liquor laws$"                           = "liquor",
              "^drunkenness$"                           = "drunkenness",
              "^disorderly conduct$"                    = "disorder_cond",
              "^all other offenses \\(not traffic\\)$"  = "oth_non_traffic",
              "^curfew and loitering violations$"       = "curfew",
              "^stolen property-buy, receive, poss."   = "stolen_property",
              "^prostitution and commercialized vice$"  = "prostitution",
              "^sale: marijuana$"                       = "sale_cannabis",
              "^possession: opium, coke, and their derivatives$" = "poss_heroin_coke",
              "^sex offenses \\(not rape or prostitution\\)$"   = "oth_sex_off",
              "^possession: other dangerous non-narc drugs$" = "poss_oth_drug",
              "^arson$"                                  = "arson",
              "^sale: other dangerous non-narc drugs$"   = "sale_oth_drug",
              "^vagrancy$"                               = "vagrancy",
              "^possession: truly addicting synthetic narcotics$" = "poss_synth_narc",
              "^runaways$"                               = "runaway",
              "^manslaughter by negligence$"             = "manslaught_neg",
              "^gambling \\(total\\)$"                   = "total_gambling",
              "^bookmaking \\(horse and sports\\)$"      = "bookmaking",
              "^all other gambling$"                     = "oth_gambling",
              "^sale: truly addicting synthetic narcotics$" = "sale_synth_narc",
              "^number and lottery$"                     = "number_lottery",
              "^suspicion$"                              = "suspicion"
)

fix_cols_names <- c("JUVENILE"                                  = "JUV",
                    "ORIGINATING_AGENCY_IDENTIFIER_CODE"        = "ORI",
                    "NUMERIC_STATE_CODE_FBI_CODE"               = "STATE",
                    "GEOGRAPHIC_DIVISION_OF_STATE"              = "GEOGRAPHIC_DIVISION"
)

starting_cols <- c("ori",
                   "year",
                   "ori9",
                   "last_month_reported",
                   "agency_name",
                   "state",
                   "state_abb",
                   "fips_state_code",
                   "fips_county_code",
                   "fips_state_county_code",
                   "fips_place_code",
                   "fips_state_place_code",
                   "agency_type",
                   "agency_subtype_1",
                   "agency_subtype_2",
                   "group",
                   "geographic_division",
                   "suburban_agency",
                   "core_city",
                   "covered_by_another_agency",
                   "population")

order_arrest_cols <- function(data) {
  murder_cols           <- grep("^murder", names(data), value = TRUE)
  rape_cols             <- grep("^rape", names(data), value = TRUE)
  robbery_cols          <- grep("^robbery", names(data), value = TRUE)
  agg_assault_cols      <- grep("^agg_assault", names(data), value = TRUE)
  burglary_cols         <- grep("^burglary", names(data), value = TRUE)
  theft_cols            <- grep("^theft", names(data), value = TRUE)
  mtr_veh_theft_cols    <- grep("^mtr_veh_theft", names(data), value = TRUE)
  oth_assault_cols      <- grep("^oth_assault", names(data), value = TRUE)
  forgery_cols          <- grep("^forgery", names(data), value = TRUE)
  fraud_cols            <- grep("^fraud", names(data), value = TRUE)
  embezzlement_cols     <- grep("^embezzlement", names(data), value = TRUE)
  vandalism_cols        <- grep("^vandalism", names(data), value = TRUE)
  weapons_cols          <- grep("^weapons", names(data), value = TRUE)
  total_drug_cols       <- grep("^total_drug", names(data), value = TRUE)
  sale_drug_cols        <- grep("^sale_drug", names(data), value = TRUE)
  sale_heroin_coke_cols  <- grep("^sale_heroin_coke", names(data), value = TRUE)
  possess_drug_cols     <- grep("^poss_drug", names(data), value = TRUE)
  possess_cannabis_cols <- grep("^poss_cannabis", names(data), value = TRUE)
  family_offenses_cols  <- grep("^family_offenses", names(data), value = TRUE)
  dui_cols              <- grep("^dui", names(data), value = TRUE)
  liquor_cols           <- grep("^liquor", names(data), value = TRUE)
  drunkenness_cols      <- grep("^drunkenness", names(data), value = TRUE)
  disorder_conduct_cols <- grep("^disorder_cond", names(data), value = TRUE)
  oth_non_traffic_cols  <- grep("^oth_non_traffic", names(data), value = TRUE)
  curfew_cols           <- grep("^curfew", names(data), value = TRUE)
  stolen_property_cols  <- grep("^stolen_property", names(data), value = TRUE)
  prostitution_cols     <- grep("^prostitution", names(data), value = TRUE)
  sale_cannabis_cols    <- grep("^sale_cannabis", names(data), value = TRUE)
  possess_coke_cols     <- grep("^poss_heroin_coke", names(data), value = TRUE)
  oth_sex_off_cols      <- grep("^oth_sex", names(data), value = TRUE)
  possess_oth_drug_cols <- grep("^poss_oth_drug", names(data), value = TRUE)
  arson_cols            <- grep("^arson", names(data), value = TRUE)
  sale_oth_drug_cols    <- grep("^sale_oth_drug", names(data), value = TRUE)
  vagrancy_cols         <- grep("^vagrancy", names(data), value = TRUE)
  possess_narcotic_cols <- grep("^poss_synth_narc", names(data), value = TRUE)
  runaway_cols          <- grep("^runaway", names(data), value = TRUE)
  manslaughter_neg_cols <- grep("^manslaught", names(data), value = TRUE)
  total_gambling_cols   <- grep("^total_gambling", names(data), value = TRUE)
  bookmaking_cols       <- grep("^bookmaking", names(data), value = TRUE)
  oth_gambling_cols     <- grep("^oth_gambling", names(data), value = TRUE)
  sale_synth_narc_cols  <- grep("^sale_synth_narc", names(data), value = TRUE)
  number_lottery_cols   <- grep("^number_lottery", names(data), value = TRUE)
  suspicion_cols        <- grep("^suspicion", names(data), value = TRUE)

  crime_cols <- grep("_cols$", ls(), value = TRUE)
  crime_cols <- crime_cols[!crime_cols %in% c("arrest_cols",
                                              "starting_cols",
                                              "other_cols",
                                              "order_arrest_cols",
                                              "fix_internal_cols",
                                              "temp_internal_cols")]
  for (col in crime_cols) {
    if (length(get(col)) > 0) {
      temp <- fix_internal_col_order(get(col))
      assign(col, temp)
    }
  }


  data <-
    data %>%
    dplyr::arrange(desc(year), ori) %>%
    dplyr::select(starting_cols,
                  murder_cols,
                  rape_cols,
                  robbery_cols,
                  agg_assault_cols,
                  burglary_cols,
                  theft_cols,
                  mtr_veh_theft_cols,
                  arson_cols,
                  oth_assault_cols,
                  weapons_cols,
                  prostitution_cols,
                  oth_sex_off_cols,
                  manslaughter_neg_cols,
                  forgery_cols,
                  fraud_cols,
                  embezzlement_cols,
                  total_gambling_cols,
                  oth_gambling_cols,
                  bookmaking_cols,
                  number_lottery_cols,
                  dui_cols,
                  total_drug_cols,
                  possess_drug_cols,
                  sale_drug_cols,
                  possess_cannabis_cols,
                  sale_cannabis_cols,
                  possess_coke_cols,
                  sale_heroin_coke_cols,
                  possess_narcotic_cols,
                  sale_synth_narc_cols,
                  possess_oth_drug_cols,
                  sale_oth_drug_cols,
                  liquor_cols,
                  drunkenness_cols,
                  family_offenses_cols,
                  disorder_conduct_cols,
                  vandalism_cols,
                  stolen_property_cols,
                  suspicion_cols,
                  vagrancy_cols,
                  curfew_cols,
                  runaway_cols,
                  oth_non_traffic_cols)


  return(data)
}

fix_internal_col_order <- function(col) {
  col_name           <- gsub("_tot_adult", "", grep("_tot_adult", col,
                                                    value = TRUE))
  temp_internal_cols <- paste0(col_name, "_", within_col_order)
  temp_internal_cols <- match(temp_internal_cols, col)
  col                <- col[temp_internal_cols]
  col                <- col[!is.na(col)]
  return(col)
}


within_col_order <- c("tot_arrests",
                      "tot_adult",
                      "tot_juv",
                      "tot_male",
                      "tot_female",
                      "tot_male_adult",
                      "tot_male_juv",
                      "tot_female_adult",
                      "tot_female_juv",
                      "male_under_10",
                      "male_10_12",
                      "male_13_14",
                      "male_15",
                      "male_16",
                      "male_17",
                      "male_18",
                      "male_19",
                      "male_20",
                      "male_21",
                      "male_22",
                      "male_23",
                      "male_24",
                      "male_25_29",
                      "male_30_34",
                      "male_35_39",
                      "male_40_44",
                      "male_45_49",
                      "male_50_54",
                      "male_55_59",
                      "male_60_64",
                      "male_over_64",
                      "female_under_10",
                      "female_10_12",
                      "female_13_14",
                      "female_15",
                      "female_16",
                      "female_17",
                      "female_18",
                      "female_19",
                      "female_20",
                      "female_21",
                      "female_22",
                      "female_23",
                      "female_24",
                      "female_25_29",
                      "female_30_34",
                      "female_35_39",
                      "female_40_44",
                      "female_45_49",
                      "female_50_54",
                      "female_55_59",
                      "female_60_64",
                      "female_over_64",
                      "adult_white",
                      "adult_black",
                      "adult_asian",
                      "adult_indian",
                      "juv_white",
                      "juv_black",
                      "juv_asian",
                      "juv_indian")

simple_arrest_categories <- c("tot_male_juv",
                              "tot_male_adult",
                              "tot_female_juv",
                              "tot_female_adult",
                              "tot_male",
                              "tot_female",
                              "tot_juv",
                              "tot_adult",
                              "tot_arrests")

all_arrest_categories <- c("tot_male_juv",
                           "tot_male_adult",
                           "tot_female_juv",
                           "tot_female_adult",
                           "tot_male",
                           "tot_female",
                           "tot_juv",
                           "tot_adult",
                           "tot_arrests",
                           "MALE_UNDER_10",
                           "MALE_10_12",         "MALE_13_14",
                           "MALE_15",            "MALE_16",
                           "MALE_17",            "MALE_18",
                           "MALE_19",            "MALE_20",
                           "MALE_21",            "MALE_22",
                           "MALE_23",            "MALE_24",
                           "MALE_25_29",         "MALE_30_34",
                           "MALE_35_39",         "MALE_40_44",
                           "MALE_45_49",         "MALE_50_54",
                           "MALE_55_59",         "MALE_60_64",
                           "MALE_OVER_64",       "FEMALE_UNDER_10",
                           "FEMALE_10_12",       "FEMALE_13_14",
                           "FEMALE_15",          "FEMALE_16",
                           "FEMALE_17",          "FEMALE_18",
                           "FEMALE_19",          "FEMALE_20",
                           "FEMALE_21",          "FEMALE_22",
                           "FEMALE_23",          "FEMALE_24",
                           "FEMALE_25_29",       "FEMALE_30_34",
                           "FEMALE_35_39",       "FEMALE_40_44",
                           "FEMALE_45_49",       "FEMALE_50_54",
                           "FEMALE_55_59",       "FEMALE_60_64",
                           "FEMALE_OVER_64",     "ADULT_WHITE",
                           "ADULT_BLACK",        "ADULT_INDIAN",
                           "ADULT_ASIAN",        "JUVENILE_WHITE",
                           "JUVENILE_BLACK",     "JUVENILE_INDIAN",
                           "JUVENILE_ASIAN")