source('R/make_sps/make_sps_utils.R')


incident_values = c("data_source = ",
                    "D = data entry form",
                    "F = floppy diskette",
                    "N = nibrs incident",
                    "S = summary tape",
                    "quarter_of_the_year",
                    "1 = january through march",
                    "2 = april through june",
                    "3 = july through september",
                    "4 = october through december",
                    "offenders_race_as_a_group = ",
                    "W = white",
                    "B = black",
                    "I = american indian or native alaskan",
                    "A = asian or pacific islander",
                    "M = multi-racial group",
                    "U = unknown",
                    "P = native hawaiian/other pacific islander")

offense_code_values = c("ucr_offense_code_replace = ",
                        "200 = arson",
                        # Assault
                        "13A = assault offenses - aggravated assault",
                        "13B = assault offenses - simple assault",
                        "13C = assault offenses - intimidation",
                        # Property
                        "510 = bribery",
                        "220 = burglary/breaking and entering",
                        "250 = counterfeiting/forgery",
                        "290 = destruction/damage/vandalism of property",
                        # Drugs
                        "35A = drug/narcotic offenses - drug/narcotic violations",
                        "35B = drug/narcotic offenses - drug equipment violations",
                        #
                        "270 = embezzlement",
                        "210 = extortion/blackmail",
                        # Fraud
                        "26A = fraud offenses - false pretenses/swindle/confidence game",
                        "26B = fraud offenses - credit card/atm fraud",
                        "26C = fraud offenses - impersonation",
                        "26D = fraud offenses - welfare fraud",
                        "26E = fraud offenses - wire fraud",
                        "26F = fraud offenses - other",
                        "26G = fraud offenses - other",
                        # Gambling
                        "39A = gambling offenses - betting/wagering",
                        "39B = gambling offenses - operating/promoting/assisting gambling",
                        "39C = gambling offenses - gambling equipment violations",
                        "39D = gambling offenses - gambling - sports tampering",
                        # Murder
                        "09A = murder/nonnegligent manslaughter",
                        "09B = negligent manslaughter",
                        "09C = justifiable homicide - not a crime",
                        "100 = kidnapping/abduction",
                        # Theft
                        "23* = larceny/theft offenses - other",
                        "23A = larceny/theft offenses - pocket-picking",
                        "23B = larceny/theft offenses - purse-snatching",
                        "23C = larceny/theft offenses - shoplifting",
                        "23D = larceny/theft offenses - theft from building",
                        "23E = larceny/theft offenses - theft rom coin-operated machine or device",
                        "23F = larceny/theft offenses - theft from motor vehicle",
                        "23G = larceny/theft offenses - theft of motor vehicle parts/accessories",
                        "23H = larceny/theft offenses - all other larceny",
                        "240 = motor vehicle theft",
                        # Sex Crimes
                        "370 = pornography/obscene material",
                        "40A = prostitution offenses - prostitution",
                        "40B = prostitution offenses - assisting or promoting prostitution",
                        "40C = prostitution offenses - purchasing prostitution",
                        "64A = human trafficking - commercial sex acts",
                        "64B = human trafficking - involuntary servitude",
                        #
                        "11A = sex offenses - rape",
                        "11B = sex offenses - sodomy",
                        "11C = sex offenses - sexual assault with an object",
                        "11D = sex offenses - fondling - indecent liberties/child molest",
                        "36A = sex offenses - incest",
                        "36B = sex offenses - statutory rape",
                        #
                        "120 = robbery",
                        "280 = stolen property offenses (receiving, selling, etc.)",
                        "520 = weapon law violations",
                        # Unknown
                        "720 = undocumented code",
                        "61A = undocumented code",
                        "101 = undocumented code",
                        #
                        # Location value labels
                        "location_code_offense_replace = ",
                        "01 = air/bus/train terminal",
                        "02 = bank/savings and loan",
                        "03 = bar/nightclub",
                        "04 = church/synagogue/temple/mosque",
                        "05 = commercial/office building",
                        "06 = construction site",
                        "07 = convenience store",
                        "08 = department/discount store",
                        "09 = drug store/doctors office/hospital",
                        "10 = field/woods",
                        "11 = government/public building",
                        "12 = grocery/supermarket",
                        "13 = highway/road/alley/street/sidewalk",
                        "14 = hotel/motel/etc.",
                        "15 = jail/prison/penitentiary/corrections facility",
                        "16 = lake/waterway/beach",
                        "17 = liquor store",
                        "18 = parking lot/drop lot/parking garage",
                        "19 = rental storage facility",
                        "20 = residence/home",
                        "21 = restaurant",
                        "22 = school/college",
                        "23 = service/gas station",
                        "24 = specialty store (tv, fur, etc.)",
                        "25 = other/unknown",
                        # From NACJD 2016 sps
                        "37 = abandoned/condemned structure",
                        "38 = amusement park",
                        "39 = arena/stadium/fairgrounds/coliseum",
                        "40 = atm separate from bank",
                        "41 = auto dealership new/used",
                        "42 = camp/campground",
                        "44 = daycare facility",
                        "45 = dock/wharf/freight/modal terminal",
                        "46 = farm facility",
                        "47 = gambling facility/casino/race track",
                        "48 = industrial site",
                        "49 = military installation",
                        "50 = park/playground",
                        "51 = rest area",
                        "52 = school - college/university",
                        "53 = school - elementary/secondary",
                        "54 = shelter - mission/homeless",
                        "55 = shopping mall",
                        "56 = tribal lands",
                        "57 = community center",
                        "58 = undocumented code",
                        #
                        # Bias motivation
                        "bias_motivation_offense_replace = ",
                        # Race
                        "11 = anti-white",
                        "12 = anti-black",
                        "13 = anti-american indian or native alaskan",
                        "14 = anti-asian",
                        "15 = anti-multiple races, group",
                        "16 = anti-native hawaiian or other pacific islander",
                        # Religion
                        "21 = anti-jewish",
                        "22 = anti-catholic",
                        "23 = anti-protestant",
                        "24 = anti-islamic (muslim)",
                        "25 = anti-other religion",
                        "26 = anti-multiple religions, group",
                        "27 = anti-atheism/agnosticism",
                        "28 = anti-church of jesus christ (mormon)",
                        "29 = anti-jehovahs witness",
                        # Ethnicity
                        "31 = anti-arab",
                        "32 = anti-hispanic or latino",
                        "33 = anti-other race, ethnicity, ancestry, or national origin",
                        # Sexual orientation
                        "41 = anti-gay (male)",
                        "42 = anti-lesbian (female)",
                        "43 = anti-lesbian, gay, bisexual, or transgender (mixed group)",
                        "44 = anti-heterosexual",
                        "45 = anti-bisexual",
                        # From NACJD's sps file 2016
                        "51 = anti-physical disability",
                        "52 = anti-mental disability",
                        "61 = anti-male",
                        "62 = anti-female",
                        "71 = anti-transgender",
                        "72 = anti-gender non-conforming",
                        "80 = undocumented code",
                        "81 = anti-eastern orthodox (greek, russian, other)",
                        "82 = anti-other christian",
                        "83 = anti-buddhist",
                        "84 = anti-hindu",
                        "85 = anti-sikh",
                        "99 = undocumented code",
                        # Type of victim
                        "type_of_victims_offense_replace = ",
                        "I = individual",
                        "B = business",
                        "F = financial institution",
                        "G = government",
                        "R = religious organization",
                        "S = society/public",
                        "O = other",
                        "U = unknown")

