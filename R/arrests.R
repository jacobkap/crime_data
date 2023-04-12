source(here::here('R/utils/arrests_utils_objects.R'))
source(here::here('R/utils/arrests_utils.R'))
source(here::here('R/utils/global_utils.R'))
source(here::here('R/make_sps/make_arrest_sps.R'))
source(here::here("R/make_sps/make_arrest_post_2020_sps.R"))
setwd("E:/ucr_data_storage/raw_data/asr_from_fbi")
files = list.files(pattern = "DAT|dat|TXT|txt")
files <- files[files != "2021_ASR12MON_NATIONAL_MASTER_FILE.txt"] # 2021 data does not follow setup file
files
get_post_2020_arrests("2021_ASR12MON_NATIONAL_MASTER_FILE.txt")
#clean_arrest_files(files[35:length(files)])
combine_arrest_yearly()


setwd("E:/ucr_data_storage/clean_data/arrests")
save_as_zip("ucr_arrests_monthly_other_crimes_1974_2020_",
            pattern = "monthly_other_crimes")
save_as_zip("ucr_arrests_monthly_alcohol_or_property_1974_2020_",
            pattern = "monthly_alcohol")
save_as_zip("ucr_arrests_monthly_drug_1974_2020_",
            pattern = "monthly_drug")
save_as_zip("ucr_arrests_monthly_index_1974_2020_",
            pattern = "monthly_index")
save_as_zip("ucr_arrests_monthly_all_crimes_race_sex_1974_2020_",
            pattern = "monthly_all")
save_as_zip("ucr_arrests_yearly_data_1974_2021_",
            pattern = "yearly.*_1974_2021")


get_post_2020_arrests <- function(files) {
  setwd("E:/ucr_data_storage/clean_data/arrests")
  file_categories <- list.files(pattern = "yearly.*2020.rds")
  file_categories <- gsub(".....rds$", "", file_categories)

  for (file in files) {
    setwd("E:/ucr_data_storage/raw_data/asr_from_fbi")
    agency_header <- read_ascii_setup(file,
                                      here::here("setup_files/arrests_agency_header_post_2020.sps")) %>%
      filter(offense %in% 0) %>%
      dplyr::select(-offense,
                    -not_used1,
                    -not_used2,
                    -not_used3,
                    -not_used4,
                    -agency_count,
                    -identifier_code,
                    -sequence_number,
                    -county) %>%
      distinct(ori, .keep_all = TRUE) %>%
      mutate(year = fix_years(year),
             state_abb  = make_state_abb(state))

    detail_header <- read_ascii_setup(file,
                                      here::here("setup_files/arrests_detail_header_post_2020.sps")) %>%
      filter(!offense_code %in% "header record") %>%
      dplyr::select(-identifier_code,
                    -state,
                    -population_group,
                    -country_division,
                    -msa,
                    -not_used,
                    -year,
                    -card_1_indicator,
                    -card_2_indicator,
                    -card_3_indicator,
                    -adjustment) %>%
      distinct(ori, offense_code, .keep_all = TRUE)
    detail_header <- fastDummies::dummy_rows(detail_header,
                                             select_columns = c("ori",
                                                                "offense_code"),
                                             dummy_value = 0)
    # Make columns numeric
    for (i in 3:ncol(detail_header)) {
      detail_header[, i] <- as.numeric(detail_header[, i])
    }
    detail_header <- make_simple_columns(detail_header)
    arrestee_info <- names(detail_header)
    arrestee_info <- arrestee_info[!arrestee_info %in% c("ori", "offense_code")]

    detail_header <-
      detail_header %>%
      pivot_wider(names_from = offense_code,
                  values_from = arrestee_info,
                  names_glue = "{offense_code}_{.value}")
    detail_header <- data.frame(detail_header)



    source(here::here('R/crosswalk.R'))
    crosswalk <- read_merge_crosswalks()
    agency_header <-
      agency_header %>%
      filter(ori %in% detail_header$ori) %>%
      left_join(crosswalk) %>%
      left_join(detail_header)

    names(agency_header) <- gsub("poss_drug_total_tot_female_adult",
                                 "poss_drug_total_tot_female_adul", names(agency_header))
    names(agency_header) <- gsub("poss_heroin_coke_tot_female_adult",
                                 "poss_heroin_coke_tot_female_adu", names(agency_header))
    names(agency_header) <- gsub("poss_other_drug_tot_female_adult",
                                 "poss_other_drug_tot_female_adul", names(agency_header))

    names(agency_header) <- gsub("poss_synth_narc_tot_female_adult",
                                 "poss_synth_narc_tot_female_adul", names(agency_header))
    names(agency_header) <- gsub("sale_drug_total_tot_female_adult",
                                 "sale_drug_total_tot_female_adul", names(agency_header))
    names(agency_header) <- gsub("sale_heroin_coke_tot_female_adult",
                                 "sale_heroin_coke_tot_female_adu", names(agency_header))

    names(agency_header) <- gsub("sale_other_drug_tot_female_adult",
                                 "sale_other_drug_tot_female_adul", names(agency_header))
    names(agency_header) <- gsub("sale_synth_narc_tot_female_adult",
                                 "sale_synth_narc_tot_female_adul", names(agency_header))

    names(agency_header) <- gsub("poss_heroin_coke_female_under_10",
                                 "poss_heroin_coke_female_under10", names(agency_header))
    names(agency_header) <- gsub("sale_heroin_coke_female_under_10",
                                 "sale_heroin_coke_female_under10", names(agency_header))



    names(agency_header) <- gsub("prostitution_pro_tot_female_adult", "prostitution_pro_tot_female_adul", names(agency_header))
    names(agency_header) <- gsub("prostitution_ass_tot_female_adult", "prostitution_ass_tot_female_adul", names(agency_header))
    names(agency_header) <- gsub("prostitution_pur_tot_female_adult", "prostitution_pur_tot_female_adul", names(agency_header))

    setwd("E:/ucr_data_storage/clean_data/arrests")
    for (file_category in file_categories) {
      temp2020 <- readRDS(paste0(file_category, "2020.rds"))
      temp_new <- agency_header[, names(agency_header) %in% names(temp2020)]
      saveRDS(temp_new, file =  paste0(file_category,
                                       unique(agency_header$year), ".rds"))
      write_dta(temp_new, path = paste0(file_category,
                                        unique(agency_header$year), ".dta"))
    }

  }
}




