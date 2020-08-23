source(here('R/crosswalk.R'))
source(here('R/utils/global_utils.R'))
source(here('R/make_sps/make_offenses_known_sps.R'))
source(here('R/utils/offenses_known_utils.R'))
crosswalk <- read_merge_crosswalks()

get_all_return_a_monthly(crosswalk)
offenses_known_yearly <- get_data_yearly("offenses_known",
                                         "1960_2018",
                                         "offenses_known_yearly_",
                                         crosswalk)
global_checks(offenses_known_yearly)
table(offenses_known_yearly$number_of_months_missing == offenses_known_yearly$arson_number_of_months_missing)
table(offenses_known_yearly$number_of_months_missing == offenses_known_yearly$arson_number_of_months_missing) / nrow(offenses_known_yearly) * 100
setwd(here("clean_data/offenses_known"))
save_as_zip("ucr_offenses_known_monthly_1960_2018_", pattern = "month")
save_as_zip("ucr_offenses_known_yearly_1960_2018_",  pattern = "year")

get_all_return_a_monthly <- function(crosswalk) {
  setwd(here("raw_data/offenses_known_from_fbi"))
  files <- list.files()
  print(files)

  for (file in files) {
    setwd(here("raw_data/offenses_known_from_fbi"))
    data <- read_ascii_setup(file, here("setup_files/ucr_return_a.sps"))

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
             covered_by_ori = as.character(covered_by_ori)) %>%
      # for some reason in 2018 there are a bunch of agencies with duplicate
      # rows
      distinct(ori, .keep_all = TRUE)

    data <- fix_all_negatives(data)
    data <- fix_outliers(data)
    data <- month_wide_to_long(data)

    if (data$year[1] == 2017) {
      data$unfound_burg_attempted[data$ori %in% "LANPD00"] <- NA
      data$unfound_burg_total[data$ori     %in% "LANPD00"] <- NA
    }
    data <- make_agg_assault(data)

    # Get arson data
    if (data$year[1] >= 1979) {
      load(here(paste0("clean_data/arson/ucr_arson_monthly_", data$year[1], ".rda")))
      assign("arson", get(paste0("ucr_arson_monthly_", data$year[1])))
      rm(list = paste0("ucr_arson_monthly_", data$year[1]))
      arson <-
        arson %>%
        select(ori,
               year,
               month,
               number_of_months_missing,
               last_month_reported,
               dplyr::starts_with("actual"),
               dplyr::starts_with("cleared"),
               dplyr::starts_with("cleared_18"),
               dplyr::starts_with("unfound")) %>%
        rename(arson_number_of_months_missing = number_of_months_missing,
               arson_last_month_reported       = last_month_reported)
      names(arson) <- gsub("^cleared_18", "clr_18_arson", names(arson))
      names(arson) <- gsub("^cleared",    "tot_clr_arson", names(arson))
      names(arson) <- gsub("^actual",     "actual_arson", names(arson))
      names(arson) <- gsub("^unfounded",  "unfound_arson", names(arson))

      data <- left_join(data, arson, by = c("ori", "year", "month"))

      data$actual_all_crimes  <- data$actual_all_crimes  + data$actual_arson_grand_total
      data$tot_clr_all_crimes <- data$tot_clr_all_crimes + data$tot_clr_arson_grand_total
      data$clr_18_all_crimes  <- data$clr_18_all_crimes  + data$clr_18_arson_grand_total
      data$unfound_all_crimes <- data$unfound_all_crimes + data$unfound_arson_grand_total
    }
    data <- make_index_crimes(data)
    data$juvenile_age[data$juvenile_age == 0] <- NA

    data <- fix_number_of_months_reported(data)
    data <- get_months_missing_annual(data)
    data$number_of_months_reported <- NULL

    data <- left_join(data, crosswalk, by = "ori")
    data <- reorder_columns(data, crosswalk)
    data$population_group[data$population_group %in% "7b"] <- NA

    data$state[data$state %in% c("69", "98", "99")] <- NA

    # Save the data in various formats
    setwd(here("clean_data/offenses_known"))
    save_files(data = data,
               year = data$year[1],
               file_name = "offenses_known_monthly_",
               save_name = "offenses_known_monthly_")
    message(data$year[1])
    rm(data); gc(); Sys.sleep(1)


  }
}



