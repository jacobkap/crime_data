
temp <- readLines("E:/ucr_data_storage/raw_data/leoka_from_fbi/KCPE69.DAT")
temp <- iconv(temp, "UTF-8", "ASCII", sub = "")
writeLines(temp, "E:/ucr_data_storage/raw_data/leoka_from_fbi/KCPE69.DAT")

temp <- readLines("E:/ucr_data_storage/raw_data/leoka_from_fbi/KCPE72.DAT")
temp <- iconv(temp, "UTF-8", "ASCII", sub = "")
writeLines(temp, "E:/ucr_data_storage/raw_data/leoka_from_fbi/KCPE72.DAT")

get_all_leoka_monthly <- function() {
  files <- list.files(path = "E:/ucr_data_storage/raw_data/leoka_from_fbi", full.names = TRUE)
  files <- files[!grepl("sps", files)]
  print(files)
  for (i in 1:length(files)) {
    file <- files[i]
    data <- asciiSetupReader::read_ascii_setup(
      file,
     "setup_files/ucr_leoka.sps"
    ) %>%
      filter(!ori %in% "0000000") %>%
      distinct(ori, .keep_all = TRUE)
    data <- make_number_of_months_reporting(data)

    data$identifier_code <- as.character(data$identifier_code)

    data <-
      data %>%
      dplyr::filter(!is.na(ori)) %>%
      dplyr::select(
        -officer_rate_per_1000_pop,
        -employee_rate_per_1000_pop,
        -state_name,
        -contains("blank")
      ) %>%
      dplyr::mutate_at(vars(contains("injury_indicator")), remove_special_characters) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(
        year = fix_years(year),
        ori = toupper(ori),
        total_employees_officers = rowSums(.[, grepl(
          "male_employees_officers",
          names(.)
        )]),
        total_employees_civilians = rowSums(.[, grepl(
          "male_employees_civilians",
          names(.)
        )]),
        covered_by = as.character(covered_by),
        shift_data = as.character(shift_data),
        no_male_female_breakdown = as.character(no_male_female_breakdown),
        state_abb = make_state_abb(state)
      ) %>%
      dplyr::rename(total_employees_total = total_employees)

    data <- fix_all_negatives(data)
    data$population[data$population > 200000000] <- NA

    data <- month_wide_to_long(data)
    data <- dplyr::left_join(data, crosswalk, by = "ori")
    data$officers_killed_total <- data$officers_killed_by_felony +
      data$officers_killed_by_accident
    data <- reorder_leoka_columns(data, crosswalk)


    data$population_group[data$population_group %in% c("2c", "7b")] <- NA

    # Save the data in various formats
    save_files(
      data = data,
      year = data$year[1],
      file_name = "leoka_monthly_",
      save_name = "E:/ucr_data_storage/clean_data/LEOKA/leoka_monthly_"
    )
    print(table(data$year))
    rm(data)
    gc()
  }
  return(final)
}


get_all_leoka_yearly <- function() {
  files <- list.files(path = "E:/ucr_data_storage/clean_data/LEOKA", pattern = "monthly_.*.rds$", full.names = TRUE)
  files <- files[!grepl("[0-9]{4}_[0-9]{4}", files)]
  print(files)
  leoka_yearly <- data.frame()
  for (file in files) {
    data <- readRDS(file)
    data$sequence_number <- as.character(data$sequence_number)

    month_cols <- grep("assault|ambush|disturbance|all_oth|arrest|traffic|robbery|burglary|prisoner|susp|derange|riot|total|kill", names(data), value = TRUE)
    month_cols <- month_cols[!grepl("indicator|employee", month_cols)]

    data <- agg_yearly(data, month_cols)
    data <- reorder_leoka_columns(data, crosswalk, type = "year")
    data$msa <- as.character(data$msa)
    leoka_yearly <- dplyr::bind_rows(leoka_yearly, data)
    message(data$year[1])
    rm(data)
    gc()
  }

  leoka_yearly <-
    leoka_yearly %>%
    dplyr::arrange(
      ori,
      desc(year)
    )

  # Save the data in various formats
  save_files(
    data = leoka_yearly,
    year = "1960_2024",
    file_name = "leoka_yearly_",
    save_name = "E:/ucr_data_storage/clean_data/LEOKA/leoka_yearly_"
  )

  return(leoka_yearly)
}



source("R/crosswalk.R")
source("R/make_sps/make_leoka_sps.R")
source("R/utils/global_utils.R")
crosswalk <- read_merge_crosswalks()
# saveRDS(crosswalk, file = ("crosswalk.rds"))
source("R/utils/leoka_utils.R")

leoka <- get_all_leoka_monthly()
leoka_yearly <- get_all_leoka_yearly()
names(leoka)
#global_checks(leoka_yearly)
sapply(leoka_yearly, function(x) max(x, na.rm = TRUE))

table(leoka_yearly$year)
table(leoka_yearly$year,
      leoka_yearly$number_of_months_reported)

summary(leoka_yearly$one_man_vehicle_day_shift[leoka_yearly$year %in% 2023])
summary(leoka_yearly$one_man_vehicle_day_shift[leoka_yearly$year %in% 2024])
summary(leoka_yearly$traffic_assaults_cleared[leoka_yearly$year %in% 2023])
summary(leoka_yearly$traffic_assaults_cleared[leoka_yearly$year %in% 2024])
summary(leoka_yearly$male_employees_officers[leoka_yearly$year %in% 2023])
summary(leoka_yearly$male_employees_officers[leoka_yearly$year %in% 2024])
summary(leoka_yearly$female_employees_officers[leoka_yearly$year %in% 2023])
summary(leoka_yearly$female_employees_officers[leoka_yearly$year %in% 2024])

summary(leoka_yearly$officers_killed_total[leoka_yearly$year %in% 2023])
summary(leoka_yearly$officers_killed_total[leoka_yearly$year %in% 2024])
summary(leoka_yearly$assaults_no_injury_total[leoka_yearly$year %in% 2023])
summary(leoka_yearly$assaults_no_injury_total[leoka_yearly$year %in% 2024])

table(leoka_yearly$year, leoka_yearly$number_of_months_reported)
