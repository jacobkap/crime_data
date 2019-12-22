source(here::here('R/crosswalk.R'))
source(here::here('R/utils/global_utils.R'))
source(here::here('R/make_sps/make_offenses_known_sps.R'))
source(here::here('R/utils/offenses_known_utils.R'))
crosswalk <- read_merge_crosswalks()

#get_all_return_a_monthly(crosswalk)
offenses_known_yearly <- get_data_yearly("offenses_known",
                                         "1960_2017",
                                         "offenses_known_yearly_",
                                         crosswalk)
global_checks(offenses_known_yearly)
setwd(here::here("clean_data/offenses_known"))
save_as_zip("ucr_offenses_known_monthly_1960_2017_", pattern = "month")
save_as_zip("ucr_offenses_known_yearly_1960_2017_", pattern = "year")

get_all_return_a_monthly <- function(crosswalk) {
  setwd(here::here("raw_data/offenses_known_from_fbi"))
  files <- list.files()
  files <- files[!grepl("sps", files)]

  for (file in files) {
    setwd(here::here("raw_data/offenses_known_from_fbi"))
    data <- read_ascii_setup(file, here::here("setup_files/ucr_return_a.sps"))

    data <-
      data %>%
      filter(!is.na(ori)) %>%
      select(-identifier_code,
             -population_source,
             -contains("last_population"),
             -contains("under50"),
             -population_1_msa,
             -population_2_msa,
             -population_3_msa,
             -population_source,
             -sequence_number,
             -agency_state_name,
             -covered_by_population_group,
             -contains("blank"),
             -population_group_in_previous_year) %>%
      mutate_at(vars(tidyselect::matches("card")),
                remove_special_characters) %>%
      mutate_at(vars(tidyselect::matches("mail")),
                crime_remove_special_characters) %>%
      mutate_if(is.character, tolower) %>%
      mutate(year           = fix_years(year),
             population     = population_1 + population_2 + population_3,
             ori            = toupper(ori),
             state_abb      = make_state_abb(state),
             covered_by_ori = as.character(covered_by_ori))

    data <- fix_all_negatives(data)
    data <- fix_outliers(data)
    data <- month_wide_to_long(data)

    if (data$year[1] == 2017) {
      data$unfound_burg_attempted[data$ori %in% "LANPD00"] <- NA
      data$unfound_burg_total[data$ori %in% "LANPD00"] <- NA
    }


    data <- make_agg_assault(data)
    data <- make_index_crimes(data)
    data$juvenile_age[data$juvenile_age == 0] <- NA

    data <- fix_number_of_months_reported(data)
    data <- get_months_missing_annual(data)
    data$number_of_months_reported <- NULL

    data <- left_join(data, crosswalk, by = "ori")
    data <- reorder_columns(data, crosswalk)
    data$population_group[data$population_group %in% "7b"] <- NA

    data$last_update         <- mdy(data$last_update)
    data$date_of_last_update <- mdy(data$date_of_last_update)


    # Save the data in various formats
    setwd(here::here("clean_data/offenses_known"))
    save_files(data = data,
               year = data$year[1],
               file_name = "offenses_known_monthly_",
               save_name = "offenses_known_monthly_")
    rm(data); gc(); Sys.sleep(3)

  }
}



