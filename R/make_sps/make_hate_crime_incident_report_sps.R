source(here::here('R/make_sps/make_sps_utils.R'))


incident_values = c("data_source = ",
                    "D = Data entry form",
                    "F = Floppy diskette",
                    "N = NIBRS incident",
                    "S = summary tape",
                    "quarter_of_the_year",
                    "1 = January through March",
                    "2 = April Through June",
                    "3 = July Through September",
                    "4 = October Through December",
                    "offenders_race_as_a_group = ",
                    "W = White",
                    "B = Black",
                    "I = American Indian or Native Alaskan",
                    "A = Asian or Pacific Islander",
                    "M = Multi-racial Group",
                    "U = Unknown")

offense_code_values_1 = c("ucr_offense_code_1 = ",
                          "200 = Arson",
                          # Assault
                          "13A = Aggravated Assault",
                          "13B = Simple Assault",
                          "13C = Intimidation",
                          # Property
                          "510 = Bribery",
                          "220 = Burglary/Breaking and Entering",
                          "250 = Counterfeiting/Forgery",
                          "290 = Destruction of Property/Vandalism",
                          # Drugs
                          "35A = Drug/Narcotic Violations",
                          "35B = Drug Equipment Violations",
                          #
                          "270 = Embezzlement",
                          "210 = Extortion/Blackmail",
                          # Fraud
                          "26A = False Pretenses/Swindle/Confidence Game",
                          "26B = Credit Card/ATM Fraud",
                          "26C = Impersonation",
                          "26D = Welfare Fraud",
                          "26E = Wire Fraud",
                          # Gambling
                          "39A = Gambling - Betting/Wagering",
                          "39B = Operating/Promoting/Assisting Gambling",
                          "39C = Gambling Equipment Violations",
                          "39D = Gambling - Sports Tampering",
                          # Murder
                          "09A = Murder/Non-negligent Manslaughter",
                          "09B = Negligent Manslaughter",
                          "09C = Justifiable Homicide",
                          "100 = Kidnapping/Abduction",
                          # Theft
                          "23A = Pocket-picking",
                          "23B = Purse-snatching",
                          "23C = Shoplifting",
                          "23D = Theft From Building",
                          "23E = Theft From Coin-operated Machine or Device",
                          "23F = Theft From Motor Vehicle",
                          "23G = Theft of Motor Vehicle Parts/Accessories",
                          "23H = All Other Larceny",
                          "240 = Motor Vehicle Theft",
                          # Sex Crimes
                          "370 = Pornography/Obscene Material",
                          "40A = Prostitution",
                          "40B = Assisting or Promoting Prostitution",
                          "40C = Purchasing Prostitution",
                          "64A = Human Trafficking - Commercial Sex Acts",
                          "64B = Human Trafficking - Involuntary Servitude",
                          #
                          "11A = Forcible Rape",
                          "11B = Forcible Sodomy",
                          "11C = Sexual Assault With An Object",
                          "11D = Forcible Fondling - Indecent Liberties/Child Molest",
                          "36A = Incest",
                          "36B = Statutory Rape",
                          #
                          "120 = Robbery",
                          "280 = Stolen Property Offenses - Receiving, Selling, etc.",
                          "520 = Weapon Law Violations",
                          #
                          # Location value labels
                          "location_code_offense_1 = ",
                          "01 = Air/Bus/Train Terminal",
                          "02 = Bank/Savings and Loan",
                          "03 = Bar/Nightclub",
                          "04 = Church/Synagogue/Temple",
                          "05 = Commercial/Office Building",
                          "06 = Construction Site",
                          "07 = Convenience Store",
                          "08 = Department/Discount Store",
                          "09 = Drug Store/Doctors Office/Hospital",
                          "10 = Field/Woods",
                          "11 = Government/Public Building",
                          "12 = Grocery/Supermarket",
                          "13 = Highway/Road/Alley",
                          "14 = Hotel/Motel",
                          "15 = Jail/Prison",
                          "16 = Lake/Waterway",
                          "17 = Liquor Store",
                          "18 = Parking Lot/Garage",
                          "19 = Rental Storage Facility",
                          "20 = Residence/Home",
                          "21 = Restaurant",
                          "22 = School/College",
                          "23 = Service/Gas Station",
                          "24 = Specialty Store - TV, Fur, etc.",
                          "25 = Other/Unknown",
                          # From NACJD 2016 sps
                          "37 = Abandoned/Condemned structure",
                          "38 = Amusement park",
                          "39 = Arena/Stadium/Fairgrounds/Coliseum",
                          "40 = ATM separate from bank",
                          "41 = auto dealership new/used",
                          "42 = Camp/Campground",
                          "44 = Daycare facility",
                          "45 = Dock/wharf/freight/modal terminal",
                          "46 = Farm facility",
                          "47 = Gambling facility/casino/race track",
                          "48 = Industrial site",
                          "49 = Military installation",
                          "50 = Park/playground",
                          "51 = Rest area",
                          "52 = School - college/university",
                          "53 = School - elementary/secondary",
                          "54 = Shelter - mission/homeless",
                          "55 = Shopping mall",
                          "56 = Tribal lands",
                          "57 = Community center",
                          "58 = Undocumented code",
                          #
                          # Bias motivation
                          "bias_motivation_offense_1 = ",
                          # Race
                          "11 = Anti-White",
                          "12 = Anti-Black",
                          "13 = Anti-American Indian or Native Alaskan",
                          "14 = Anti-Asian",
                          "15 = Anti-Multi-Racial Group",
                          "16 = Anti-Native Hawaiian or Other Pacific Islander",
                          # Religion
                          "21 = Anti-Jewish",
                          "22 = Anti-Catholic",
                          "23 = Anti-Protestant",
                          "24 = Anti-Muslim",
                          "25 = Anti-Other Religion",
                          "26 = Anti-Multi-Religious Group",
                          "27 = Anti-Atheism/Agnosticism",
                          "28 = Anti-Mormon",
                          "29 = Anti-Jehovahs Witness",
                          # Ethnicity
                          "31 = Anti-Arab",
                          "32 = Anti-Hispanic",
                          "33 = Anti-Ethnicity Other than Hispanic",
                          # Sexual orientation
                          "41 = Anti-Male Homosexual (Gay)",
                          "42 = Anti-Female Homosexual (Lesbian)",
                          "43 = Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)",
                          "44 = Anti-Heterosexual",
                          "45 = Anti-Bisexual",
                          # From NACJD's sps file 2016
                          "51 = Anti-Physical Disability",
                          "52 = Anti-Mental Disability",
                          "61 = Anti-Male",
                          "62 = Anti-Female",
                          "71 = Anti-Transgender",
                          "72 = Anti-Gender Non-Conforming",
                          "80 = Undocumented Code",
                          "81 = Anti-Eastern Orthodox (Greek, Russian, etc.)",
                          "82 = Anti-Other Christian",
                          "83 = Anti-Buddhist",
                          "84 = Anti-Hindu",
                          "85 = Anti-Sikh",

                          # Type of victim
                          "type_of_victims_offense_1 = ",
                          "I = Individual",
                          "B = Business",
                          "F = Financial Institution",
                          "G = Government",
                          "R = Religious Organization",
                          "S = Society/Public",
                          "O = Other",
                          "U = Unknown")

