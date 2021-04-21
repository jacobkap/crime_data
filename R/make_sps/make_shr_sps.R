source(here::here('R/make_sps/make_sps_utils.R'))

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
                    "month_of_offense",
                    "last_update",
                    "type_of_action",
                    "homicide_type",
                    "incident_number",
                    "situation")

victim_nums <- c("76-77",
                 "78",
                 "79",
                 "80")
victim_names <- c("victim_replace_age",
                  "victim_replace_sex",
                  "victim_replace_race",
                  "victim_replace_ethnic_origin")
victim_1_names  <- gsub("replace", "1", victim_names)

victims_2_11_names <- repeated_label_replace_fixer(victim_names, 2:11)


offender_nums <- c("81-82",
                   "83",
                   "84",
                   "85",
                   "86-87",
                   "88-89",
                   "90-91",
                   "92")
offender_names <- c("offender_replace_age",
                    "offender_replace_sex",
                    "offender_replace_race",
                    "offender_replace_ethnic_origin",
                    "offender_replace_weapon",
                    "victim_1_relation_to_offender_replace",
                    #"offender_replace_relation_to_vic_1",
                    "offender_replace_circumstance",
                    "offender_replace_subcircumstance")
offender_1_names  <- gsub("replace", "1", offender_names)

offenders_2_11_names <- repeated_label_replace_fixer(offender_names, 2:11)

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
                  "type_of_action = ",
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

victim_value_labels <- c("victim_replace_age = ",
                         "NB = birth to 6 days, including abandoned infant",
                         "NN = birth to 6 days, including abandoned infant",
                         "BB = 7 days to 364 days",
                         "00 = unknown",
                         "99 = 99 years or older",
                         "victim_replace_sex = ",
                         "M = male",
                         "F = female",
                         "U = unknown",
                         "victim_replace_race = ",
                         "W = white",
                         "B = black",
                         "I = american indian or alaskan native",
                         "A = asian",
                         "U = unknown",
                         "P = native hawaiian or other pacific islander",
                         "victim_replace_ethnic_origin = ",
                         "H = hispanic",
                         "N = not hispanic",
                         "U = unknown")

victim_value_labels <- repeated_label_replace_fixer(victim_value_labels, 1:11)


offender_value_labels <- c("offender_replace_age = ",
                           "00 = unknown",
                           "99 = 99 years or older",
                           "offender_replace_sex = ",
                           "M = male",
                           "F = female",
                           "U = unknown",
                           "offender_replace_race = ",
                           "W = white",
                           "B = black",
                           "I = american indian or alaskan native",
                           "A = asian",
                           "U = unknown",
                           "P = native hawaiian or other pacific islander",
                           "offender_replace_ethnic_origin = ",
                           "H = hispanic",
                           "N = not hispanic",
                           "U = unknown",

                           # Weapons
                           "offender_replace_weapon = ",
                           "11 = firearm, type not stated",
                           "12 = handgun",
                           "13 = rifle",
                           "14 = shotgun",
                           "15 = other gun",
                           "20 = knife or cutting instrument",
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
                           "victim_1_relation_to_offender_replace = ",
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
                           "offender_replace_circumstance = ",
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
                           "48 = institutional killings",
                           "49 = sniper attack",
                           "60 = other non-felony type - not specified",
                           # Suspected felony type
                           "70 = all suspected felony type",
                           # Justifiable homicide
                           "80 = felon killed by private citizen",
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
                           "offender_replace_subcircumstance = ",
                           "A = felon attacked police officer",
                           "B = felon attacked fellow police officer",
                           "C = felon attacked a civilian",
                           "D = felon attempted flight from a crime",
                           "E = felon killed in commission of a crime",
                           "F = felon resisted arrest",
                           "G = not enough information to determine")

offender_value_labels <- repeated_label_replace_fixer(offender_value_labels, 1:11)



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
                  victim_value_labels,
                  offender_value_labels)

setwd(here::here("setup_files"))
asciiSetupReader::make_sps_setup(file_name     = "ucr_shr",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = value_labels)