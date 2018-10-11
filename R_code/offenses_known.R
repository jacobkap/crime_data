source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_yearly.R')

crosswalk <- read_merge_crosswalks()
cross_names <- names(crosswalk)
cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]
save_ucr_monthly()
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
yearly_offenses <- make_ucr_yearly()
summary(yearly_offenses)
names(yearly_offenses)
table(yearly_offenses$year)
table(is.na(yearly_offenses$ori))
table(yearly_offenses$state)
table(yearly_offenses$last_month_reported)
table(yearly_offenses$last_month_reported, yearly_offenses$year)
table(yearly_offenses$division)
table(yearly_offenses$group)
saving_yearly(yearly_offenses)
save_as_zip("ucr_offenses_known_yearly_1960_2017_", "yearly")
save_as_zip("ucr_offenses_known_monthly_1960_2017_", "monthly")

# Save in various data formats --------------------------------------------
save_ucr_monthly <- function() {
  for (year in 1960:2017) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
    data <- spss_ascii_reader(dataset_name =
                                paste0(year, "_UCR_offenses_known.txt"),
                              sps_name =
                                paste0(year, "_UCR_offenses_known.sps"))
    data$ORI_CODE <- NULL
    ori_col_to_keep = "ORI_CODE"
    if (year %in% 2016:2017) {
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

    if (any(grepl("sub_group", names(data), ignore.case = TRUE))) {
      sub_group_data <- spss_ascii_reader(dataset_name =
                                  paste0(year, "_UCR_offenses_known.txt"),
                                sps_name =
                                  paste0(year, "_UCR_offenses_known.sps"),
                                keep_columns = "SUB_GROUP",
                                value_label_fix = FALSE)
      data$SUB_GROUP <- NULL
      data <- bind_cols(sub_group_data, data)
      data$SUB_GROUP    <- stringr::str_replace_all(data$SUB_GROUP, sub_group)
      data$GROUP_NUMBER <- data$SUB_GROUP

      rm(sub_group_data)
    }

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
      dplyr::mutate_at(vars(population_cols), parse_number) %>%
      dplyr::mutate(total_population = rowSums(select_(., "population_1",
                                                       "population_2",
                                                       "population_3"),
                                               na.rm = TRUE)) %>%
      dplyr::select(-matches("icpsr|part_number|agency_count|edition_number"),
                    -matches("^sequence_number$|^sequence$|card_[0-9]|follow"),
                    -matches("month_included|_last_update|special|mailing|last_pop"),
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
      dplyr::filter(!is.na(ori),
                    ori != "9999999") %>%
      dplyr::rename(group               = group_number,
                    last_month_reported = months_reported) %>%
      dplyr::select(starting_cols,
                    cross_names,
                    other_cols,
                    matches("included|last"),
                    one_of(crime_cols)) %>%
      dplyr::mutate(month = factor(month,
                                   levels = tolower(month.name))) %>%
      dplyr::arrange(ori,
                     month) %>%
      dplyr::mutate(month = as.character(month))


    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    save_files(data = data,
               year = year,
               file_name = "ucr_offenses_known_monthly_",
               save_name = "ucr_offenses_known_monthly_")
    gc(); Sys.sleep(5)

    message(year)
  }
}

years <- c()
for (year in 1960:2017) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
  data <- spss_ascii_reader(dataset_name =
                              paste0(year, "_UCR_offenses_known.txt"),
                            sps_name =
                              paste0(year, "_UCR_offenses_known.sps"),
                            value_label_fix = FALSE,
                            real_names = TRUE,
                            keep_columns = NULL,
                            coerce_numeric = TRUE,
                            n_max = 1)
  message(year)

  if (any(grepl("sub_group", names(data), ignore.case = TRUE))) {
    years <- c(years, year)
  }
}

data <- data.frame()
for (year in years) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
  temp <- spss_ascii_reader(dataset_name =
                              paste0(year, "_UCR_offenses_known.txt"),
                            sps_name =
                              paste0(year, "_UCR_offenses_known.sps"),
                            value_label_fix = FALSE,
                            keep_columns = c("GROUP_NUMBER", "SUB_GROUP"))
  message(year)
  data <- bind_rows(data, temp)
}
