#
# setwd("E:/ucr_data_storage/raw_data/asr_from_fbi")
# temp <- readLines("DWASR97.DAT")
# temp <- iconv(temp, "UTF-8", "ASCII", sub = "")
# writeLines(temp, "DWASR97.DAT")



clean_arrest_files <- function(files) {
  print(files)
  for (file in files) {
    sps_years <- "1980_present"
    if (grepl("7[4-9]", file)) {
      sps_years <- "1974_1979"
    }

    agency_header <- get_agency_header(file, sps_years) %>%
      distinct(ori, .keep_all = TRUE) # Rare occurance of duplicate rows
    print(table(agency_header$year))
    monthly_header <- get_monthly_header(file, sps_years) %>%
      distinct(ori, month, .keep_all = TRUE)
    detail_header <- get_detail_header(file, sps_years) %>%
      distinct(ori,
        month,
        offense_code,
        .keep_all = TRUE
      )

    number_of_months_reported <- monthly_header %>%
      distinct(
        ori,
        zero_data_months
      ) %>%
      rename(number_of_months_reported = zero_data_months)
    print(table(number_of_months_reported$number_of_months_reported))

    yearly_monthly_header <- make_arrests_yearly(monthly_header, "monthly")
    yearly_detail_header <- make_arrests_yearly(detail_header, "offenses")


    detail_header <-
      detail_header %>%
      fastDummies::dummy_rows(
        select_columns = c(
          "ori",
          "month",
          "offense_code"
        ),
        dummy_value = 0
      )

    yearly_detail_header <-
      yearly_detail_header %>%
      fastDummies::dummy_rows(
        select_columns = c("ori", "offense_code"),
        dummy_value = 0
      )

    source("R/crosswalk.R")
    crosswalk <- read_merge_crosswalks()
    cross_names <- names(crosswalk)
    cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]


    monthly_data <-
      detail_header %>%
      left_join(
        monthly_header %>%
          select(
            -population_group,
            -country_division
          ),
        by = join_by(ori, month)
      ) %>%
      dplyr::left_join(agency_header, by = "ori") %>%
      dplyr::left_join(number_of_months_reported, by = "ori") %>%
      dplyr::left_join(crosswalk, by = "ori") %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(
        ori = toupper(ori),
        ori9 = toupper(ori9),
        state_abb = toupper(state_abb)
      ) %>%
      dplyr::select(
        ori,
        ori9,
        year,
        month,
        number_of_months_reported,
        zero_data_indicator_binary,
        zero_data_months,
        population,
        agency_name,
        state,
        state_abb,
        population_group,
        country_division,
        cross_names,
        covered_by,
        breakdown_indicator,
        age_race_ethnicity_indicator,
        juvenile_and_adult_indicators,
        zero_data_indicator,
        date_of_last_update,
        date_of_1st_previous_update,
        date_of_2nd_previous_update,
        juvenile_disposition_indicator,
        juvenile_handled_in_department,
        juvenile_referred_juvenile_court,
        juvenile_referred_to_welfare,
        juvenile_referred_to_police,
        juvenile_referred_to_crim_court,
        suburban,
        core_city,
        everything()
      ) %>%
      filter(!is.na(year)) %>%
      distinct(ori,
        year,
        month,
        offense_code,
        .keep_all = TRUE
      ) %>%
      mutate(month = factor(month,
                            levels = tolower(month.name))) %>%
      arrange(
        ori,
        offense_code,
        month
      ) %>%
      mutate(month = as.character(month)) %>%
      select(
        -monthly_header_designation,
        -county,
        -identifier_code,
        -agency_header_designation,
        -sequence_number,
        -msa
      )


    yearly_data <-
      yearly_detail_header %>%
      dplyr::left_join(
        yearly_monthly_header %>%
          select(
            -population_group,
            -country_division
          ),
        by = join_by(ori)
      ) %>%
      dplyr::left_join(agency_header, by = "ori") %>%
      dplyr::left_join(number_of_months_reported, by = "ori") %>%
      dplyr::left_join(crosswalk, by = "ori") %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(
        ori = toupper(ori),
        ori9 = toupper(ori9),
        state_abb = toupper(state_abb)
      ) %>%
      dplyr::select(
        ori,
        ori9,
        year,
        number_of_months_reported,
        zero_data_indicator_binary,
        zero_data_months,
        population,
        agency_name,
        state,
        state_abb,
        population_group,
        country_division,
        cross_names,
        covered_by,
        breakdown_indicator,
        age_race_ethnicity_indicator,
        juvenile_and_adult_indicators,
        zero_data_indicator,
        date_of_last_update,
        date_of_1st_previous_update,
        date_of_2nd_previous_update,
        juvenile_disposition_indicator,
        juvenile_handled_in_department,
        juvenile_referred_juvenile_court,
        juvenile_referred_to_welfare,
        juvenile_referred_to_police,
        juvenile_referred_to_crim_court,
        suburban,
        core_city,
        everything()
      ) %>%
      filter(!is.na(year)) %>%
      distinct(ori,
        year,
        offense_code,
        .keep_all = TRUE
      ) %>%
      arrange(
        ori,
        offense_code
      ) %>%
      select(
        -monthly_header_designation,
        -county,
        -identifier_code,
        -agency_header_designation,
        -sequence_number,
        -msa
      )



    saveRDS(
      monthly_data,
      paste0(
        "E:/ucr_data_storage/clean_data/arrests/",
        "arrests_monthly_", unique(monthly_data$year),
        ".rds"
      )
    )
    saveRDS(
      yearly_data,
      paste0(
        "E:/ucr_data_storage/clean_data/arrests/",
        "arrests_yearly_", unique(yearly_data$year),
        ".rds"
      )
    )



    message(file)
    Sys.sleep(1)
    gc()
  }
}


