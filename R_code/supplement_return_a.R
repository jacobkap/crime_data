source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/supplement_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
crosswalk   <- read_merge_crosswalks()
cross_names <- names(crosswalk)
cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]
# unzip_files()
save_supplement_data_monthly()
#
ucr_property_stolen_recovered_yearly <- get_supplement_yearly()
summary(ucr_property_stolen_recovered_yearly)
table(ucr_property_stolen_recovered_yearly$state)
table(ucr_property_stolen_recovered_yearly$division)
table(ucr_property_stolen_recovered_yearly$group)
table(ucr_property_stolen_recovered_yearly$status)
save_files(data = ucr_property_stolen_recovered_yearly,
           year = "1960_2016",
           file_name = "ucr_property_stolen_recovered_yearly_",
           save_name = "ucr_property_stolen_recovered_yearly_")
save_as_zip("ucr_property_stolen_recovered_yearly_1960_2016_", "yearly")
save_as_zip("ucr_property_stolen_recovered_monthly_1960_2016_", "monthly")

save_supplement_data_monthly <- function() {

  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/supplement")
  files <- list.files(pattern = ".DAT|.TXT|.txt")
  for (file in files) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/supplement")
    data <- suppressWarnings(asciiSetupReader::spss_ascii_reader(dataset_name = file,
                                                                 sps_name = "supplement_to_return_a.sps",
                                                                 coerce_numeric = FALSE))
    # The last row is blank, this removes it
    data <- data[!is.na(data$ori), ]

    if (substr(data$year[1], 1, 1) %in% c(0:2)) {
      data$year <- paste0("20", data$year)
    } else {
      data$year <- paste0("19", data$year)
    }

    data <-
      data %>%
      dplyr::mutate_all(tolower) %>%
      dplyr::mutate(year       = parse_number(year),
                    population = parse_number(population),
                    ori        = toupper(ori),
                    state      = stringr::str_replace_all(state,
                                                          supplement_states),
                    group      = stringr::str_replace_all(group,
                                                          supplement_group),
                    division   = stringr::str_replace_all(division,
                                                          supplement_division))



    data <- supplement_month_wide_to_long(data)

    status_cols          <- grep("status",
                                 names(data),
                                 value = TRUE)
    offenses_cols        <- grep("offenses|^auto",
                                 names(data),
                                 value = TRUE)
    data_cols            <- grep("offenses|^auto|^value",
                                 names(data),
                                 value = TRUE)

    data <-
      data %>%
      dplyr::mutate_at(vars(status_cols), fix_status_supplement) %>%
      dplyr::mutate_at(vars(data_cols), fix_negatives_supplement) %>%
      dplyr::mutate_at(vars(offenses_cols), supplement_remove_missing) %>%
      dplyr::select(-agency_state_name,
                    -identifier_code) %>%
      dplyr::mutate(offenses_robbery_total =
                      rowSums(select_(.,
                                      "offenses_robbery_highway",
                                      "offenses_robbery_house",
                                      "offenses_robbery_gas_station",
                                      "offenses_robbery_chain_store",
                                      "offenses_robbery_residence",
                                      "offenses_robbery_bank",
                                      "offenses_robbery_misc"),
                              na.rm = TRUE),
                    offenses_burg_total =
                      rowSums(select_(.,
                                      "offenses_burg_resident_night",
                                      "offenses_burg_resident_day",
                                      "offenses_burg_resident_unk",
                                      "offenses_burg_nonresident_night",
                                      "offenses_burg_nonresident_day",
                                      "offenses_burg_nonresident_unk"),
                              na.rm = TRUE),
                    offenses_theft_total =
                      rowSums(select_(.,
                                      "offenses_theft_under_50",
                                      "offenses_theft_50_to_200",
                                      "offenses_theft_over_200"),
                              na.rm = TRUE)) %>%
      dplyr::left_join(crosswalk) %>%
      dplyr::select(ori,
                    ori9,
                    state,
                    agency_name,
                    year,
                    month,
                    date,
                    population,
                    group,
                    division,
                    msa,
                    status,
                    fbi_batch_number,
                    cross_names,
                    one_of(offense_col_order),
                    one_of(value_col_order)) %>%
      dplyr::mutate(month = factor(month,
                                   levels = tolower(month.name))) %>%
      dplyr::arrange(ori,
                     month) %>%
      dplyr::mutate(month = as.character(month))

    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/supplement_return_a")
    save_files(data = data,
               year = data$year[1],
               file_name = "ucr_property_stolen_recovered_monthly_",
               save_name = "ucr_property_stolen_recovered_monthly_")
    message(file)

  }
}

get_supplement_yearly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/supplement_return_a")
  files <- list.files(pattern = "monthly.*.rda")
  supplement_yearly <- data.frame(stringsAsFactors = FALSE)
  for (file in files) {
    load(file)
    file_name <- gsub(".rda", "", file)
    assign("data", get(file_name))
    rm(list = file_name)

 #   message(unique(data$year))
#    num_cols <- grep("^auto", names(data))
#    print(summary(data[, num_cols]))
    #  print(unique(data$group))
    #   Sys.sleep(10)

    #  offenses_theft_total  1983
    agency_desc_cols <- c(
      "ori9",
      "state",
      "agency_name",
      "year",
      "population",
      "group",
      "division",
      "msa",
      "status",
      "fbi_batch_number",
      "fips_state_code",
      "fips_county_code",
      "fips_state_county_code",
      "fips_place_code",
      "fips_state_place_code",
      "agency_type",
      "agency_subtype_1",
      "agency_subtype_2"
    )

    temp <-
      data %>%
      dplyr::select(agency_desc_cols,
                    "ori")
    temp <- temp[!duplicated(temp$ori), ]

    data <-
      data %>%
      dplyr::select(-agency_desc_cols,
                    -month,
                    -date) %>%
      dplyr::group_by(ori) %>%
      dplyr::summarize_all(sum, na.rm = TRUE) %>%
      dplyr::left_join(temp) %>%
      dplyr::select(ori,
                    ori9,
                    state,
                    agency_name,
                    year,
                    population,
                    group,
                    division,
                    msa,
                    status,
                    fbi_batch_number,
                    cross_names,
                    one_of(offense_col_order),
                    one_of(value_col_order))



    supplement_yearly <- bind_rows(supplement_yearly, data)
    message(data$year[1]); rm(data); gc(); Sys.sleep(1)
  }
  supplement_yearly <-
    supplement_yearly %>%
    dplyr::arrange(ori,
                   desc(year))
  return(supplement_yearly)
}


