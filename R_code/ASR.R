# Reads and cleans Arrest by Age, Sex, and Race (ASR) data from
# the FBI's UCR.
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/ASR_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
# get_ASR_yearly()
combine_years(arrest_groups = c("index_crimes",
                                "financial_crimes",
                                "grey_collar_and_property_crimes",
                                "violent_crimes",
                                "sex_or_dv_crimes",
                                "alcohol_crimes"))
combine_years(arrest_groups = "other_crimes")
combine_years(arrest_groups = "simple_crimes")
combine_years(arrest_groups = "drug_crimes")
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR")
save_as_zip("asr_index_crimes_1980_2016_", pattern = "index")
save_as_zip("asr_financial_1980_2016_", pattern = "financial")
save_as_zip("asr_grey_collar_property_crimes_1980_2016_", pattern = "grey_collar")
save_as_zip("asr_violent_crimes_1980_2016_", pattern = "violent")
save_as_zip("asr_sex_or_dv_crimes_1980_2016_", pattern = "sex_or_dv")
save_as_zip("asr_alcohol_crimes_1980_2016_", pattern = "alcohol")
save_as_zip("asr_other_crimes1980_2016_", pattern = "other")
save_as_zip("asr_simple_1980_2016_", pattern = "simple")
save_as_zip("asr_drug_crimes_1980_2016_", pattern = "drug")

combine_years <- function(arrest_groups) {

  for (arrest_group in arrest_groups) {
    message(arrest_group)
    name_to_save <- paste0("asr_", arrest_group, "_")
    data <- data.table::data.table()
    for (year in 1980:2016) {
      setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR_temp")
      file_name_temp <- paste0("arrests_",
                               names(combined_crimes[arrest_group]),
                               "_",
                               year)
      load(paste0(file_name_temp, ".rda"))
      data <- data.table::rbindlist(list(data, get(file_name_temp)),
                                    use.names = TRUE,
                                    fill = TRUE)
      message(year)
      do.call("rm", list(as.name(file_name_temp))); gc(); Sys.sleep(1.5)
    }
    data <- order_arrest_cols(data)
    data <- data.frame(data)
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR")
    names(data) <- gsub("heroin_coke_tot_female_adult",
                        "heroin_coke_tot_female_adul",
                        names(data))
    save_files(data = data,
               year = "1980_2016",
               file_name = name_to_save,
               save_name = name_to_save)
    rm(data); gc(); Sys.sleep(10)
  }
}


get_ASR_yearly <- function() {
  for (year in 1980:2016) {
    ASR     <- load_arrest_data(year)
    ASR     <- make_simple_columns(ASR)
    agency  <- get_agency_data(year = year)
    for (i in 1:length(combined_crimes)) {
      Sys.sleep(1)
      arrests <- ASR[ASR$OFFENSE_CODE %in% combined_crimes[[i]], ]
      Sys.sleep(1)

      if (names(combined_crimes)[i] == "simple_crimes") {
        arrests <- get_arrest_data(arrests, simple_arrest_categories)
      } else {
        arrests <- get_arrest_data(arrests, all_arrest_categories)
      }

      data    <- left_join(agency, arrests)
      rm(arrests); gc(); Sys.sleep(1)
      data    <- order_arrest_cols(data)
      setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR_temp")
      save_files(data = data,
                 year = year,
                 file_name = paste0("arrests_", names(combined_crimes)[i], "_"),
                 save_name = paste0("arrests_", names(combined_crimes)[i], "_"),
                 rda_only = TRUE)
      rm(data); gc(); Sys.sleep(2)
    }

    message(year); rm(ASR); gc(); Sys.sleep(5)
  }
}

load_arrest_data <- function(year) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/ASR")
  ASR <- spss_ascii_reader(paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = arrest_cols)
  ORI <- spss_ascii_reader(paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = "ORI",
                           value_label_fix = FALSE)
  OFFENSES <- spss_ascii_reader(paste0("ucr_arrests_by_age_sex_race_",
                                       year, ".txt"),
                                paste0("ucr_arrests_by_age_sex_race_",
                                       year, ".sps"),
                                keep_columns = "OFFENSE",
                                value_label_fix = FALSE)
  ASR <- bind_cols(ORI, ASR, OFFENSES)
  rm(ORI); rm(OFFENSES); gc()
  names(ASR) <- gsub("ORIGINATING_AGENCY_IDENTIFIER_CODE", "ORI", names(ASR))
  ASR$OFFENSE_CODE <- str_replace_all(ASR$OFFENSE_CODE, offense_codes)
  ASR$OFFENSE_CODE <- tolower(ASR$OFFENSE_CODE)
  ASR$OFFENSE_CODE <- str_replace_all(ASR$OFFENSE_CODE, offenses)

  ASR[, grep("MALE|JUV|ADULT|JD", names(ASR))] <- sapply(ASR[,
                                                                grep("MALE|JUV|ADULT|JD",
                                                                     names(ASR))],
                                                           function(x) remove_not_reported(x))

