save_supplement_data_monthly <- function() {
  files <- list.files(path = "D:/ucr_data_storage/raw_data/supplement_to_offenses_known_from_fbi",
                      pattern = ".DAT|.TXT|.txt",
                      full.names = TRUE)
  print(files)
  for (i in 1:length(files)) {
    file <- files[i]
    data <- read_ascii_setup(
      data = file,
      setup_file = "setup_files/supplement_to_return_a.sps"
    )
    # The last row is blank, this removes it
    data <- data[!is.na(data$ori), ]


    data <-
      data %>%
      dplyr::mutate_all(tolower) %>%
      dplyr::mutate(year = fix_years(year)) %>%
      distinct(ori, .keep_all = TRUE)


    data <- make_num_months_reported(data)
    data <- month_wide_to_long(data)

    data <-
      data %>%
      dplyr::mutate_at(vars(matches("offenses|^auto|^value")), fix_negatives) %>%
      dplyr::select(
        -agency_state_name,
        -identifier_code
      )

    data$offenses_robbery_total <-
      rowSums(
        data[, c(
          "offenses_robbery_highway",
          "offenses_robbery_house",
          "offenses_robbery_gas_station",
          "offenses_robbery_chain_store",
          "offenses_robbery_residence",
          "offenses_robbery_bank",
          "offenses_robbery_miscellaneous"
        )],
        na.rm = TRUE
      )
    data$offenses_burglary_total <-
      rowSums(
        data[, c(
          "offenses_burglary_resident_night",
          "offenses_burglary_resident_day",
          "offenses_burglary_resident_unknown",
          "offenses_burglary_nonresident_night",
          "offenses_burglary_nonresident_day",
          "offenses_burglary_nonresident_unknown"
        )],
        na.rm = TRUE
      )
    data$offenses_theft_total <-
      rowSums(
        data[, c(
          "offenses_theft_under_50",
          "offenses_theft_50_to_200",
          "offenses_theft_over_200"
        )],
        na.rm = TRUE
      )

    data <-
      data %>%
      mutate(
        population = as.numeric(population),
        ori = toupper(ori)
      ) %>%
      dplyr::left_join(crosswalk, by = "ori") %>%
      dplyr::select(
        ori,
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
        all_of(offense_col_order),
        all_of(value_col_order),
        everything()
      ) %>%
      dplyr::mutate(month = factor(month,
        levels = tolower(month.name)
      )) %>%
      dplyr::arrange(
        ori,
        month
      ) %>%
      dplyr::mutate(month = as.character(month)) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(
        ori = toupper(ori),
        ori9 = toupper(ori9)
      ) %>%
      dplyr::rename(report_indicator = status)

    data$state[data$state %in% c("69", "98", "99")] <- NA
    data$population_group[data$population_group %in% "2c"] <- NA


    save_files(
      data = data,
      year = data$year[1],
      file_name = "property_stolen_and_recovered_monthly_",
      save_name = "D:/ucr_data_storage/clean_data/supplement_return_a/property_stolen_and_recovered_monthly_"
    )


    message(file)
    print(table(data$year))
    print(table(table(data$ori)))
    rm(data)
    gc()
  }
}


get_supplement_yearly <- function() {
  files <- list.files(path = "D:/ucr_data_storage/clean_data/supplement_return_a",
                      pattern = "monthly.*.rds$",
                      full.names = TRUE)
  files <- files[!grepl("monthly_1960_", files)]
  print(files)
  supplement_yearly <- data.frame(stringsAsFactors = FALSE)
  for (file in files) {
    data <- readRDS(file)

    temp <-
      data %>%
      dplyr::select(
        agency_desc_cols,
        "ori"
      )
    temp <- temp[!duplicated(temp$ori), ]

    supplement_yearly <-
      data %>%
      dplyr::select(
        -agency_desc_cols,
        -month,
        -date
      ) %>%
      dplyr::group_by(ori) %>%
      dplyr::summarize_all(sum, na.rm = TRUE) %>%
      dplyr::left_join(temp, by = "ori") %>%
      dplyr::select(
        ori,
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
        one_of(value_col_order)
      ) %>%
      dplyr::bind_rows(supplement_yearly) %>%
      dplyr::arrange(
        ori,
        desc(year)
      )

    message(unique(data$year))

    rm(data)
    gc()
  }
  return(supplement_yearly)
}


source("R/utils/global_utils.R")
source("R/utils/supplement_utils.R")
source("R/crosswalk.R")
crosswalk <- read_merge_crosswalks()
cross_names <- names(crosswalk)
cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]

property_stolen <- save_supplement_data_monthly()
property_stolen_recovered_yearly <- get_supplement_yearly() %>%
  as.data.frame()

table(property_stolen_recovered_yearly$year)
table(
  property_stolen_recovered_yearly$year,
  property_stolen_recovered_yearly$number_of_months_reported
)
summary(property_stolen_recovered_yearly$value_stolen_total[property_stolen_recovered_yearly$year %in% 2006])
summary(property_stolen_recovered_yearly$value_stolen_total[property_stolen_recovered_yearly$year %in% 2019])
summary(property_stolen_recovered_yearly$value_stolen_total[property_stolen_recovered_yearly$year %in% 2024])
summary(property_stolen_recovered_yearly$offenses_theft_all_other[property_stolen_recovered_yearly$year %in% 2006])
summary(property_stolen_recovered_yearly$offenses_theft_all_other[property_stolen_recovered_yearly$year %in% 2019])
summary(property_stolen_recovered_yearly$offenses_theft_all_other[property_stolen_recovered_yearly$year %in% 2024])
summary(property_stolen_recovered_yearly$value_stolen_local_mtr_veh[property_stolen_recovered_yearly$year %in% 2006])
summary(property_stolen_recovered_yearly$value_stolen_local_mtr_veh[property_stolen_recovered_yearly$year %in% 2019])
summary(property_stolen_recovered_yearly$value_stolen_local_mtr_veh[property_stolen_recovered_yearly$year %in% 2024])

table(property_stolen_recovered_yearly$number_of_months_reported)
table(
  property_stolen_recovered_yearly$number_of_months_reported,
  property_stolen_recovered_yearly$year
)
summary(property_stolen_recovered_yearly)

summary(property_stolen_recovered_yearly[property_stolen_recovered_yearly$year %in% 2024, ])

save_files(
  data = property_stolen_recovered_yearly,
  year = "1960_2024",
  file_name = "property_stolen_and_recovered_yearly_",
  save_name = "D:/ucr_data_storage/clean_data/supplement_return_a/property_stolen_and_recovered_yearly_"
)