clean_arrest_files <- function(files) {
  print(files)
  for (file in files) {

    sps_years <- "1980_present"
    if (grepl("7[4-9]", file)) {
      sps_years <- "1974_1979"
    }

    setwd("E:/ucr_data_storage/raw_data/asr_from_fbi")
    agency_header  <- get_agency_header(file,  sps_years)
    monthly_header <- get_monthly_header(file, sps_years)
    detail_header  <- get_detail_header(file,  sps_years)


    number_of_months_reported <- get_number_months_reported(detail_header)

    yearly_monthly_header <- make_arrests_yearly(monthly_header, "monthly")
    yearly_detail_header  <- make_arrests_yearly(detail_header, "offenses")

    # Some agency header rows have the wrong year and appear to be
    # just bad data (e.g. state = 0, ORI is not in right format)
    # Keeps just most common year
    agency_header <- agency_header[agency_header$year %in%
                                     as.numeric(names(sort(table(agency_header$year),
                                                           decreasing = TRUE)[1])), ]


    source(here::here('R/crosswalk.R'))
    crosswalk <- read_merge_crosswalks()

    # Monthly
    long_to_wide_and_save(detail_header,
                          monthly_header,
                          agency_header,
                          number_of_months_reported,
                          type = "monthly",
                          crosswalk)
    # Yearly
    long_to_wide_and_save(yearly_detail_header,
                          yearly_monthly_header,
                          agency_header,
                          number_of_months_reported,
                          type = "yearly",
                          crosswalk)
    message(file); gc();
  }
}


make_arrests_yearly <- function(data, type) {
  cols_to_remove <- "month"
  cols_to_remove <- c(cols_to_remove,
                      grep("date", names(data), value = TRUE))

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
    dplyr::summarize_all(sum, na.rm = TRUE)

  data <-
    constant_data %>%
    dplyr::left_join(agg_data, by = "ori")

  return(data)
}


