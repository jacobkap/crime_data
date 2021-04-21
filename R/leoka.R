source(here::here('R/crosswalk.R'))
source(here::here('R/make_sps/make_leoka_sps.R'))
source(here::here('R/utils/global_utils.R'))
crosswalk <- read_merge_crosswalks()
source(here::here('R/utils/leoka_utils.R'))

#get_all_leoka_monthly()
leoka_yearly <- get_all_leoka_yearly()
global_checks(leoka_yearly)
sapply(leoka_yearly, function(x) max(x, na.rm = TRUE))

summary(leoka_yearly$one_man_veh_day_shift[leoka_yearly$year %in% 2018])
summary(leoka_yearly$one_man_veh_day_shift[leoka_yearly$year %in% 2019])
summary(leoka_yearly$traffic_assaults_cleared[leoka_yearly$year %in% 2018])
summary(leoka_yearly$traffic_assaults_cleared[leoka_yearly$year %in% 2019])
summary(leoka_yearly$male_employees_officers[leoka_yearly$year %in% 2018])
summary(leoka_yearly$male_employees_officers[leoka_yearly$year %in% 2019])
summary(leoka_yearly$officers_killed_total[leoka_yearly$year %in% 2018])
summary(leoka_yearly$officers_killed_total[leoka_yearly$year %in% 2019])
summary(leoka_yearly$assaults_no_injury_total[leoka_yearly$year %in% 2018])
summary(leoka_yearly$assaults_no_injury_total[leoka_yearly$year %in% 2019])

table(leoka_yearly$year, leoka_yearly$number_of_months_reported)

setwd(here::here("clean_data/LEOKA"))
save_as_zip("ucr_leoka_monthly_1960_2019_", pattern = "month")
save_as_zip("ucr_leoka_yearly_1960_2019_",  pattern = "year")

get_all_leoka_monthly <- function() {
  setwd(here::here("raw_data/leoka_from_fbi"))
  files <- list.files()
  files <- files[!grepl("sps", files)]
  for (file in files) {
    setwd(here::here("raw_data/leoka_from_fbi"))
    data <- asciiSetupReader::spss_ascii_reader(file,
                                                here::here("setup_files/ucr_leoka.sps"))
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
      dplyr::mutate_at(vars(contains("injury_indicator")), remove_special_characters) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(year = fix_years(year),
                    ori  = toupper(ori),
                    total_employees_officers  = rowSums(.[, grepl("male_employees_officers",
                                                                  names(.))]),
                    total_employees_civilians = rowSums(.[, grepl("male_employees_civilians",
                                                                  names(.))]),
                    covered_by               = as.character(covered_by),
                    shift_data               = as.character(shift_data),
                    no_male_female_breakdown = as.character(no_male_female_breakdown),
                    state_abb = make_state_abb(state)) %>%
      dplyr::rename(total_employees_total    = total_employees)

    data <- fix_all_negatives(data)
    data$population[data$population > 200000000] <- NA

    data <- fix_outliers(data)
    data <- month_wide_to_long(data)
    data <- dplyr::left_join(data, crosswalk, by = "ori")
    data$officers_killed_total <- data$officers_killed_by_felony +
      data$officers_killed_by_accident
    data <- reorder_leoka_columns(data, crosswalk)

    data$state[data$state %in% c("69", "98", "99")] <- NA
    data$population_group[data$population_group %in% c("2c", "7b")] <- NA

    # Save the data in various formats
    setwd(here::here("clean_data/LEOKA"))
    save_files(data = data,
               year = data$year[1],
               file_name = "leoka_monthly_",
               save_name = "leoka_monthly_",
               rda_and_stata_only = FALSE)
    message(unique(data$year))
    rm(data); gc(); Sys.sleep(3)
  }
}


get_all_leoka_yearly <- function() {
  setwd(here::here("clean_data/LEOKA"))
  files <- list.files(pattern = "monthly_.*.rda$")

  leoka_yearly <- data.frame()
  for (file in files) {
    load(file)
    file_name <- gsub(".rda", "", file)
    assign("data", get(file_name))
    do.call(rm, list(file_name))

    month_cols <- grep("assault|ambush|disturbance|all_oth|arrest|traffic|robbery|burglary|prisoner|susp|derange|riot|total|kill", names(data), value = TRUE)
    month_cols <- month_cols[!grepl("indicator|employee", month_cols)]

    data <- agg_yearly(data, month_cols)
    data <- reorder_leoka_columns(data, crosswalk, type = "year")
    data$msa <- as.character(data$msa)
    leoka_yearly <- dplyr::bind_rows(leoka_yearly, data)
    message(data$year[1]); rm(data); gc(); Sys.sleep(3)
  }

  leoka_yearly <-
    leoka_yearly %>%
    dplyr::arrange(ori,
                   desc(year))

  # Save the data in various formats
  setwd(here::here("clean_data/LEOKA"))
  save_files(data = leoka_yearly,
             year = "1960_2019",
             file_name = "leoka_yearly_",
             save_name = "leoka_yearly_",
             rda_and_stata_only = FALSE)

  return(leoka_yearly)
}


