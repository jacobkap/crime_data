source('C:/Users/user/Dropbox/R_project/crime_data/R/crosswalk.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/make_sps/make_leoka_sps.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/global_utils.R')
crosswalk <- read_merge_crosswalks()
source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/leoka_utils.R')

get_all_leoka_monthly()
leoka_yearly <- get_all_leoka_yearly()

get_all_leoka_monthly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/leoka_from_fbi")
  files <- list.files()
  files <- files[!grepl("sps", files)]
  for (file in files) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/leoka_from_fbi")
    data <- asciiSetupReader::spss_ascii_reader(file,
                                                "ucr_leoka.sps")
    data <- make_number_of_months_reporting(data)


    data <-
      data %>%
      dplyr::filter(!is.na(ori)) %>%
      dplyr::select(-officer_rate_per_1000_pop,
                    -employee_rate_per_1000_pop,
                    -identifier_code,
                    -month_included,
                    -state_name,
                    -sequence_number,
                    -contains("blank")) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(year = fix_years(year),
                    ori  = toupper(ori),
                    total_officers =  rowSums(.[, grepl("male_employees_officers",
                                                        names(.))]),
                    total_civilians =  rowSums(.[, grepl("male_employees_civilians",
                                                         names(.))]))

    data <-
      month_wide_to_long(data) %>%
      dplyr::mutate(month = factor(month,
                                   levels = tolower(month.name))) %>%
      dplyr::arrange(ori,
                     month) %>%
      dplyr::mutate(month = as.character(month))

    data$population[data$population > 20000000] <- NA
    if (data$year[1] == 1979) {
      data$aug_officers_killed_felony[data$ori == "NJ01210"] <- NA
    }
    if (data$year[1] == 1978) {
      data$jul_officers_killed_accident[data$ori == "PAPPD00"] <- NA
    }
    if (data$year[1] == 1990) {
      data$mar_officers_killed_accident[data$ori == "ME010SP"] <- NA
    }

    data <- dplyr::left_join(data, crosswalk)
    data <- reorder_leoka_columns(data, crosswalk)

    # Save the data in various formats
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
    save_files(data = data,
               year = data$year[1],
               file_name = "leoka_monthly_",
               save_name = "leoka_monthly_")
    rm(data); gc(); Sys.sleep(3)

  }
}


get_all_leoka_yearly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
  files <- list.files(pattern = "monthly_.*.rda$")

  leoka_yearly <- data.frame()
  for (file in files) {
    load(file)
    file_name <- gsub(".rda", "", file)
    assign("temp", get(file_name))
    do.call(rm, list(file_name))
    month_cols <- grep("assault|ambush|disturbance|all_oth|arrest|traffic|robbery|burglary|prisoner|susp|derange|riot|total", names(data), value = TRUE)
    month_cols <- month_cols[!grepl("indicator|officer|civilian|employee", month_cols)]

    temp <- agg_leoka_yearly(temp, month_cols)
    temp <- reorder_leoka_columns(temp, crosswalk, type = "year")
    leoka_yearly <- dplyr::bind_rows(leoka_yearly, temp)
    rm(temp); gc(); Sys.sleep(3)
  }

  leoka_yearly <-
    leoka_yearly %>%
    dplyr::arrange(ori,
                   desc(year))

  return(leoka_yearly)
}


