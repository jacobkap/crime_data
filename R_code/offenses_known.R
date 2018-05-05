source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_yearly.R')

crosswalk <- read_merge_crosswalks()
cross_names <- names(crosswalk)
cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]
save_ucr_monthly()
yearly_offenses <- make_ucr_yearly()
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
saving_yearly(yearly_offenses)
save_as_zip("ucr_offenses_known_1960_2016_")

# Save in various data formats --------------------------------------------
save_ucr_monthly <- function() {
  for (year in 1960:2016) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
    temp <- spss_ascii_reader(dataset_name =
                                paste0(year, "_UCR_offenses_known.txt"),
                              sps_name =
                                paste0(year, "_UCR_offenses_known.sps"))
    temp$ORI_CODE <- NULL
    ori_col_to_keep = "ORI_CODE"
    if (year == 2016) {
      ori_col_to_keep = "ORI"
      temp$ORI <- NULL
    }
    ORIs <- spss_ascii_reader(dataset_name =
                                paste0(year, "_UCR_offenses_known.txt"),
                              sps_name =
                                paste0(year, "_UCR_offenses_known.sps"),
                              keep_columns = ori_col_to_keep,
                              value_label_fix = FALSE)
    temp <- bind_cols(ORIs, temp)
    rm(ORIs)
    temp <- cleaning_UCR(temp)

    if (year == 1972) {
      temp$ORI[temp$NUMERIC_STATE_CODE == "virginia" &
                 temp$POPULATION_1 == "446963"] <- "VA02901"
    }

    factor_cols <- sapply(temp, is.factor)
    temp[factor_cols] <- sapply(temp[factor_cols], function(x) as.character(x))

    names(temp) <- tolower(names(temp))
    temp <- left_join(temp, crosswalk)

    char_cols <- sapply(temp, is.character)

    # for (i in 1:ncol(temp)) {
    #   if (is.character(temp[,i])) {
    #     temp[,i] <- tolower(temp[,i])
    #   }
    # }
    # To fix emojis/special characters
    temp$jul_card_3_pt <- iconv(temp$jul_card_3_pt, to = "ASCII//TRANSLIT")
    temp$aug_card_3_pt <- iconv(temp$aug_card_3_pt, to = "ASCII//TRANSLIT")
    temp$mailing_address_line_4 <- iconv(temp$mailing_address_line_4, to = "ASCII//TRANSLIT")
    temp[char_cols] <- sapply(temp[char_cols], function(x) tolower(x))
    temp$ori <- toupper(temp$ori)
    temp$ori9 <- toupper(temp$ori9)
    temp$state_abb <- state.abb[match(toupper(temp$state),
                                      toupper(state.name))]
    starting_cols <- c("ori", "ori9", "year", "state",
                       "state_abb", "months_reported")
    temp <-
      temp %>%
      dplyr::select(-contains("icpsr")) %>%
      dplyr::select(starting_cols, cross_names, dplyr::everything())

    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    save_files(data = temp,
               year = year,
               file_name = "ucr_offenses_known_monthly_",
               save_name = "ucr_offenses_known_monthly_")
    gc(); Sys.sleep(5)

    message(year)
  }
}



# save_raw_as_zip <- function() {
#   setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
#   all_files <- list.files()
#
#   zip::zip(zipfile = "UCR_offenses_known_1960_2016_ascii_sps.zip",
#            files = all_files)
#
# }
# save_raw_as_zip()

