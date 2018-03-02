# Reads and cleans Arrest by Age, Sex, and Race (ASR) data from
# the FBI's UCR.
setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/ASR")
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/ASR_utils.R')

# Year 1989, ORIs AZ00310 and MD00204 are in yearly but not monthly data
# Year 2001, ORIs are in "AL02306" "AL02805" "AL02814" are in monthly but
# not yearly data
for (year in 1980:2014) {
  message(year)

  ASR <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = arrest_cols,
                           value_label_fix = FALSE)
  ASR$OFFENSE_CODE <- str_replace_all(ASR$OFFENSE_CODE, offense_codes)
  ASR[4:59] <- sapply(ASR[4:59], function(x) remove_missing(x))
  ASR <- ASR %>% group_by(ORIGINATING_AGENCY_IDENTIFIER_CODE,
                          OFFENSE_CODE,
                          YEAR) %>%
    summarise_all(funs(sum(., na.rm = TRUE)))
  ASR <- ASR[!is.na(ASR$OFFENSE_CODE), ]

  ASR_year <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_yearly_",
                                       year, ".txt"),
                                paste0("UCR_arrests_by_age_sex_race_yearly_",
                                       year, ".sps"),
                                keep_columns = arrest_cols,
                                value_label_fix = FALSE)
  ASR_year$OFFENSE_CODE <- str_replace_all(ASR_year$OFFENSE_CODE, offense_codes_yearly)
  ASR_year <- ASR_year[, names(ASR)]
  ASR_year[4:59] <- sapply(ASR_year[4:59], function(x) remove_missing(x))
  ASR_year[4:59] <- sapply(ASR_year[4:59], function(x) NA_to_zero(x))
  ASR_year <- ASR_year[!is.na(ASR_year$OFFENSE_CODE), ]


  ASR <- ASR[ASR$ORIGINATING_AGENCY_IDENTIFIER_CODE %in% ASR_year$ORIGINATING_AGENCY_IDENTIFIER_CODE, ]
  ASR_year <- ASR_year[ASR_year$ORIGINATING_AGENCY_IDENTIFIER_CODE %in% ASR$ORIGINATING_AGENCY_IDENTIFIER_CODE, ]
  message("Only common ORIs:    ", nrow(ASR), " ", nrow(ASR_year), " ", all.equal(ASR, ASR_year))

  rm(ASR); rm(ASR_year); gc(); Sys.sleep(10)
}