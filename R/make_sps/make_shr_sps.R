source('C:/Users/user/Dropbox/R_project/crime_data/R/make_sps/make_sps_utils.R')

starting_nums <- c("1",
                   "2-3",
                   "4-10",
                   "11-12",
                   "13",
                   "14-15",
                   "16-24",
                   "25-27",
                   "28-30",
                   "31",
                   "32-55",
                   "56-61",
                   "62-63",
                   "64-69",
                   "70",
                   "71",
                   "72-74",
                   "75")
starting_names <- c("identifier_code",
                    "state",
                    "ori",
                    "population_group",
                    "country_division",
                    "year",
                    "population",
                    "county",
                    "msa",
                    "suburban_indicator",
                    "agency_name",
                    "state_name",
                    "offense_month",
                    "last_update",
                    "action_type",
                    "homicide_type",
                    "incident_number",
                    "situation")

victim_nums <- c("76-77",
                 "78",
                 "79",
                 "80")
victim_names <- c("victim_num_age",
                  "victim_num_sex",
                  "victim_num_race",
                  "victim_num_ethnic_origin")
victim_1_names  <- gsub("num", "1", victim_names)
victim_2_names  <- gsub("num", "2", victim_names)
victim_3_names  <- gsub("num", "3", victim_names)
victim_4_names  <- gsub("num", "4", victim_names)
victim_5_names  <- gsub("num", "5", victim_names)
victim_6_names  <- gsub("num", "6", victim_names)
victim_7_names  <- gsub("num", "7", victim_names)
victim_8_names  <- gsub("num", "8", victim_names)
victim_9_names  <- gsub("num", "9", victim_names)
victim_10_names <- gsub("num", "10", victim_names)
victim_11_names <- gsub("num", "11", victim_names)

victims_2_11_names <- c(victim_2_names,
                        victim_3_names,
                        victim_4_names,
                        victim_5_names,
                        victim_6_names,
                        victim_7_names,
                        victim_8_names,
                        victim_9_names,
                        victim_10_names,
                        victim_11_names)

offender_nums <- c("81-82",
                   "83",
                   "84",
                   "85",
                   "86-87",
                   "88-89",
                   "90-91",
                   "92")
offender_names <- c("offender_num_age",
                    "offender_num_sex",
                    "offender_num_race",
                    "offender_num_ethnic_origin",
                    "offender_num_weapon",
                    "offender_num_relation_to_vic_1",
                    "offender_num_circumstance",
                    "offender_num_subcircumstance")
offender_1_names  <- gsub("num", "1", offender_names)
offender_2_names  <- gsub("num", "2", offender_names)
offender_3_names  <- gsub("num", "3", offender_names)
offender_4_names  <- gsub("num", "4", offender_names)
offender_5_names  <- gsub("num", "5", offender_names)
offender_6_names  <- gsub("num", "6", offender_names)
offender_7_names  <- gsub("num", "7", offender_names)
offender_8_names  <- gsub("num", "8", offender_names)
offender_9_names  <- gsub("num", "9", offender_names)
offender_10_names <- gsub("num", "10", offender_names)
offender_11_names <- gsub("num", "11", offender_names)

offenders_2_11_names <- c(offender_2_names,
                          offender_3_names,
                          offender_4_names,
                          offender_5_names,
                          offender_6_names,
                          offender_7_names,
                          offender_8_names,
                          offender_9_names,
                          offender_10_names,
                          offender_11_names)

count_nums <- c("93-95",
                "96-98")

count_names <- c("additional_victim_count",
                 "additional_offender_count")

victims_2_11_nums <- setup_num_adder(victim_nums,
                                     adder = 5,
                                     iterations = 10,
                                     initial_adder_bump = 18)

offenders_2_11_nums <- setup_num_adder(offender_nums,
                                       adder = 12,
                                       iterations = 10,
                                       initial_adder_bump = 56)