long_to_wide_and_save <- function(detail_header,
                                  monthly_header,
                                  agency_header,
                                  number_of_months_reported,
                                  type,
                                  crosswalk) {
  setwd("E:/ucr_data_storage/clean_data/arrests")
  cross_names <- names(crosswalk)
  cross_names <- cross_names[!cross_names %in% c("ori", "ori9")]

  time_vars <- "year"
  identifier_cols <- c("ori",
                       "offense_code")
  first_join_by <- "ori"
  if (type == "monthly") {
    time_vars <- c("year", "month")
    identifier_cols <- c("ori",
                         "offense_code",
                         "month")
    first_join_by <- c("ori", "month")
  }


  for (i in 1:length(combined_crimes)) {
    for (n in 1:nrow(matches_types)) {
      file_name <- paste0("ucr_arrests_",
                          type, "_",
                          names(combined_crimes)[i], "_",
                          matches_types$name[n], "_")



      if (names(combined_crimes)[i] == "all_crimes" &&
          matches_types$name[n] %in% "age") {
        next # Skips over the age categories for the all_crimes one -
        # so my laptop doesn't crash
      }
      if (names(combined_crimes)[i] != "all_crimes" &&
          matches_types$name[n] %in% "race_sex") {
        next
      }

      # Subset to desired offense-rows and columns
      wide_data <-
        detail_header %>%
        dplyr::filter(offense_code %in% combined_crimes[[i]]) %>%
        dplyr::select(identifier_cols,
                      dplyr::matches(matches_types$match[n]))

      # A very small number of results have same ORI, offense_code,
      # and month so this removes the duplicate. I think that
      # agency just made a mistake when putting in their data
      if (type == "monthly") {
        wide_data <-
          wide_data %>%
          dplyr::distinct(ori, offense_code, month, .keep_all = TRUE)
      }

      number_of_months_reported_temp <-
        number_of_months_reported %>%
        dplyr::select(ori,
                      number_of_months_reported,
                      one_of(paste0("num_months_", combined_crimes[[i]])))


      monthly_cols <- paste0("num_months_", combined_crimes[[i]])
      monthly_cols <- names(number_of_months_reported_temp)[names(number_of_months_reported_temp) %in% monthly_cols]

      wide_data <-
        wide_data %>%
        make_long_to_wide(type = type) %>%
        # Combine everything together
        dplyr::full_join(monthly_header, by = first_join_by)


      if (type == "monthly") {
        all_agencies_time <- data.frame(ori = rep(agency_header$ori, times = 12)) %>%
          arrange(ori)
        all_agencies_time$month <- rep(tolower(month.name), nrow(agency_header))
        all_agencies_time <- all_agencies_time[!paste(all_agencies_time$ori,
                                                      all_agencies_time$month) %in%
                                                 paste(wide_data$ori,
                                                       wide_data$month),]
      } else if (type == "yearly") {
        all_agencies_time <- data.frame(ori = agency_header$ori)
        all_agencies_time <- all_agencies_time[!all_agencies_time$ori %in% wide_data$ori,
                                               drop = FALSE, ]
      }
      wide_data <- bind_rows(wide_data, all_agencies_time)
      wide_data[is.na(wide_data)] <- 0

      wide_data <-
        wide_data %>%
        dplyr::full_join(agency_header,  by = "ori") %>%
        dplyr::left_join(number_of_months_reported_temp, by = "ori") %>%
        dplyr::left_join(crosswalk, by = "ori") %>%
        dplyr::mutate_if(is.character, tolower) %>%
        dplyr::mutate(ori       = toupper(ori),
                      ori9      = toupper(ori9),
                      state_abb = toupper(state_abb)) %>%
        dplyr::select(ori,
                      ori9,
                      population,
                      agency_name,
                      one_of(time_vars),
                      state,
                      state_abb,
                      population_group,
                      country_division,
                      cross_names,
                      matches("date"),
                      covered_by,
                      number_of_months_reported,
                      monthly_cols,
                      everything()) %>%
        dplyr::select(-agency_type,
                      -crosswalk_agency_name,
                      -census_name) %>%
        filter(!is.na(year)) %>%
        mutate_at(c("number_of_months_reported", monthly_cols), na_to_0)


      saveRDS(wide_data, file =  paste0(file_name, unique(wide_data$year), ".rds"))
      if (type == "monthly") {
        write_dta(wide_data, path = paste0(file_name, unique(wide_data$year), ".dta"))
      }

      gc()

    }
  }
}


combine_arrest_yearly <- function() {
  setwd("E:/ucr_data_storage/clean_data/arrests")
  file_categories <- list.files(pattern = "yearly.*rds")
  file_categories <- gsub(".....rds$", "", file_categories)
  file_categories <- file_categories[file_categories != "ucr_arrests_yearly_all_variables_"]
  if (any(grep("[0-9]", file_categories))) {
    file_categories <- file_categories[-grep("[0-9]", file_categories)]
  }
  file_categories <- unique(file_categories)

  for (file_category in file_categories) {
    annual_files <- list.files(pattern = file_category)
    # Drop dta or already aggregated files
    if (any(grep("dta$|[0-9]{4}_[0-9]{4}", annual_files))) {
      annual_files <- annual_files[-grep("dta$|[0-9]{4}_[0-9]{4}", annual_files)]
    }
    data <- vector(mode = "list", length(annual_files))
    for (i in 1:length(annual_files)) {
      data[[i]] <- readRDS(annual_files[i])
      message(annual_files[i])
    }


    # 1974 and 1975 doesn't have possession crimes or total drug sale crimes
    data <- data.table::rbindlist(data, use.names=TRUE,
                                  fill = TRUE) %>%
      arrange(ori,
              desc(year)) %>%
      dplyr::select(ori,
                    ori9,
                    population,
                    agency_name,
                    year,
                    state,
                    state_abb,
                    population_group,
                    country_division,
                    fips_state_code,
                    fips_county_code,
                    fips_state_county_code,
                    fips_place_code,
                    longitude,
                    latitude,
                    covered_by,
                    everything())
    # Handles 1974 and 1975 having no drug possession arrests. Replaces those NAs with zero.
    # Also for post-2020 years where some categories are missing.
    data[is.na(data)] <- 0
    saveRDS(data,
            file = paste0(file_category, min(data$year), "_", max(data$year), ".rds"))
    write_dta(data,
              path = paste0(file_category, min(data$year), "_", max(data$year), ".dta"))
    message(file_category)
    message("\n\n\n")
    rm(data); gc()
  }
}

