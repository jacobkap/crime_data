source('C:/Users/user/Dropbox/R_project/crime_data/R/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/offenses_known_utils.R')
crosswalk <- read_merge_crosswalks()

get_all_return_a_monthly()
offenses_known_yearly <- get_all_return_a_yearly()
global_checks(offenses_known_yearly)
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
save_as_zip("ucr_offenses_known_monthly_1960_2017_", pattern = "month")
save_as_zip("ucr_offenses_known_yearly_1960_2017_", pattern = "year")

get_all_return_a_monthly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/offenses_known_from_fbi")
  files <- list.files()
  files <- files[!grepl("sps", files)]

  for (file in files) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/offenses_known_from_fbi")
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
                    -population_2_county,
                    -population_2_msa,
                    -population_3_county,
                    -population_3_msa,
                    -population_source,
                    -sequence_number,
                    -agency_state_name,
                    -covered_by_population_group,
                    -contains("blank"),
                    -contains("mailing"),
                    -population_group_in_previous_year) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(year       = fix_years(year),
                    population =  rowSums(.[, grepl("population_[1-3]",
                                                    names(.))]),
                    ori        = toupper(ori),
                    state_abb  = make_state_abb(state),
                    covered_by_ori = as.character(covered_by_ori)) %>%
      dplyr::select(-population_1,
                    -population_2,
                    -population_3)

    data <- fix_all_negatives(data)
    data <- fix_outliers(data)
    data <- month_wide_to_long(data)
    data <- make_agg_assault(data)
    data$juvenile_age[data$juvenile_age == 0] <- NA

    data <- dplyr::left_join(data, crosswalk)
    data <- reorder_offenses_known_columns(data, crosswalk)

    # Save the data in various formats
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    save_files(data = data,
               year = data$year[1],
               file_name = "offenses_known_monthly_",
               save_name = "offenses_known_monthly_")
    rm(data); gc(); Sys.sleep(3)

  }
}

get_all_return_a_yearly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
  files <- list.files(pattern = "monthly_.*.rda$")

  offenses_known_yearly <- data.frame()
  for (file in files) {
    load(file)
    file_name <- gsub(".rda", "", file)
    assign("data", get(file_name))
    do.call(rm, list(file_name))
    month_cols <- grep("act|tot_clr|clr_18|unfound|officer", names(data), value = TRUE)

    data$covered_by_ori <- as.character(data$covered_by_ori)

    data <- agg_yearly(data, month_cols)
    data <- reorder_offenses_known_columns(data, crosswalk, type = "year")
    offenses_known_yearly <- dplyr::bind_rows(offenses_known_yearly, data)
    rm(data); gc(); Sys.sleep(3)
  }

  offenses_known_yearly <-
    offenses_known_yearly %>%
    dplyr::arrange(ori,
                   desc(year))

  # Save the data in various formats
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
  save_files(data = offenses_known_yearly,
             year = "1960_2017",
             file_name = "offenses_known_yearly_",
             save_name = "offenses_known_yearly_")

  return(offenses_known_yearly)
}

