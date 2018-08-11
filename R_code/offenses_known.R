source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_yearly.R')

crosswalk <- read_merge_crosswalks()
cross_names <- names(crosswalk)
cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]
save_ucr_monthly()
save_as_zip("ucr_offenses_known_monthly_1960_2016_", "monthly")
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
yearly_offenses <- make_ucr_yearly()
summary(yearly_offenses)
saving_yearly(yearly_offenses)
save_as_zip("ucr_offenses_known_yearly_1960_2016_", "yearly")

# Save in various data formats --------------------------------------------
save_ucr_monthly <- function() {
  for (year in 1960:2016) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
    data <- spss_ascii_reader(dataset_name =
                                paste0(year, "_UCR_offenses_known.txt"),
                              sps_name =
                                paste0(year, "_UCR_offenses_known.sps"))
    data$ORI_CODE <- NULL
    ori_col_to_keep = "ORI_CODE"
    if (year == 2016) {
      ori_col_to_keep = "ORI"
      data$ORI <- NULL
    }
    if (year == 1972) {
      ori_col_to_keep <- c(ori_col_to_keep, "NUMERIC_STATE_CODE")
    }
    ORIs <- spss_ascii_reader(dataset_name =
                                paste0(year, "_UCR_offenses_known.txt"),
                              sps_name =
                                paste0(year, "_UCR_offenses_known.sps"),
                              keep_columns = ori_col_to_keep,
                              value_label_fix = FALSE)

    # Fixes issue where ORI has VA02901 wrong state code
    if (year == 1972) {
      ORIs$ORI_CODE[ORIs$ORI_CODE == "SC02901" &
                      ORIs$NUMERIC_STATE_CODE == 45] <- "VA02901"
      ORIs$NUMERIC_STATE_CODE <- NULL
    }

    data <- bind_cols(ORIs, data)
    rm(ORIs)
    data <- cleaning_UCR(data)
    data <- fix_outliers(data, year)
    data <- make_agg_assault(data)
    names(data) <- tolower(names(data))
    data <- month_wide_to_long(data)
    current_year <- year
    population_cols <- c("population_1", "population_2", "population_3")




    data <-
      data %>%
      dplyr::rename_all(tolower) %>%
      dplyr::left_join(crosswalk) %>%
      dplyr::mutate_if(is.factor, as.character) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(ori          = toupper(ori),
                    ori9         = toupper(ori9),
                    state_abb    = make_state_abb(state),
                    population_2 = na_if(population_2, "inap"),
                    year         = current_year,
                    date         = as.character(date)) %>%
      dplyr::mutate_at(vars(population_cols), as.numeric) %>%
      dplyr::mutate(total_population = rowSums(select_(., "population_1",
                                                       "population_2",
                                                       "population_3"),
                                               na.rm = TRUE)) %>%
      dplyr::select(-matches("icpsr|part_number|agency_count|edition_number"),
                    -matches("^sequence_number$|^sequence$|card_[0-9]|follow"),
                    -agency_state_name)
    data$population_2[is.na(data$population_2)] <- 0

    names(data) <- gsub("larceny", "theft", names(data))
    names(data) <- gsub("clr_", "tot_clr_", names(data))
    names(data) <- gsub("tot_clr_18", "clr_18", names(data))

    crime_cols <- sort(grep("^act|^tot_clr|^clr|unfound",
                            names(data),
                            value = TRUE))
    crime_cols <- c(sort(grep("officer",
                              names(data),
                              value = TRUE)),
                    crime_cols)
    crime_cols <- c(grep("officer", crime_cols, value = TRUE),
                    grep("^act", crime_cols, value = TRUE),
                    grep("^tot_clr", crime_cols, value = TRUE),
                    grep("^clr_18", crime_cols, value = TRUE),
                    grep("unfound", crime_cols, value = TRUE))
    data <-
      data %>%
      dplyr::select(starting_cols,
                    cross_names,
                    other_cols,
                    matches("included|last"),
                    one_of(crime_cols))


    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    save_files(data = data,
               year = year,
               file_name = "ucr_offenses_known_monthly_",
               save_name = "ucr_offenses_known_monthly_")
    gc(); Sys.sleep(5)

    message(year)
  }
}

