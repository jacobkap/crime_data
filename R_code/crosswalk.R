library(dplyr)
library(asciiSetupReader)
library(stringr)

name_fixes <- c("^UCR_ORIGINATING_AGENCY_IDENTIFIER$"         = "ORI",
                "^ORIGINATING_AGENCY_IDENTIFIER_7_CHARACTER$" = "ORI",
                "^ORIGINATING_AGENCY_IDENTIFIER_9_CHARACTER$" = "ORI9",
                "^ORIGINATING_AGENCY_IDENTIFIER_7_CHARACTERS_FROM_UCR_FILES$" = "ORI",
                "^ORIGINATING_AGENCY_IDENTIFIER_9_CHARACTERS_FROM_UCR_AND_NCIC_FILES$" = "ORI9",
                "^AGENCY_SUB_TYPE_1$"                   = "AGENCY_SUBTYPE_1",
                "^AGENCY_SUB_TYPE_2$"                   = "AGENCY_SUBTYPE_2",
                "^TYPE_OF_AGENCY$"                      = "AGENCY_TYPE",
                "^SPECFUNC$"                            = "AGENCY_SUBTYPE_1",
                "^FIPS_STATE_COUNTY_CODE_ALPHANUMERIC$" = "FIPS_STATE_COUNTY_CODE",
                "^UCR_TOTAL_POPULATION_AS_OF_2012$"     = "population",
                "^U_TPOP$"                              = "population"
                )

cols_to_keep <- c("ORI",
                  "ORI9",
                  "AGENCY_NAME",
                  "AGENCY_TYPE",
                  "AGENCY_SUBTYPE_1",
                  "AGENCY_SUBTYPE_2",
                  "FIPS_STATE_CODE",
                  "FIPS_COUNTY_CODE",
                  "FIPS_PLACE_CODE",
                  "AGENCY_NAME",
                  "CENSUS_NAME"
                  )

agency_type2005 <- c("^1$"  = 'Sheriffs office',              # Sheriff
                     "^2$"  = 'Local police department',      # County police
                     "^3$"  = 'Local police department',      # Municipal police
                     "^5$"  = 'State law enforcement agency', # Primary state LE
                     "^6$"  = 'Special jurisdiction',         # Special police
                     "^7$"  = 'Constable/Marshal',            # Constable
                     "^8$"  = 'Local police department',      # Tribal
                     "^9$"  = 'Local police department'       # Regional police
                     )

