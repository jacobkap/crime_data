
temp <- readLines("E:/ucr_data_storage/raw_data/offenses_known_from_fbi/KCRETA66.DAT")
temp <- iconv(temp, "UTF-8", "ASCII", sub = "")
writeLines(temp, "E:/ucr_data_storage/raw_data/offenses_known_from_fbi/KCRETA66.DAT")

get_all_return_a_monthly <- function(crosswalk) {
  files <- list.files(path = "E:/ucr_data_storage/raw_data/offenses_known_from_fbi",
                      full.names = TRUE)
  print(files)

  for (i in 1:length(files)) {
    file <- files[i]
    data <- read_ascii_setup(file, "setup_files/ucr_return_a.sps")

    data <-
      data %>%
      filter(!is.na(ori)) %>%
      dplyr::select(
        -contains("blank"),
        -identifier_code,
        -sequence_number,
        -agency_state_name
      ) %>%
      mutate_at(
        vars(tidyselect::matches("card")),
        remove_special_characters
      ) %>%
      mutate_at(
        vars(tidyselect::matches("mail")),
        crime_remove_special_characters
      ) %>%
      mutate_if(is.character, tolower) %>%
      mutate(
        year = fix_years(year),
        population = population_1 + population_2 + population_3,
        ori = toupper(ori),
        state_abb = make_state_abb(state),
        covered_by_ori = as.character(covered_by_ori)
      ) %>%
      # for some reason in 2019 there are a bunch of agencies with duplicate
      # rows
      distinct(ori, .keep_all = TRUE)

    data$covered_by_population_group <- as.character(data$covered_by_population_group)
    data <- fix_all_negatives(data)
    data <- month_wide_to_long(data)
    data <- make_agg_assault(data)


    data <- make_index_crimes(data)
    data$juvenile_age[data$juvenile_age == 0] <- NA

    data <- fix_number_of_months_reported(data)
    data <- get_months_missing_annual(data)

    # FBI changed how they measure month values so anything after 2016 is bad.
    if (unique(data$year) > 2016) {
      data$number_of_months_missing <- NA
    }

    data <- left_join(data, crosswalk, by = "ori")
    data <- reorder_columns(data, crosswalk)
    data$population_group[data$population_group %in% "7b"] <- NA

    data$state[data$state %in% c("69", "98", "99")] <- NA

    # Save the data in various formats
    save_files(
      data = data,
      year = data$year[1],
      file_name = "offenses_known_monthly_",
      save_name = "E:/ucr_data_storage/clean_data/offenses_known/offenses_known_monthly_"
    )
    print(table(data$year))
    rm(data)
    gc()
  }
}


source("R/crosswalk.R")
source("R/utils/global_utils.R")
source("R/utils/offenses_known_utils.R")
source("R/make_sps/make_offenses_known_sps.R")
crosswalk <- read_merge_crosswalks()

offenses_known <- get_all_return_a_monthly(crosswalk)
offenses_known_yearly <- get_data_yearly(
  "offenses_known",
  "1960_2024",
  "offenses_known_yearly_",
  crosswalk
)
table(offenses_known_yearly$year)
sort(unique(offenses_known_yearly$year))
global_checks(offenses_known_yearly)
table(offenses_known_yearly$number_of_months_missing == offenses_known_yearly$arson_number_of_months_missing)

summary(offenses_known_yearly$actual_murder[offenses_known_yearly$year %in% 2023])
summary(offenses_known_yearly$actual_murder[offenses_known_yearly$year %in% 2024])
summary(offenses_known_yearly$actual_robbery_total[offenses_known_yearly$year %in% 2023])
summary(offenses_known_yearly$actual_robbery_total[offenses_known_yearly$year %in% 2024])
summary(offenses_known_yearly$officers_assaulted[offenses_known_yearly$year %in% 2023])
summary(offenses_known_yearly$officers_assaulted[offenses_known_yearly$year %in% 2024])
summary(offenses_known_yearly$cleared_18_burg_total[offenses_known_yearly$year %in% 2023])
summary(offenses_known_yearly$cleared_18_burg_total[offenses_known_yearly$year %in% 2024])
summary(offenses_known_yearly$actual_murder[offenses_known_yearly$year %in% 2023])
summary(offenses_known_yearly$actual_murder[offenses_known_yearly$year %in% 2024])

# Data for Jeff Asher
# offenses_known_yearly_1960_2023 <- readRDS("E:/ucr_data_storage/clean_data/offenses_known/offenses_known_yearly_1960_2023.rds")
# offenses_known_monthly_2020 <- readRDS("E:/ucr_data_storage/clean_data/offenses_known/offenses_known_monthly_2020.rds")
# offenses_known_monthly_2021 <- readRDS("E:/ucr_data_storage/clean_data/offenses_known/offenses_known_monthly_2021.rds")
# offenses_known_monthly_2022 <- readRDS("E:/ucr_data_storage/clean_data/offenses_known/offenses_known_monthly_2022.rds")
# offenses_known_monthly_2023 <- readRDS("E:/ucr_data_storage/clean_data/offenses_known/offenses_known_monthly_2023.rds")
# table(offenses_known_yearly_1960_2023$year %in% 2020:2023)
# table(offenses_known_yearly_1960_2023$year %in% 1960:1999)
# write_csv(offenses_known_yearly_1960_2023 %>% filter(year %in% 2000:2023), "E:/ucr_data_storage/clean_data/offenses_known_yearly_2000_2023.csv")
# write_csv(offenses_known_yearly_1960_2023 %>% filter(year %in% 1960:1999), "E:/ucr_data_storage/clean_data/offenses_known_yearly_1960_1999.csv")
# write_csv(offenses_known_monthly_2020, "E:/ucr_data_storage/clean_data/offenses_known_monthly_2020.csv")
# write_csv(offenses_known_monthly_2021, "E:/ucr_data_storage/clean_data/offenses_known_monthly_2021.csv")
# write_csv(offenses_known_monthly_2022, "E:/ucr_data_storage/clean_data/offenses_known_monthly_2022.csv")
# write_csv(offenses_known_monthly_2023, "E:/ucr_data_storage/clean_data/offenses_known_monthly_2023.csv")
