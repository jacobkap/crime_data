source('C:/Users/user/Dropbox/R_project/crime_data/R/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/offenses_known_utils.R')
crosswalk <- read_merge_crosswalks()

get_all_return_a_monthly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/return_a_from_fbi")
  files <- list.files()
  files <- files[!grepl("sps", files)]

  for (file in files) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/return_a_from_fbi")
    data <- asciiSetupReader::spss_ascii_reader(file,
                                                "ucr_return_a.sps")

    data <-
      data %>%
      dplyr::filter(!is.na(ori)) %>%
      dplyr::select(-identifier_code,
                    -population_source,
                    -contains("last_population"),
                    -contains("under50"),
                    -population_1_county,
                    -population_1_msa,
                    -population_source,
                    -sequence_number,
                    -agency_state_name,
                    -contains("blank"),
                    -contains("mailing"),
                    -population_group_in_previous_year) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(year       = fix_years(year),
                    population =  rowSums(.[, grepl("population_[1-3]",
                                                    names(.))]),
                    ori        = toupper(ori),
                    state_abb  = make_state_abb(state)) %>%
      dplyr::select(-population_1,
                    -population_2,
                    -population_3)

    data <- fix_all_negatives(data)
    data <- fix_outliers(data)
    data <- month_wide_to_long(data)
    data$juvenile_age[data$juvenile_age == 0] <- NA

    data <- dplyr::left_join(data, crosswalk)
    data <- reorder_return_a_columns(data, crosswalk)

    # Save the data in various formats
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/return_a")
    save_files(data = data,
               year = data$year[1],
               file_name = "return_a_monthly_",
               save_name = "return_a_monthly_")
    rm(data); gc(); Sys.sleep(3)

  }
}

get_all_return_a_yearly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/return_a")
  files <- list.files(pattern = "monthly_.*.rda$")

  return_a_yearly <- data.frame()
  for (file in files) {
    load(file)
    file_name <- gsub(".rda", "", file)
    assign("temp", get(file_name))
    do.call(rm, list(file_name))
    month_cols <- grep("act|tot_clr|clr_18|unfound|officer", names(data), value = TRUE)

    temp <- agg_yearly(temp, month_cols)
    temp <- reorder_return_a_columns(temp, crosswalk, type = "year")
    return_a_yearly <- dplyr::bind_rows(return_a_yearly, temp)
    rm(temp); gc(); Sys.sleep(3)
  }

  return_a_yearly <-
    return_a_yearly %>%
    dplyr::arrange(ori,
                   desc(year))

  return(return_a_yearly)
}

