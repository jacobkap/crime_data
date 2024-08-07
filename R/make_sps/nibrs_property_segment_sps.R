source(here::here('R/make_sps/make_sps_utils.R'))
source(here::here('R/make_sps/nibrs_sps_utils.R'))
# Page 54-61


col_positions <- c("1-2",
                   "3-4",
                   "5-13",
                   "14-25",
                   "26-33",
                   "34",
                   "35-36",
                   "37-45",
                   "46-53",
                   "54-55",
                   "56-57",
                   "58",
                   "59-67",
                   "68-70",
                   "71-72",
                   "73",
                   "74-82",
                   "83-85",
                   "86-87",
                   "88",
                   "89-97",
                   "98-100",
                   "101-102")



col_labels <- c("segment_level",
                "state",
                "ori",
                "incident_number",
                "incident_date",
                "type_of_property_loss",
                "property_description",
                "value_of_property",
                "date_recovered",
                "number_of_stolen_motor_vehicles",
                "num_of_recovered_motor_vehicles",
                "suspected_drug_type_1",
                "estimated_quantity_1",
                "est_quantity_fractional_1000th1",
                "type_of_measurement_1",
                "suspected_drug_type_2",
                "estimated_quantity_2",
                "est_quantity_fractional_1000th2",
                "type_of_measurement_2",
                "suspected_drug_type_3",
                "estimated_quantity_3",
                "est_quantity_fractional_1000th3",
                "type_of_measurement_3")

nibrs_property_segment_value_labels <- c("type_of_measurement_replace = ",
                                         # Weight
                                         "GM = gram",
                                         "KG = kilogram",
                                         "OZ = ounce",
                                         "LB = pound",
                                         # Capacity
                                         "ML = milliliter",
                                         "LT = liter",
                                         "FO = fluid ounce",
                                         "GL = gallon",
                                         # Units
                                         "DU = dosage unit/items (pills, etc.)",
                                         "NP = number of plants",
                                         "XX = not reported",
                                         suspected_drug_type_value_labels_replace)
nibrs_property_segment_value_labels <- repeated_label_replace_fixer(nibrs_property_segment_value_labels, 1:3)
nibrs_property_segment_value_labels <-
  c(state_value_labels,
    nibrs_property_segment_value_labels,
    "type_of_property_loss = ",
    "1 = none",
    "2 = burned",
    "3 = counterfeited/forged",
    "4 = destroyed/damaged/vandalized",
    "5 = recovered",
    "6 = seized",
    "7 = stolen/etc. (includes bribed, defrauded, embezzled, extorted, ransomed, robbed, etc.)",
    "8 = unknown",
    "property_description = ",
    "01 = aircraft",
    "02 = alcohol",
    "03 = automobiles",
    "04 = bicycles",
    "05 = buses",
    "06 = clothes/furs",
    "07 = computer hardware/software",
    "08 = consumable goods",
    "09 = credit/debit cards",
    "10 = drugs/narcotics",
    "11 = drug/narcotic equipment",
    "12 = farm equipment",
    "13 = firearms",
    "14 = gambling equipment",
    "15 = heavy construction/industrial equipment",
    "16 = household goods",
    "17 = jewelry/precious metals",
    "18 = livestock",
    "19 = merchandise",
    "20 = money",
    "21 = negotiable instruments",
    "22 = nonnegotiable instruments",
    "23 = office-type equipment",
    "24 = other motor vehicles",
    "25 = purses/handbags/wallets",
    "26 = radios/TVs/VCRs",
    "27 = recordings - audio/visual",
    "28 = recreational vehicles",
    "29 = structures - single occupancy dwellings",
    "30 = structures - other dwellings",
    "31 = structures - commercial/business",
    "32 = structures - industrial manufacturing",
    "33 = structures - public/community",
    "34 = structures - storage",
    "35 = structures - other",
    "36 = tools - power/hand",
    "37 = trucks",
    "38 = vehicle parts/accessories",
    "39 = watercraft",
    "77 = other",
    "88 = pending inventory (of property)",
    "99 = special category",
    # From NACJD 2016 property segment file
    "41 = aircraft parts/accessories",
    "42 = artistic supplies/accessories",
    "43 = building materials",
    "44 = camping/hunting/fishing equipment/supplies",
    "45 = chemicals",
    "46 = collections/collectibles",
    "47 = crops",
    "48 = documents - personal or business",
    "49 = explosives",
    "59 = firearm accessories",
    "64 = fuel",
    "65 = identity documents",
    "66 = identity - intangible",
    "67 = law enforcement equipment",
    "68 = lawn/yard/garden equipment",
    "69 = logging equipment",
    "70 = medical/medical lab equipment",
    "71 = metals, non-precious",
    "72 = musical instruments",
    "73 = pets",
    "74 = photographic/optical equipment",
    "75 = portible electronic communications",
    "76 = recreational/sports equipment",
    "78 = trailers",
    "79 = watercraft equipment/parts/accessories",
    "80 = weapons - other",
    "value_of_property = ",
    "000000001 = unknown")

setwd(here::here("setup_files"))
make_sps_setup(file_name = "nibrs_property_segment",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels  = nibrs_property_segment_value_labels)
