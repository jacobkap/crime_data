source(here::here('R/utils/global_utils.R'))
source(here::here('R/utils/supplement_utils.R'))
source(here::here('R/crosswalk.R'))
crosswalk   <- read_merge_crosswalks()
cross_names <- names(crosswalk)
cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]

#save_supplement_data_monthly()
ucr_property_stolen_recovered_yearly <- get_supplement_yearly()


table(ucr_property_stolen_recovered_yearly$state)
table(ucr_property_stolen_recovered_yearly$country_division)
table(ucr_property_stolen_recovered_yearly$population_group)
table(ucr_property_stolen_recovered_yearly$year)
summary(ucr_property_stolen_recovered_yearly$population)
table(ucr_property_stolen_recovered_yearly$number_of_months_reported)
table(ucr_property_stolen_recovered_yearly$number_of_months_reported,
      ucr_property_stolen_recovered_yearly$year)
summary(ucr_property_stolen_recovered_yearly)
head(ucr_property_stolen_recovered_yearly$ori)
head(ucr_property_stolen_recovered_yearly$ori9)

save_files(data = ucr_property_stolen_recovered_yearly,
           year = "1960_2018",
           file_name = "ucr_property_stolen_recovered_yearly_",
           save_name = "ucr_property_stolen_recovered_yearly_")
save_as_zip("ucr_property_stolen_recovered_yearly_1960_2018_", "yearly")
save_as_zip("ucr_property_stolen_recovered_monthly_1960_2018_", "monthly")


save_supplement_data_monthly <- function() {

  setwd(here::here("raw_data/supplement_to_offenses_known_from_fbi"))
  files <- list.files(pattern = ".DAT|.TXT|.txt")
  for (file in files) {
    setwd(here::here("raw_data/supplement_to_offenses_known_from_fbi"))
    data <- read_ascii_setup(data       = file,
                             setup_file = here::here("setup_files/supplement_to_return_a.sps"))
    # The last row is blank, this removes it
    data <- data[!is.na(data$ori), ]



    data <-
      data %>%
      dplyr::mutate_all(tolower) %>%
      dplyr::mutate(year       = fix_years(year))


    data <- make_num_months_reported(data)
    data <- month_wide_to_long(data)

    data <-
      data %>%
      dplyr::mutate_at(vars(matches("offenses|^auto|^value")), fix_negatives) %>%
      dplyr::mutate_at(vars(matches("offenses|^auto")), supplement_remove_missing) %>%
      dplyr::select(-agency_state_name,
                    -identifier_code) %>%
      dplyr::mutate(offenses_robbery_total =
                      rowSums(select(.,
                                     "offenses_robbery_highway",
                                     "offenses_robbery_house",
                                     "offenses_robbery_gas_station",
                                     "offenses_robbery_chain_store",
                                     "offenses_robbery_residence",
                                     "offenses_robbery_bank",
                                     "offenses_robbery_misc"),
                              na.rm = TRUE),
                    offenses_burg_total =
                      rowSums(select(.,
                                     "offenses_burg_resident_night",
                                     "offenses_burg_resident_day",
                                     "offenses_burg_resident_unk",
                                     "offenses_burg_nonresident_night",
                                     "offenses_burg_nonresident_day",
                                     "offenses_burg_nonresident_unk"),
                              na.rm = TRUE),
                    offenses_theft_total =
                      rowSums(select(.,
                                     "offenses_theft_under_50",
                                     "offenses_theft_50_to_200",
                                     "offenses_theft_over_200"),
                              na.rm = TRUE),
                    population = as.numeric(population),
                    ori = toupper(ori)) %>%
      dplyr::left_join(crosswalk, by = "ori") %>%
      dplyr::select(ori,
                    ori9,
                    number_of_months_reported,
                    status,
                    state,
                    agency_name,
                    year,
                    month,
                    date,
                    population,
                    population_group,
                    country_division,
                    msa,
                    fbi_batch_number,
                    cross_names,
                    one_of(offense_col_order),
                    one_of(value_col_order)) %>%
      dplyr::mutate(month = factor(month,
                                   levels = tolower(month.name))) %>%
      dplyr::arrange(ori,
                     month) %>%
      dplyr::mutate(month = as.character(month)) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(ori  = toupper(ori),
                    ori9 = toupper(ori9)) %>%
      dplyr::rename(report_indicator = status)

    data$state[data$state %in% c("69", "98", "99")] <- NA

    setwd(here::here("clean_data/supplement_return_a"))
    save_files(data = data,
               year = data$year[1],
               file_name = "ucr_property_stolen_recovered_monthly_",
               save_name = "ucr_property_stolen_recovered_monthly_")
    message(file)
    rm(data); gc(); Sys.sleep(3)

  }
}

get_supplement_yearly <- function() {
  setwd(here::here("clean_data/supplement_return_a"))
  files <- list.files(pattern = "monthly.*.rda$")
  supplement_yearly <- data.frame(stringsAsFactors = FALSE)
  for (file in files) {
    load(file)
    file_name <- gsub(".rda", "", file)
    assign("data", get(file_name))
    rm(list = file_name)


    temp <-
      data %>%
      dplyr::select(agency_desc_cols,
                    "ori")
    temp <- temp[!duplicated(temp$ori), ]

    supplement_yearly <-
      data %>%
      dplyr::select(-agency_desc_cols,
                    -month,
                    -date) %>%
      dplyr::group_by(ori) %>%
      dplyr::summarize_all(sum, na.rm = TRUE) %>%
      dplyr::left_join(temp, by = "ori") %>%
      dplyr::select(ori,
                    ori9,
                    number_of_months_reported,
                    state,
                    agency_name,
                    year,
                    population,
                    population_group,
                    country_division,
                    msa,
                    fbi_batch_number,
                    cross_names,
                    one_of(offense_col_order),
                    one_of(value_col_order)) %>%
      dplyr::bind_rows(supplement_yearly) %>%
      dplyr::arrange(ori,
                     desc(year))

    message(data$year[1]); rm(data); gc(); Sys.sleep(1)
  }
  return(supplement_yearly)
}