# Crosswalk for 2000 has no unique ORIs not already present in the crosswalks
# for 2012 or 2005. The crosswalk for 1996 has 36 unique ORIs not in 2012
# or 2005
read_merge_crosswalks <- function(pop = FALSE) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/crosswalk")
  crosswalk1996 <- spss_ascii_reader("crosswalk1996.txt",
                                     "crosswalk1996.sps",
                                     value_label_fix = FALSE)
  crosswalk2005 <- spss_ascii_reader("crosswalk2005.txt",
                                     "crosswalk2005.sps",
                                     value_label_fix = FALSE)
  crosswalk2012 <- spss_ascii_reader("crosswalk2012.txt",
                                     "crosswalk2012.sps",
                                     value_label_fix = FALSE)
  crosswalk2012_temp <- spss_ascii_reader("crosswalk2012.txt",
                                     "crosswalk2012.sps",
                                     keep_columns = c("ORI7",
                                                      "AGCYTYPE",
                                                      "SUBTYPE1",
                                                      "SUBTYPE2"))
  crosswalk2012$LATITUDE <- NULL

  names(crosswalk1996)      <- str_replace_all(names(crosswalk1996), name_fixes)
  names(crosswalk2005)      <- str_replace_all(names(crosswalk2005), name_fixes)
  crosswalk2005$AGENCY_TYPE <- str_replace_all(crosswalk2005$AGENCY_TYPE, name_fixes)
  names(crosswalk2012)      <- str_replace_all(names(crosswalk2012), name_fixes)
  names(crosswalk2012_temp) <- str_replace_all(names(crosswalk2012_temp), name_fixes)

  if (pop) {
    cols_to_keep <- c(cols_to_keep, "population")
  }

  crosswalk1996 <- crosswalk1996[, names(crosswalk1996) %in% cols_to_keep]
  crosswalk2005 <- crosswalk2005[, names(crosswalk2005) %in% cols_to_keep]
  crosswalk2012 <- crosswalk2012[, names(crosswalk2012) %in% cols_to_keep]
  crosswalk2012$AGENCY_SUBTYPE_1 <- NULL
  crosswalk2012$AGENCY_SUBTYPE_2 <- NULL
  crosswalk2012$AGENCY_TYPE <- NULL
  crosswalk2012 <- left_join(crosswalk2012, crosswalk2012_temp)


  crosswalk2005 <- crosswalk2005[!crosswalk2005$ORI %in% crosswalk2012$ORI,]
  crosswalk     <- bind_rows(crosswalk2012, crosswalk2005)
  crosswalk1996 <- crosswalk1996[!crosswalk1996$ORI %in% crosswalk$ORI,]
  crosswalk     <- bind_rows(crosswalk, crosswalk1996)
  crosswalk$ORI[crosswalk$ORI == -1] <- NA
  crosswalk$ORI9[crosswalk$ORI9 == -1] <- NA

  crosswalk <- crosswalk[!is.na(crosswalk$ORI),]
  names(crosswalk) <- tolower(names(crosswalk))

  # Pads FIPS codes so state FIPS are all 2 characters
  # and county FIPS are all 3 characters
  crosswalk$fips_state_code <- str_pad(crosswalk$fips_state_code,
                                       width = 2,
                                       side = "left",
                                       pad = "0")
  crosswalk$fips_county_code <- str_pad(crosswalk$fips_county_code,
                                       width = 3,
                                       side = "left",
                                       pad = "0")
  crosswalk$fips_place_code <- str_pad(crosswalk$fips_place_code,
                                        width = 5,
                                        side = "left",
                                        pad = "0")

  crosswalk$fips_state_county_code <- paste0(crosswalk$fips_state_code,
                                             crosswalk$fips_county_code)
  crosswalk$fips_state_place_code <- paste0(crosswalk$fips_state_code,
                                             crosswalk$fips_place_code)

  keep_cols <- c("ori",
                 "ori9",
                 "fips_state_code",
                 "fips_county_code",
                 "fips_state_county_code",
                 "fips_place_code",
                 "fips_state_place_code",
                 "agency_type",
                 "agency_subtype_1",
                 "agency_subtype_2",
                 "agency_name",
                 "census_name")
  if (pop) keep_cols <- c(keep_cols, "population")

  crosswalk <-
    crosswalk %>%
    dplyr::select(keep_cols) %>%
    dplyr::rename(crosswalk_agency_name = agency_name)


  # Fix issue where Philly has wrong county FIPS code
  crosswalk$fips_state_place_code[crosswalk$ori == "PAPEP00"] <- "42"
  crosswalk$fips_county_code[crosswalk$ori == "PAPEP00"] <- "101"
  crosswalk$fips_state_county_code[crosswalk$ori == "PAPEP00"] <- "42101"
  crosswalk$fips_place_code[crosswalk$ori == "PAPEP00"] <- "60000"
  crosswalk$fips_state_place_code[crosswalk$ori == "PAPEP00"] <- "4260000"

  # Fix issue where Butler University has wrong county FIPS code
  crosswalk$fips_state_place_code[crosswalk$ori == "IN04940"] <- "18"
  crosswalk$fips_county_code[crosswalk$ori == "IN04940"] <- "097"
  crosswalk$fips_state_county_code[crosswalk$ori == "IN04940"] <- "18097"
  crosswalk$fips_place_code[crosswalk$ori == "IN04940"] <- "36003"
  crosswalk$fips_state_place_code[crosswalk$ori == "IN04940"] <- "1836003"

  # Fix issue where Clinton Tennessee has wrong county FIPS code
  crosswalk$fips_state_place_code[crosswalk$ori == "IN04940"] <- "47"
  crosswalk$fips_county_code[crosswalk$ori == "IN04940"] <- "001"
  crosswalk$fips_state_county_code[crosswalk$ori == "IN04940"] <- "47001"
  crosswalk$fips_place_code[crosswalk$ori == "IN04940"] <- "15580"
  crosswalk$fips_state_place_code[crosswalk$ori == "IN04940"] <- "4715580"

  # These ORIs have Washinton D.C. FIPS codes but are in other states
  crosswalk <- crosswalk[!crosswalk$ori %in% c("MDPPD00", "VAPPD00"),]

  return(crosswalk)

}
