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
saving_yearly(yearly_offenses)
save_as_zip("ucr_offenses_known_1960_2016_")

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
    current_year = year
    population_cols <- c("population_1", "population_2", "population_3")




    data <-
      data %>%
      dplyr::rename_all(tolower) %>%
      dplyr::left_join(crosswalk) %>%
      dplyr::mutate_if(is.factor, as.character) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(ori = toupper(ori),
                    ori9 = toupper(ori9),
                    state_abb = make_state_abb(state),
                    population_2 = na_if(population_2, "inap"),
                    year = current_year) %>%
      dplyr::mutate_at(vars(population_cols), as.numeric) %>%
      dplyr::mutate(total_population = rowSums(select_(., "population_1",
                                                       "population_2",
                                                       "population_3"),
                                               na.rm = TRUE)) %>%
      dplyr::select(-matches("icpsr|part_number|agency_count|edition_number"),
                    -matches("^sequence_number$|^sequence$")) %>%
      dplyr::select(starting_cols,
                    cross_names,
                    other_cols,
                    contains("month_included"),
                    contains("last_update"),
                    contains("card"),
                    # January
                    starts_with("jan_officer"),
                    starts_with("jan_act"),
                    starts_with("jan_clr"), # Includes clr_18
                    starts_with("jan_unfound"),
                    # February
                    starts_with("feb_officer"),
                    starts_with("feb_act"),
                    starts_with("feb_clr"), # Includes clr_18
                    starts_with("feb_unfound"),
                    # March
                    starts_with("mar_officer"),
                    starts_with("mar_act"),
                    starts_with("mar_clr"), # Includes clr_18
                    starts_with("mar_unfound"),
                    # Apr
                    starts_with("apr_officer"),
                    starts_with("apr_act"),
                    starts_with("apr_clr"), # Includes clr_18
                    starts_with("apr_unfound"),
                    # May
                    starts_with("may_officer"),
                    starts_with("may_act"),
                    starts_with("may_clr"), # Includes clr_18
                    starts_with("may_unfound"),
                    # June
                    starts_with("jun_officer"),
                    starts_with("jun_act"),
                    starts_with("jun_clr"), # Includes clr_18
                    starts_with("jun_unfound"),
                    # July
                    starts_with("jul_officer"),
                    starts_with("jul_act"),
                    starts_with("jul_clr"), # Includes clr_18
                    starts_with("jul_unfound"),
                    # August
                    starts_with("aug_officer"),
                    starts_with("aug_act"),
                    starts_with("aug_clr"), # Includes clr_18
                    starts_with("aug_unfound"),
                    # September
                    starts_with("sep_officer"),
                    starts_with("sep_act"),
                    starts_with("sep_clr"), # Includes clr_18
                    starts_with("sep_unfound"),
                    # October
                    starts_with("oct_officer"),
                    starts_with("oct_act"),
                    starts_with("oct_clr"), # Includes clr_18
                    starts_with("oct_unfound"),
                    # November
                    starts_with("nov_officer"),
                    starts_with("nov_act"),
                    starts_with("nov_clr"), # Includes clr_18
                    starts_with("nov_unfound"),
                    # December
                    starts_with("dec_officer"),
                    starts_with("dec_act"),
                    starts_with("dec_clr"), # Includes clr_18
                    starts_with("dec_unfound"))
    names(data) <- gsub("larceny", "theft", names(data))

    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    save_files(data = data,
               year = year,
               file_name = "ucr_offenses_known_monthly_",
               save_name = "ucr_offenses_known_monthly_")
    gc(); Sys.sleep(5)

    message(year)
  }
}

