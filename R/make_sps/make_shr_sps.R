source('R/make_sps/make_sps_utils.R')

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
                         "NB = 1 to 6 days old (newborn)",
                         "NN = under 24 hours (neonate)",
                         "BB = between 6 days and 1 year old (baby)",
                         "00 = unknown",
                         "99 = over 98 years old",
                         "victim_replace_sex = ",
                         "M = male",
                         "F = female",
                         "U = unknown",
                         "X = unknown",
                         "victim_replace_race = ",
                         "W = white",
                         "B = black",
                         "I = american indian/alaskan native",
                         "A = asian",
                         "U = unknown",
                         "P = native hawaiian or other pacific islander",
                         "p = native hawaiian or other pacific islander",
                         "victim_replace_ethnic_origin = ",
                         "H = hispanic or latino",
                         "N = not hispanic or latino",
                         "U = unknown")

victim_value_labels <- repeated_label_replace_fixer(victim_value_labels, 1:11)


offender_value_labels <- c("offender_replace_age = ",
                           "00 = unknown",
                           "99 = over 98 years old",
                           "NN = under 24 hours (neonate)",
                           "NB = 1 to 6 days old (newborn)",
                           "BB = between 6 days and 1 year old (baby)",
                           "NS = unknown",
                           "offender_replace_sex = ",
                           "M = male",
                           "F = female",
                           "U = unknown",
                           "X = unknown",
                           "offender_replace_race = ",
                           "W = white",
                           "B = black",
                           "I = american indian/alaskan native",
                           "A = asian",
                           "U = unknown",
                           "P = native hawaiian or other pacific islander",
                           "offender_replace_ethnic_origin = ",
                           "H = hispanic or latino",
                           "N = not hispanic or latino",
                           "U = unknown",

                           # Weapons
                           "offender_replace_weapon = ",
                           "11 = firearm (type not stated)",
                           "12 = handgun",
                           "13 = rifle",
                           "14 = shotgun",
                           "15 = other firearm",
                           "20 = lethal cutting instrument (knife, ice pick, screwdriver, ax, etc.)",
                           "30 = blunt object (e.g., club/blackjack/brass knuckles)",
                           "40 = personal weapons (hands, feet, teeth, etc.)",
                           "50 = poison - does not include gas",
                           "55 = pushed or thrown out of window",
                           "60 = explosives",
                           "65 = fire",
                           "70 = drugs/narcotics/sleeping pills",
                           "75 = drowning",
                           "80 = strangulation - includes hanging",
                           "85 = asphyxiation - includes death by gas",
                           "90 = other or unknown weapon",
                           "35 = undocumented code",

                           # Relationship
                           "victim_1_relation_to_offender_replace = ",
                           # Within family
                           "HU = victim was husband",
                           "WI = victim was wife",
                           "CH = victim was common-law husband",
                           "CW = victim was common-law wife",
                           "MO = victim was mother",
                           "FA = victim was father",
                           "SO = victim was son",
                           "DA = victim was daughter",
                           "BR = victim was brother",
                           "SI = victim was sister",
                           "IL = victim was in-law",
                           "SF = victim was stepfather",
                           "SM = victim was stepmother",
                           "SS = victim was stepson",
                           "SD = victim was stepdaughter",
                           "OF = victim was other family",
                           # Outside family but known to victim
                           "NE = victim was neighbor",
                           "AQ = victim was acquaintance",
                           "BF = victim was boyfriend",
                           "GF = victim was girlfriend",
                           "XH = victim was ex-husband",
                           "XW = victim was ex-wife",
                           "EE = victim was employee",
                           "ER = victim was employer",
                           "FR = victim was friend",
                           "HO = victim was in a homosexual relationship with the offender",
                           "OK = victim was otherwise known",
                           # Offender not known to victim
                           "ST = victim was stranger",
                           # Unknown relationships
                           "UN = relationship unknown",

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
                           "30 = human trafficking/commercial sex acts",
                           "31 = human trafficking/involuntary servitude",
                           # Other than felony type
                           "40 = domestic violence (historically called lovers triangle/quarrel)",
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


asciiSetupReader::make_sps_setup(file_name     = "setup_files/ucr_shr",
                                 col_positions = col_positions,
                                 col_labels    = col_labels,
                                 value_labels  = value_labels)