#  ASR <- ASR[ASR$OFFENSE_CODE != "not applicable", ]
#  ASR <- ASR[!is.na(ASR$OFFENSE_CODE), ]
  return(ASR)
}

make_simple_columns <- function(data) {

  data$tot_male_juv     <- rowSums(data[, grep("^MALE_(10|13|15|16|17)",
                                               names(data))])
  data$tot_male_adult   <- rowSums(data[, grep("^MALE_(18|19|[2-6].|OVER)",
                                               names(data))])
  data$tot_female_juv   <- rowSums(data[, grep("^MALE_(10|13|15|16|17)",
                                               names(data))])
  data$tot_female_adult <- rowSums(data[, grep("^FEMALE_(18|19|[2-6].|OVER)",
                                               names(data))])
  data$tot_male         <- rowSums(data[, grep("^MALE", names(data))])
  data$tot_female       <- rowSums(data[, grep("^FEMALE", names(data))])
  data$tot_juv          <- rowSums(data[, grep("10|13|15|16|17", names(data))])
  data$tot_adult        <- rowSums(data[, grep("MALE_(18|19|[2-6].|OVER)",
                                               names(data))])
  data$tot_arrests      <- rowSums(data[, grep("MALE", names(data))])
  return(data)
}

get_arrest_data <- function(ASR, arrest_categories) {
  ASR <- data.table(ASR)
  ASR <- melt(ASR, id.vars = c("OFFENSE_CODE", "ORI"),
              measure.vars = arrest_categories)
  ASR$value <- as.numeric(ASR$value)
  ASR$value <- remove_missing(ASR$value)
  ASR$variable <- paste(ASR$OFFENSE_CODE,  ASR$variable, sep = "_")
  ASR <- dcast(ASR, ORI ~ variable, value.var = "value", fun.aggregate = sum)
  ASR <-
    ASR %>%
    group_by(ORI) %>%
    summarise_all(sum)
  names(ASR) <- str_replace_all(names(ASR), fix_cols_names)
  names(ASR) <- tolower(names(ASR))
  ASR <- data.frame(ASR)

  return(ASR)
}

get_agency_data <- function(year) {
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
  crosswalk <- read_merge_crosswalks()
  crosswalk_cols <- names(crosswalk)
  crosswalk_cols <- crosswalk_cols[!crosswalk_cols %in% c("ori", "ori9")]
  crosswalk_cols <- c("ori", "ori9", "year", "state", "state_abb",
                      crosswalk_cols)
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/ASR")

  ASR <- spss_ascii_reader(paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = other_cols)
  ORI <- spss_ascii_reader(paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("ucr_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = "ORI",
                           value_label_fix = FALSE)
  ASR <- bind_cols(ORI, ASR)

  ASR$MONTH <- tolower(ASR$MONTH)
  ASR$MONTH[!ASR$MONTH %in% 1:12] <- 0
  ASR$MONTH <- as.numeric(ASR$MONTH)
  month_name <- c("^0$"  = "no months reported",
                  "^1$"  = "january",
                  "^2$"  = "february",
                  "^3$"  = "march",
                  "^4$"  = "april",
                  "^5$"  = "may",
                  "^6$"  = "june",
                  "^7$"  = "july",
                  "^8$"  = "august",
                  "^9$"  = "september",
                  "^10$" = "october",
                  "^11$" = "november",
                  "^12$" = "december")

  max_month <-
    ASR %>%
    dplyr::group_by(ORIGINATING_AGENCY_IDENTIFIER_CODE) %>%
    dplyr::summarize(last_month_reported = max(MONTH)) %>%
    dplyr::mutate(last_month_reported = stringr::str_replace_all(last_month_reported,
                                                                 month_name)) %>%
    dplyr::select(ORIGINATING_AGENCY_IDENTIFIER_CODE,
                  last_month_reported)


  ASR <- ASR[!duplicated(ASR$ORIGINATING_AGENCY_IDENTIFIER_CODE), ]
  ASR <- left_join(ASR, max_month)


  names(ASR) <- str_replace_all(names(ASR), fix_cols_names)
  ASR$state_abb <- state.abb[match(ASR$STATE, state.name)]
  ASR$state_abb[ASR$STATE == "canal zone"]           <- "CZ"
  ASR$state_abb[ASR$STATE == "district of columbia"] <- "DC"
  ASR$state_abb[ASR$STATE == "guam"]                 <- "GU"
  ASR$state_abb[ASR$STATE == "puerto rico"]          <- "PR"
  ASR$state_abb[ASR$STATE == "virgin islands"]       <- "VI"
  names(ASR) <- tolower(names(ASR))

  ASR              <- left_join(ASR, crosswalk)
  char_cols        <- sapply(ASR, is.character)
  ASR[, char_cols] <- sapply(ASR[, char_cols], tolower)
  ASR$ori          <- toupper(ASR$ori)
  ASR$ori9         <- toupper(ASR$ori9)
  ASR$state_abb    <- toupper(ASR$state_abb)

  return(ASR)
}

