# Reads and cleans Arrest by Age, Sex, and Race (ASR) data from
# the FBI's UCR.
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/ASR_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
system.time(get_ASR_yearly())
system.time(combine_years())
save_as_zip("asr_1980_2015_")

combine_years <- function(crimes, file_name) {

  for (i in 1:length(combined_names)) {
    message(combined_names[i])
    data <- data.frame()
    for (year in 1980:2015) {
      setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR_temp")
      file_name_temp <- paste0("arrests_", names(combined_crimes)[i], "_", year)
      load(paste0(file_name_temp, ".rda"))
      assign("temp", get(file_name_temp)) # Change name
      data <- bind_rows(data, temp)
      message(paste0(year, "     ", ncol(data)))
      do.call("rm", list(as.name(file_name_temp))); gc()

    }
    data <- order_arrest_cols(data)
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR")
    save_files(data = data,
               year = "1980_2015",
               file_name = combined_names[i],
               save_name = combined_names[i])
    rm(data); gc(); Sys.sleep(3)
    message("\n\n\n\n\n")

  }
}


get_ASR_yearly <- function() {
  for (year in 1980:2015) {
    ASR     <- load_arrest_data(year)
    ASR     <- make_simple_columns(ASR)
    agency  <- get_agency_data(year = year)
    for (i in 1:length(combined_crimes)) {
      arrests <- ASR[ASR$OFFENSE_CODE %in% combined_crimes[[i]], ]

      if (names(combined_crimes)[i] == "simple_crimes") {
        arrests <- get_arrest_data(arrests, simple_arrest_categories)
      } else {
      arrests <- get_arrest_data(arrests, all_arrest_categories)
      }

      data    <- left_join(arrests, agency)
      data    <- order_arrest_cols(data)
      setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR_temp")
      save_files(data = data,
                 year = year,
                 file_name = paste0("arrests_", names(combined_crimes)[i], "_"),
                 save_name = paste0("arrests_", names(combined_crimes)[i], "_"),
                 rda_only = TRUE)
      rm(data); rm(arrests); gc(); Sys.sleep(2)
    }

    message(year); gc(); Sys.sleep(5)
  }
}

load_arrest_data <- function(year) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/ASR")
  ASR <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = arrest_cols)
  ORI <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = "ORI",
                           value_label_fix = FALSE)
  OFFENSES <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                       year, ".txt"),
                                paste0("UCR_arrests_by_age_sex_race_",
                                       year, ".sps"),
                                keep_columns = "OFFENSE",
                                value_label_fix = FALSE)
  ASR <- bind_cols(ORI, ASR, OFFENSES)
  rm(ORI); rm(OFFENSES); gc()
  names(ASR) <- gsub("ORIGINATING_AGENCY_IDENTIFIER_CODE", "ORI", names(ASR))
  ASR$OFFENSE_CODE <- str_replace_all(ASR$OFFENSE_CODE, offense_codes)
  ASR$OFFENSE_CODE <- tolower(ASR$OFFENSE_CODE)
  ASR$OFFENSE_CODE <- str_replace_all(ASR$OFFENSE_CODE, offenses)

  ASR <- ASR[ASR$OFFENSE_CODE != "not applicable", ]
  ASR <- ASR[!is.na(ASR$OFFENSE_CODE), ]
  return(ASR)
}

make_simple_columns <- function(data) {
  data[, grep("MALE|JUV|ADULT|JD", names(data))] <- sapply(data[,
                                                             grep("MALE|JUV|ADULT|JD",
                                                                  names(data))],
                                                         function(x) remove_not_reported(x))
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

  ASR <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = other_cols)
  ORI <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".sps"),
                           keep_columns = "ORI",
                           value_label_fix = FALSE)
  ASR <- bind_cols(ORI, ASR)
  ASR <- ASR[!duplicated(ASR$ORIGINATING_AGENCY_IDENTIFIER_CODE), ]


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