make_arrests_yearly <- function(data, type) {
  cols_to_remove <- "month"
  cols_to_remove <- c(
    cols_to_remove,
    grep("date|population|country|month|breakdown|indicator", names(data), value = TRUE)
  )

  constant_cols <- c("ori", cols_to_remove)
  constant_cols <- constant_cols[constant_cols != "month"]

  group_by_cols <- "ori"
  if (type == "offenses") {
    group_by_cols <- c(group_by_cols, "offense_code")
  }

  constant_data <-
    data %>%
    dplyr::select(one_of(constant_cols)) %>%
    dplyr::distinct(ori, .keep_all = TRUE)

  agg_data <-
    data %>%
    dplyr::select(-one_of(cols_to_remove)) %>%
    dplyr::group_by_at(vars(one_of(group_by_cols))) %>%
    dplyr::summarize_all(sum)

  data <-
    constant_data %>%
    dplyr::left_join(agg_data, by = "ori")

  return(data)
}


combine_arrest_yearly <- function() {
  files <- list.files("E:/ucr_data_storage/arrest_annual_files", full.names = TRUE)
  files

  final <- vector("list", length = length(files))
  for (i in 1:length(files)) {
    data <- readRDS(files[i])
    final[[i]] <- data
    rm(data)
    gc()
    message(files[i])
  }
  final <- data.table::rbindlist(final)
  final <- data.frame(final)
  saveRDS(final,
    file = paste0(
      "E:/ucr_data_storage/clean_data/arrests/arrest_yearly_",
      min(final$year), "_", max(final$year), ".rds"
    )
  )
  gc()
}



source("R/utils/arrests_utils.R")
source("R/utils/global_utils.R")
source("R/make_sps/make_arrest_sps.R")
files <- list.files(path = "E:/ucr_data_storage/raw_data/asr_from_fbi",
                    pattern = "DAT|dat|TXT|txt",
                    full.names = TRUE)
files
clean_arrest_files(files)
combine_arrest_yearly()