value_labels <- c("suburban_indicator = ",
                  "0 = non-suburban",
                  "1 = suburban",
                  "action_type = ",
                  "0 = normal update",
                  "1 = adjustment",
                  "homicide_type = ",
                  "A = murder and nonnegligent manslaughter",
                  "B = manslaughter by negligence",
                  "situation = ",
                  "A = single victim/single offender",
                  "B = single victim/unknown offender(s)",
                  "C = single victim/multiple offenders",
                  "D = multiple victims/single offender",
                  "E = multiple victims/multiple offenders",
                  "F = multiple victims/unknown offender(s)")

victim_value_labels <- c("victim_num_age = ",
                         "NB = birth-6 days, including abandoned infant",
                         "BB = 7 days to 364 days",
                         "00 = unknown",
                         "99 = 99 years or older",
                         "victim_num_sex = ",
                         "M = male",
                         "F = female",
                         "U = unknown",
                         "victim_num_race = ",
                         "W = white",
                         "B = black",
                         "I = american indian or alaskan native",
                         "A = asian",
                         "U = unknown",
                         "victim_num_ethnic_origin = ",
                         "H = hispanic",
                         "N = not hispanic",
                         "U = unknown")
victim_1_value_labels  <- gsub("num", "1", victim_value_labels)
victim_2_value_labels  <- gsub("num", "2", victim_value_labels)
victim_3_value_labels  <- gsub("num", "3", victim_value_labels)
victim_4_value_labels  <- gsub("num", "4", victim_value_labels)
victim_5_value_labels  <- gsub("num", "5", victim_value_labels)
victim_6_value_labels  <- gsub("num", "6", victim_value_labels)
victim_7_value_labels  <- gsub("num", "7", victim_value_labels)
victim_8_value_labels  <- gsub("num", "8", victim_value_labels)
victim_9_value_labels  <- gsub("num", "9", victim_value_labels)
victim_10_value_labels <- gsub("num", "10", victim_value_labels)
victim_11_value_labels <- gsub("num", "11", victim_value_labels)

offender_value_labels <- c("offender_num_age = ",
                           "00 = unknown",
                           "99 = 99 years or older",
                           "offender_num_sex = ",
                           "M = male",
                           "F = female",
                           "U = unknown",
                           "offender_num_race = ",
                           "W = white",
                           "B = black",
                           "I = american indian or alaskan native",
                           "A = asian",
                           "U = unknown",
                           "offender_num_ethnic_origin = ",
                           "H = hispanic",
                           "N = not hispanic",
                           "U = unknown",

                           # Weapons
                           "offender_1_weapon = ",
                           "11 = firearm, type not states",
                           "12 = handgun",
                           "13 = rifle",
                           "14 = shotgun",
                           "15 = other gun",
                           "20 = knife/cutting instrument",
                           "30 = blunt object",
                           "40 = personal weapons - includes beating",
                           "50 = poison - does not include gas",
                           "55 = pushed or thrown out of window",
                           "60 = explosives",
                           "65 = fire",
                           "70 = narcotics/drugs - includes sleeping pills",
                           "75 = drowning",
                           "80 = strangulation - includes hanging",
                           "85 = asphyxiation - includes death by gas",
                           "90 = other or unknown weapon",

                           # Relationship
                           "offender_num_relation_to_vic_1 = ",
                           # Within family
                           "HU = husband",
                           "WI = wife",
                           "CH = common-law husband",
                           "CW = common-law wife",
                           "MO = mother",
                           "FA = father",
                           "SO = son",
                           "DA = daughter",
                           "BR = brother",
                           "SI = sister",
                           "IL = in-law",
                           "SF = stepfather",
                           "SM = stepmother",
                           "SS = stepson",
                           "SD = stepdaughter",
                           "OF = other family",
                           # Outside family but known to victim
                           "NE = neighbor",
                           "AQ = acquaintance",
                           "BF = boyfriend",
                           "GF = girlfriend",
                           "XH = ex-husband",
                           "XW = ex-wife",
                           "EE = employee",
                           "ER = employer",
                           "FR = friend",
                           "HO = homosexual relationship",
                           "OK = other - known to victim",
                           # Offender not known to victim
                           "ST = stranger",
                           # Unknown relationships
                           "UN = unknown",

                           # Circumstanes
                           # Felony type
                           "offender_num_circumstances = ",
                           "02 = rape",
                           "03 = robbery",
                           "05 = burglary",
                           "06 = larceny",
                           "07 = motor vehicle theft",
                           "09 = arson",
                           "10 = prostitution and commercialized vice",
                           "17 = other sex offenses",
                           "32 = abortion",
                           "18 = narcotic drug laws",
                           "19 = gambling",
                           "26 = other felony type - not specified",
                           # Other than felony type
                           "40 = lovers triangle",
                           "41 = child killed by babysitter",
                           "42 = brawl due to influence of alcohol",
                           "43 = brawl due to influence of narcotics",
                           "44 = argument over money or property",
                           "45 = other arguments",
                           "46 = gangland killings",
                           "47 = juvenile gang killings",
                           "48 = instutitional killings",
                           "49 = sniper attack",
                           "60 = other non-felony type - not specified",
                           # Suspected felony type
                           "70 = all suspected felony type",
                           # Justifiable homicide
                           "80 = felony killed by private citizen",
                           "81 = felon killed by police",
                           # Unable to determine circumstances
                           "99 = unknown",
                           # Manslaughter by negligent circumstances
                           "50 = victim shot in hunting accident",
                           "51 = gun cleaning death - other than self-inflicted",
                           "52 = children playing with gun",
                           "53 = other negligent handling of gun which resulted in death of another",
                           "59 = all other manslaughter by negligence except traffic deaths",

                           # Subcircumstance
                           "offender_num_subcircumstance = ",
                           "A = felon attacked police officer",
                           "B = felon attacked fellow police officer",
                           "C = felon attacked a civilian",
                           "D = felon attempted flight from a crime",
                           "E = felon killed in commission of a crime",
                           "F = felon resisted arrest",
                           "G = not enough information to determine")
