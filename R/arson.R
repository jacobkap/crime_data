source(here('R/utils/global_utils.R'))
source(here('R/make_sps/make_arson_sps.R'))
source(here('R/crosswalk.R'))
crosswalk <- read_merge_crosswalks()

get_arson(crosswalk)
arson_yearly <- get_data_yearly("arson", "1979_2018", "ucr_arson_yearly_", crosswalk)
global_checks(arson_yearly)
setwd(here("clean_data/arson"))
save_as_zip("ucr_arson_monthly_1979_2018_", pattern = "month")
save_as_zip("ucr_arson_yearly_1979_2018_",  pattern = "year")

get_arson <- function(crosswalk) {
  setwd(here("raw_data/arson_from_fbi"))
  files <- list.files()
  files <- files[grepl(".txt|.dat", files, ignore.case = TRUE)]
  for (file in files) {
    setwd(here("raw_data/arson_from_fbi"))
    message(file)
    data <- read_ascii_setup(file, here("setup_files/ucr_arson.sps"))

    data <-
      data %>%
      # ORI NY03200 has multiple years that reported single arsons
      # costing over $700 million
      filter(ori != "NY03200",
             !is.na(ori)) %>%
      mutate_if(is.character, tolower) %>%
      mutate(state_abb              = make_state_abb(state),
             ori                    = toupper(ori),
             year       = fix_years(year)) %>%
      select(-matches("date_of|month_included"),
             -state_name,
             -identifier_code,
             -covered_by_group,
             -county,
             -msa,
             -sequence_number,
             -core_city_indicator) %>%
      # for some reason in 2018 there are a bunch of agencies with duplicate
      # rows
      distinct(ori, .keep_all = TRUE)
    data <- fix_all_negatives(data)
    data <- month_wide_to_long(data)

    # Calculates the number of months missing based on the sum of months
    # which did not submit data (based on the column_2_type variable. Column 2
    # is for actual offenses)
    data <- fix_number_of_months_reported(data, type = "arson")
    data <- get_months_missing_annual(data)
    data <-
      data %>%
      select(-number_of_months_reported,
             -starts_with("column"))

    data <- left_join(data, crosswalk, by = "ori")
    data <- reorder_columns(data, crosswalk, type = "month")

    data$population_group[data$population_group %in% "7b"] <- NA
    # Very incorrect mobile arson data
    if (data$year[1] == 2016) {
      data <-
        data %>%
        filter(ori != "GA06059")
    }
    if (data$year[1] == 1989) {
      data$uninhabited_single_occupancy[data$ori %in% "NC09000" &
                                          data$month %in% "january"] <- NA
      data$uninhabited_total_structures[data$ori %in% "NC09000" &
                                          data$month %in% "january"] <- NA
      data$uninhabited_grand_total[data$ori %in% "NC09000" &
                                     data$month %in% "january"] <- NA
    }
    if (data$year[1] == 1991) {
      data$est_damage_community_public[data$ori %in% "FL02000" &
                                         data$month %in% "december"] <- NA
      data$est_damage_total_structures[data$ori %in% "FL02000" &
                                         data$month %in% "december"] <- NA
      data$est_damage_grand_total[data$ori %in% "FL02000" &
                                    data$month %in% "december"] <- NA
    }
    if (data$year[1] == 2017) {
      data$uninhabited_storage[data$ori %in% "MN06209" &
                                 data$month %in% "april"] <- NA
      data$uninhabited_community_public[data$ori %in% "MN06209" &
                                          data$month %in% "april"] <- NA
      data$uninhabited_total_structures[data$ori %in% "MN06209" &
                                          data$month %in% "april"] <- NA
      data$uninhabited_grand_total[data$ori %in% "MN06209" &
                                     data$month %in% "april"] <- NA
    }

    data$state[data$state %in% c("69", "98", "99")] <- NA

    # Save the data in various formats
    setwd(here("clean_data/arson"))
    save_files(data = data,
               year = data$year[1],
               file_name = "ucr_arson_monthly_",
               save_name = "ucr_arson_monthly_")
    rm(data); gc(); Sys.sleep(3)
  }
}


