source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/make_sps/make_arson_sps.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/crosswalk.R')
crosswalk <- read_merge_crosswalks()

get_arson(crosswalk)
arson_yearly <- get_data_yearly("arson", "1979_2017", "ucr_arson_yearly_", crosswalk)
global_checks(arson_yearly)
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/arson")
save_as_zip("ucr_arson_monthly_1979_2017_", pattern = "month")
save_as_zip("ucr_arson_yearly_1979_2017_", pattern = "year")

get_arson <- function(crosswalk) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/arson_from_fbi")
  files <- list.files()
  files <- files[grepl(".txt|.dat", files, ignore.case = TRUE)]
  for (file in files) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/arson_from_fbi")
    message(file)
    data <- asciiSetupReader::read_ascii_setup(file,
                                               "ucr_arson.sps")

    data <-
      data %>%
      # ORI NY03200 has multiple years that reported single arsons
      # costing over $700 million
      dplyr::filter(ori != "NY03200",
                    !is.na(ori)) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(state_abb              = make_state_abb(state),
                    ori                    = toupper(ori),
                    year       = fix_years(year)) %>%
      dplyr::select(-matches("column|date_of|month_included"),
                    -state_name,
                    -identifier_code,
                    -covered_by_group,
                    -county,
                    -msa,
                    -sequence_number,
                    -core_city_indicator)
    data <- fix_all_negatives(data)
    data <- month_wide_to_long(data)

    data <- dplyr::left_join(data, crosswalk, by = "ori")
    data <- reorder_columns(data, crosswalk, type = "month")

    data$population_group[data$population_group %in% "7b"] <- NA
    # Very incorrect mobile arson data
    if (data$year[1] == 2016) {
      data <-
        data %>%
        dplyr::filter(ori != "GA06059")
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


  # Save the data in various formats
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/arson")
  save_files(data = data,
             year = data$year[1],
             file_name = "ucr_arson_monthly_",
             save_name = "ucr_arson_monthly_")
  rm(data); gc(); Sys.sleep(3)
  }
}