offense_code_values_2  <- gsub("_1", "_2", offense_code_values_1)
offense_code_values_3  <- gsub("_1", "_3", offense_code_values_1)
offense_code_values_4  <- gsub("_1", "_4", offense_code_values_1)
offense_code_values_5  <- gsub("_1", "_5", offense_code_values_1)
offense_code_values_6  <- gsub("_1", "_6", offense_code_values_1)
offense_code_values_7  <- gsub("_1", "_7", offense_code_values_1)
offense_code_values_8  <- gsub("_1", "_8", offense_code_values_1)
offense_code_values_9  <- gsub("_1", "_9", offense_code_values_1)
offense_code_values_10 <- gsub("_1", "_10", offense_code_values_1)

incident_values_labels <- c(state_group_division_value_labels[1:57],
                            incident_values,
                            offense_code_values_1,
                            offense_code_values_2,
                            offense_code_values_3,
                            offense_code_values_4,
                            offense_code_values_5,
                            offense_code_values_6,
                            offense_code_values_7,
                            offense_code_values_8,
                            offense_code_values_9,
                            offense_code_values_10)

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
                "total_number_of_individual_victims",
                "total_offenders",
                "offenders_race_as_a_group")

offense_and_bias_col_labels <- c("ucr_offense_code_num",
                                 "number_of_victims_offense_num",
                                 "location_code_offense_num",
                                 "bias_motivation_offense_num",
                                 "type_of_victims_offense_num")

offense_and_bias_col_labels <- repeated_label_number_fixer(offense_and_bias_col_labels,
                                                           1:10)


col_labels <- c(col_labels,
                offense_and_bias_col_labels)

setwd(here::here("raw_data/hate_crime_from_fbi"))
make_sps_setup(file_name     = "ucr_hate_crimes_incident_report.sps",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = incident_values_labels)
setwd(here::here("setup_files"))
make_sps_setup(file_name     = "ucr_hate_crimes_incident_report.sps",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = incident_values_labels)