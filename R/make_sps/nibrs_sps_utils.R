# Page 50
location_type_value_labels <- c("location_type = ",
                                "01 = air/bus/train terminal",
                                "02 = bank/savings and loan",
                                "03 = bar/nightclub",
                                "04 = church/synagogue/temple",
                                "05 = commercial/office building",
                                "06 = construction site",
                                "07 = convenience store",
                                "08 = department/discount store",
                                "09 = drug store/doctors office/hospital",
                                "10 = field/woods",
                                "11 = government/public building",
                                "12 = grocery/supermarket",
                                "13 = highway/road/alley",
                                "14 = hotel/motel/etc.",
                                "15 = jail/prison",
                                "16 = lake/waterway",
                                "17 = liquor store",
                                "18 = parking lot/garage",
                                "19 = rental storage facility",
                                "20 = residence/home",
                                "21 = restaurant",
                                "22 = school/college",
                                "23 = service/gas station",
                                "24 = specialty store (tv, fur, etc.)",
                                "25 = other/unknown")
location_type_value_labels_replace <- gsub("^location_type",
                                           "location_type_replace",
                                           location_type_value_labels)

ucr_offense_code_value_labels = c("ucr_offense_code = ",
                                  "200 = arson",
                                  # Assault offenses
                                  "13A = aggravated assault",
                                  "13B = simple assault",
                                  "13C = intimidation",

                                  "510 = bribery",
                                  "220 = burglary/breaking and entering",
                                  "250 = counterfeiting/forgery",
                                  "290 = destruction/damage/vandalism of property",
                                  "35A = drug/narcotic violations",
                                  "35B = drug equipment violations",
                                  "270 = embezzlement",
                                  "210 = extortion/blackmail",
                                  # Fraud offenses
                                  "26A = false pretenses/swindle/confidence game",
                                  "26B = credit card/atm fraud",
                                  "26C = impersonation",
                                  "26D = welfare fraud",
                                  "26E = wire fraud",
                                  # Gambling offenses
                                  "39A = betting/wagering",
                                  "39B = operating/promoting/assisting gambling",
                                  "39C = gambling equipment violations",
                                  "39D = sports tampering",
                                  # Homicide offenses
                                  "09A = murder/nonnegligent manslaughter",
                                  "09B = negligent manslaughter",
                                  "09C = justifiable homicide",

                                  "100 = kidnapping/abduction",
                                  # Theft offenses
                                  "23A = pocket-picking",
                                  "23B = purse-snatching",
                                  "23C = shoplifting",
                                  "23D = theft from building",
                                  "23E = theft from coin-operated machine or device",
                                  "23F = theft from motor vehicle",
                                  "23G = theft of motor vehicle parts/accessories",
                                  "23H = all other larceny",
                                  "240 = motor vehicle theft",
                                  "370 = pornography/obscene material",
                                  # Prostitution offenses
                                  "40A = prostitution",
                                  "40B = assisting or promoting prostitution",

                                  "120 = robbery",
                                  # Sex offenses, forcible
                                  "11A = forcible rape",
                                  "11B = forcible sodomy",
                                  "11C = sexual assault with an object",
                                  "11D = forcible fondling (incident liberties/child molest)",
                                  # Sex offenses, nonforcible
                                  "36A = incest",
                                  "36B = statutory rape",

                                  "280 = stolen property offenses (receiving, selling, etc.)",
                                  "520 = weapon law violations",
                                  # Group 'B' offenses
                                  "90A = bad checks",
                                  "90B = curfew/loitering/vagrancy violations",
                                  "90C = disorderly conduct",
                                  "90D = driving under the influence",
                                  "90E = drunkenness",
                                  "90F = family offenses, nonviolent",
                                  "90G = liquor law violations",
                                  "90H = peeping tom",
                                  "90I = runaway",
                                  "90J = trespass of real property",
                                  "90Z = all other offenses")
ucr_offense_code_value_labels_replace <- gsub("^ucr_offense_code",
                                              "ucr_offense_code_replace",
                                              ucr_offense_code_value_labels)


suspected_drug_type_value_labels <- c("suspected_drug_type = ",
                                      "A = crack cocaine",
                                      "B = cocaine (all forms except crack)",
                                      "C = hashish",
                                      "D = heroin",
                                      "E = marijuana",
                                      "F = morphine",
                                      "G = opium",
                                      "H = other narcotics: codeine, demerol dihydromorphinone or dilaudid, hydrocodone or percodan, methadone, etc.",
                                      "I = LSD",
                                      "P = PCP",
                                      "K = other hallucinogrens: BMDA (white acid), DMT, MDA, MDMA, mescaline or peyote, psilocybin, STP, etc.",
                                      "L = amphetamines/methamphetamines",
                                      "M = other stimulants: adipex, fastine and ionamin (derivatives of phentermine), benzedrine, didrex, methylphenidate or ritalin, phenmetrazine or preludin, tenuate, etc.",
                                      "N = barbiturates",
                                      "O = other depressants: glutethimide or doriden, methaqualone or quaalude, pentazocine or talwin, etc.",
                                      "P = other drugs: antidepressants (elavil, triavil, tofranil, etc.), etc.",
                                      "U = unknown type drug",
                                      "X = over 3 drug types")
suspected_drug_type_value_labels_replace <- gsub("^suspected_drug_type",
                                                 "suspected_drug_type_replace",
                                                 suspected_drug_type_value_labels)









