

get_arson_monthly <- function(crosswalk) {
  files <- list.files(path = "E:/ucr_data_storage/raw_data/arson_from_fbi", full.names = TRUE)
  files <- files[grepl(".txt|.dat", files, ignore.case = TRUE)]
  print(files)
  for (i in 1:length(files)) {
    file <- files[i]
    message(file)
    data <- read_ascii_setup(file, "setup_files/ucr_arson.sps")


    data <-
      data %>%
      mutate_if(is.character, tolower) %>%
      filter(!is.na(year)) %>%
      mutate(state_abb              = make_state_abb(state),
             ori                    = toupper(ori),
             year                   = fix_years(year)) %>%
      select(-matches("date_of|month_included"),
             -state_name,
             -covered_by_group,
             -county,
             -identifier_code,
             -msa) %>%
      distinct(ori, .keep_all = TRUE)

    # Starting in 2017 some year values are 1991 or 1992.
    if (any(data$year >= 2017)) {
      data <-
        data %>%
        filter(year >= 2017)
    }

    data <- fix_all_negatives(data)
    data <- month_wide_to_long(data)

    # Calculates the number of months missing based on the sum of months
    # which did not submit data (based on the column_2_type variable. Column 2
    # is for actual offenses)
    data <- fix_number_of_months_reported(data, type = "arson")
    data <- get_months_missing_annual(data)

    # FBI changed how they measure month values so anything after 2016 is bad.
    if (unique(data$year) > 2016) {
      data$number_of_months_missing <- NA
    }

    data <- left_join(data, crosswalk, by = "ori")
    data <- reorder_columns(data, crosswalk, type = "month")
    data$column_2_pt <- as.character(data$column_2_pt)
    data$column_3_pt <- as.character(data$column_3_pt)
    data$column_4_pt <- as.character(data$column_4_pt)
    data$column_5_pt <- as.character(data$column_5_pt)
    data$column_6_pt <- as.character(data$column_6_pt)
    data$column_7_pt <- as.character(data$column_7_pt)
    data$column_8_pt <- as.character(data$column_8_pt)



    data$state[data$state %in% c("69", "98", "99")] <- NA

    # Save the data as RDS
    save_files(data = data,
               year = data$year[1],
               file_name = "ucr_arson_monthly_",
               save_name = "E:/ucr_data_storage/clean_data/arson/ucr_arson_monthly_")
    print(table(data$year))
    print(table(table(data$ori)))
    rm(data); gc();
  }

  return(final)
}


source('R/utils/global_utils.R')
source('R/make_sps/make_arson_sps.R')
source('R/crosswalk.R')
crosswalk <- read_merge_crosswalks()

arson <- get_arson_monthly(crosswalk)
arson_yearly <- get_data_yearly("arson", "1979_2024", "arson_yearly_", crosswalk)
names(arson_yearly)
table(arson_yearly$year, useNA = "always")
table(arson_yearly$number_of_months_missing, useNA = "always")
table(arson_yearly$number_of_months_missing, arson_yearly$year,
      useNA = "always")
table(arson_yearly$number_of_months_reported, arson_yearly$year,
      useNA = "always")

table(arson_yearly$last_month_reported[arson_yearly$year %in% 2023])
table(arson_yearly$last_month_reported[arson_yearly$year %in% 2024])


summary(arson_yearly$estimated_damage_all_other[arson_yearly$year %in% 2023])
summary(arson_yearly$estimated_damage_all_other[arson_yearly$year %in% 2024])
summary(arson_yearly$cleared_18_grand_total[arson_yearly$year %in% 2023])
summary(arson_yearly$cleared_18_grand_total[arson_yearly$year %in% 2024])
summary(arson_yearly$actual_all_other[arson_yearly$year %in% 2023])
summary(arson_yearly$actual_all_other[arson_yearly$year %in% 2024])


summary(arson_yearly[arson_yearly$year %in% 2024, ])