offender_1_value_labels  <- gsub("num", "1", offender_value_labels)
offender_2_value_labels  <- gsub("num", "2", offender_value_labels)
offender_3_value_labels  <- gsub("num", "3", offender_value_labels)
offender_4_value_labels  <- gsub("num", "4", offender_value_labels)
offender_5_value_labels  <- gsub("num", "5", offender_value_labels)
offender_6_value_labels  <- gsub("num", "6", offender_value_labels)
offender_7_value_labels  <- gsub("num", "7", offender_value_labels)
offender_8_value_labels  <- gsub("num", "8", offender_value_labels)
offender_9_value_labels  <- gsub("num", "9", offender_value_labels)
offender_10_value_labels <- gsub("num", "10", offender_value_labels)
offender_11_value_labels <- gsub("num", "11", offender_value_labels)


col_positions <- c(starting_nums,
                   victim_nums,
                   offender_nums,
                   count_nums,
                   victims_2_11_nums,
                   offenders_2_11_nums)

col_labels <- c(starting_names,
                victim_1_names,
                offender_1_names,
                count_names,
                victims_2_11_names,
                offenders_2_11_names)

value_labels <- c(state_group_division_value_labels,
                  value_labels,
                  victim_1_value_labels,
                  victim_2_value_labels,
                  victim_3_value_labels,
                  victim_4_value_labels,
                  victim_5_value_labels,
                  victim_6_value_labels,
                  victim_7_value_labels,
                  victim_8_value_labels,
                  victim_9_value_labels,
                  victim_10_value_labels,
                  victim_11_value_labels,
                  offender_1_value_labels,
                  offender_2_value_labels,
                  offender_3_value_labels,
                  offender_4_value_labels,
                  offender_5_value_labels,
                  offender_6_value_labels,
                  offender_7_value_labels,
                  offender_8_value_labels,
                  offender_9_value_labels,
                  offender_10_value_labels,
                  offender_11_value_labels)

setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/shr_from_fbi")
asciiSetupReader::make_sps_setup(file_name     = "ucr_shr",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = state_group_division_value_labels)
setwd("C:/Users/user/Dropbox/R_project/crime_data/setup_files")
asciiSetupReader::make_sps_setup(file_name     = "ucr_shr",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = state_group_division_value_labels)