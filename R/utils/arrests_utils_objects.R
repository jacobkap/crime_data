matches_types <- data.frame(matches =
                              c("^(fe)?male|tot_arrest",  # Age by sex
                                "tot_.*[0-9]|tot_arrest", # Totals - age
                                "tot_(fe)?male|tot_juv|tot_adult|tot_arrest", # Totals - sex
                                "black|white|asian|ind|tot_arrest" # Totals - race
                              ),
                            name = c("age_by_sex",
                                     "totals_age",
                                     "totals_sex",
                                     "totals_race"),
                            stringsAsFactors = FALSE)

index_crimes <- c("murder",
                  "rape",
                  "robbery",
                  "agg_assault",
                  "burglary",
                  "theft",
                  "mtr_veh_theft",
                  "arson")


drug_crimes <- c("total_drug",
                 "sale_drug_total",
                 "sale_cannabis",
                 "sale_heroin_coke",
                 "sale_other_drug",
                 "sale_synth_narc",
                 "poss_drug_total",
                 "poss_cannabis",
                 "poss_heroin_coke",
                 "poss_other_drug",
                 "poss_synth_narc")

alcohol_or_property_crimes <- c("forgery",
                                "fraud",
                                "stolen_prop",
                                "dui",
                                "liquor",
                                "drunkenness")

financial_crimes <- c("embezzlement",
                      "gamble_total",
                      "gamble_other",
                      "gamble_bookmake",
                      "gamble_lottery")


sex_or_family_crimes <- c("prostitution",
                          "oth_sex_off",
                          "rape",
                          "family_off")

violent_crimes <- c("murder",
                    "robbery",
                    "agg_assault",
                    "oth_assault",
                    "weapons",
                    "manslaught_neg")

other_crimes <- c("vandalism",
                  "disorder_cond",
                  "all_other",
                  "curfew_loiter",
                  "vagrancy",
                  "runaways",
                  "suspicion")

all_crimes <- unique(c(index_crimes,
                       financial_crimes,
                       alcohol_or_property_crimes,
                       violent_crimes,
                       sex_or_family_crimes,
                       drug_crimes,
                       other_crimes))

combined_crimes <- list(index_crimes,
                        financial_crimes,
                        alcohol_or_property_crimes,
                        violent_crimes,
                        sex_or_family_crimes,
                        drug_crimes,
                        other_crimes,
                        all_crimes)
names(combined_crimes) <- c("index_crimes",
                            "financial_crimes",
                            "alcohol_or_property_crimes",
                            "violent_crimes",
                            "sex_or_family_crimes",
                            "drug_crimes",
                            "other_crimes",
                            "all_crimes")

arrest_cols <- c("adult_amer_ind",
                 "adult_asian",
                 "adult_black",
                 "adult_white",
                 "juv_amer_ind",
                 "juv_asian",
                 "juv_black",
                 "juv_white",
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
                 "male_over_64")

arrest_cols_1974 <- c(arrest_cols,
                      "male_under_11",
                      "female_under_11",
                      "male_11_12",
                      "female_11_12",
                      "adult_chinese",
                      "adult_japanese",
                      "juv_chinese",
                      "juv_japanese",
                      "female_adult_unknown_age",
                      "female_juvenile_unknown_age",
                      "male_adult_unknown_age",
                      "male_juvenile_unknown_age")