offense_code_values <- repeated_label_replace_fixer(offense_code_values, 1:10)


incident_values_labels <- c(state_group_division_value_labels[1:57],
                            incident_values,
                            offense_code_values)

col_positions <- c("1-2",
                   "3-4",
                   "5-13",
                   "14-25",
                   "26-33",
                   "34",
                   "35",
                   "36-38",
                   "39-40",
                   "41")
offense_and_bias_col_positions <- c("42-44",
                                    "45-47",
                                    "48-49",
                                    "50-51",
                                    "52-59")
victims_2_10_nums <- setup_num_adder(offense_and_bias_col_positions,
                                     adder = 18,
                                     iterations = 9,
                                     initial_adder_bump = 0)

col_positions <- c(col_positions,
                   offense_and_bias_col_positions,
                   victims_2_10_nums)

col_labels <- c("hate_crime_record_type",
                "state",
                "ori9",
                "incident_number",
                "incident_date",
                "data_source",
                "quarter_of_the_year",
                "total_num_of_individual_victims",
                "total_offenders",
                "offenders_race_as_a_group")

offense_and_bias_col_labels <- c("ucr_offense_code_replace",
                                 "number_of_victims_offense_replace",
                                 "location_code_offense_replace",
                                 "bias_motivation_offense_replace",
                                 "type_of_victims_offense_replace")

offense_and_bias_col_labels <- repeated_label_replace_fixer(offense_and_bias_col_labels,
                                                            1:10)


col_labels <- c(col_labels,
                offense_and_bias_col_labels)


make_sps_setup(file_name     = "setup_files/ucr_hate_crimes_incident_report.sps",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = incident_values_labels)
