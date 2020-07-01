source(here::here('R/utils/arrests_utils_objects.R'))
source(here::here('R/utils/arrests_utils.R'))
source(here::here('R/utils/global_utils.R'))
source(here::here('R/make_sps/make_arrest_sps.R'))
setwd(here::here("raw_data/asr_from_fbi"))
files = list.files(pattern = "DAT|dat|TXT|txt")

files
get_temp_arrest_files(files)
combine_arrest_yearly()
save_files_monthly()


setwd("D:/ucr_data_storage/clean_data/arrests")
save_as_zip("ucr_arrests_monthly_other_crimes_1974_2018_",
            pattern = "monthly_other_crimes")
save_as_zip("ucr_arrests_monthly_alcohol_or_property_1974_2018_",
            pattern = "monthly_alcohol")
save_as_zip("ucr_arrests_monthly_drug_1974_2018_",
            pattern = "monthly_drug")
save_as_zip("ucr_arrests_monthly_index_1974_2018_",
            pattern = "monthly_index")
save_as_zip("ucr_arrests_monthly_all_crimes_race_sex_1974_2018_",
            pattern = "monthly_all")
save_as_zip("ucr_arrests_yearly_data_1974_2018_",
            pattern = "yearly")



get_temp_arrest_files <- function(files) {
  print(files)
  for (file in files) {

    sps_years <- "1980_present"
    if (grepl("7[4-9]", file)) {
      sps_years <- "1974_1979"
    }

    setwd(here::here("raw_data/asr_from_fbi"))
    agency_header  <- get_agency_header(file,  sps_years)
    monthly_header <- get_monthly_header(file, sps_years)
    detail_header  <- get_detail_header(file,  sps_years)


    number_of_months_reported <- get_number_months_reported(detail_header)

    yearly_monthly_header <- make_arrests_yearly(monthly_header, "monthly")
    yearly_detail_header  <- make_arrests_yearly(detail_header, "offenses")

    # Some agency header rows have the wrong year and appear to be
    # just bad data (e.g. state = 0, ori is not in right format)
    # Keeps just most common year
    agency_header <- agency_header[agency_header$year %in%
                                     as.numeric(names(sort(table(agency_header$year),
                                                           decreasing = TRUE)[1])), ]


    # Monthly
    long_to_wide_and_save(detail_header,
                          monthly_header,
                          agency_header,
                          number_of_months_reported,
                          type = "monthly")
    Sys.sleep(5)
    # Yearly
    long_to_wide_and_save(yearly_detail_header,
                          yearly_monthly_header,
                          agency_header,
                          number_of_months_reported,
                          type = "yearly")
    message(file); gc(); Sys.sleep(5); gc(); Sys.sleep(5)
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
    dplyr::left_join(agg_data)

  return(data)
}


long_to_wide_and_save <- function(detail_header,
                                  monthly_header,
                                  agency_header,
                                  number_of_months_reported,
                                  type,
                                  replace = TRUE) {
  source(here::here('R/crosswalk.R'))
  setwd(here::here("clean_data/arrests_temp"))
  crosswalk <- read_merge_crosswalks()
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

      # Skips if file already made
      if (paste0(file_name, unique(agency_header$year), ".rda") %in% list.files() &&
          replace == TRUE) {
        next
      }

      if (names(combined_crimes)[i] == "all_crimes" &&
          matches_types$name[n] %in% c("age")) {
        next # Skips over the age categories for the all_crimes one -
        # so my laptop doesn't crash
      }
      if (names(combined_crimes)[i] != "all_crimes" &&
          matches_types$name[n] %in% c("sex",
                                       "race")) {
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
        # Changes NA to 0s in numeric columns
        dplyr::mutate_if(is.numeric, list(~replace(., is.na(.), 0))) %>%
        # Combine everything together
        dplyr::full_join(monthly_header, by = first_join_by) %>%
        dplyr::full_join(agency_header, by = "ori") %>%
        dplyr::left_join(number_of_months_reported_temp, by = "ori") %>%
        dplyr::left_join(crosswalk, by = "ori") %>%
        dplyr::mutate_if(is.character, tolower) %>%
        dplyr::mutate(ori       = toupper(ori),
                      ori9      = toupper(ori9),
                      state_abb = toupper(state_abb)) %>%
        dplyr::select(ori,
                      ori9,
                      number_of_months_reported,
                      monthly_cols,
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
                      everything()) %>%
        dplyr::select(-agency_type,
                      -crosswalk_agency_name,
                      -census_name) %>%
        filter(!is.na(year)) %>%
        mutate_at(c("number_of_months_reported", monthly_cols), na_to_0)

      save_files(data = wide_data,
                 year = unique(wide_data$year),
                 file_name = file_name,
                 save_name = file_name,
                 rda_only  = TRUE)

    }
  }
}


save_files_monthly <- function() {
  setwd(here::here("clean_data/arrests_temp"))
  all_files <- list.files()
  all_files <- all_files[grepl("monthly", all_files)]
  print(all_files)

  for (file in all_files) {
    setwd(here::here("clean_data/arrests_temp"))

    file.copy(file, "D:/ucr_data_storage/clean_data/arrests",
              overwrite = TRUE)

    load(file)
    assign("data", get(gsub(".rda", "", file))) # Change name
    do.call("rm", list(as.name(gsub(".rda", "", file)))); gc()
    file_name <- gsub(".rda$", "", file)
    setwd("D:/ucr_data_storage/clean_data/arrests")

    haven::write_dta(data, path = paste0(file_name, ".dta"))

  }

}

combine_arrest_yearly <- function() {
  setwd(here::here("clean_data/arrests_temp"))
  all_files <- list.files()
  all_files <- gsub(".....rda$", "", all_files)
  all_files <- unique(all_files)
  all_files <- all_files[grepl("yearly", all_files)]
  print(all_files)

  for (temp_file in all_files) {
    setwd(here::here("clean_data/arrests_temp"))
    files <- list.files(pattern = temp_file)

    files_1974_1994 <- files[readr::parse_number(files) %in% 1974:1994]
    files_1995_2018 <- files[readr::parse_number(files) %in% 1995:2018]
    combine_and_save(files_1974_1994)
    combine_and_save(files_1995_2018)
  }
  Sys.sleep(5)
  print("\n\n\n\n")
  message(temp_file)
}

combine_and_save <- function(files) {
  file_name <- gsub(".....rda$", "", files[1])
  years <- paste0(min(readr::parse_number(files)), "_",
                  max(readr::parse_number(files)))
  if (length(files) == 1) {
    years <- paste0(readr::parse_number(files))
  }


  # If file doesn't already exist, then make file
  setwd("D:/ucr_data_storage/clean_data/arrests")
  if (!paste0(file_name, years, ".rda") %in% list.files()) {


    data <- data.frame(stringsAsFactors = FALSE)
    setwd(here::here("clean_data/arrests_temp"))
    for (file in files) {
      load(file)
      assign("temp", get(gsub(".rda", "", file))) # Change name
      do.call("rm", list(as.name(gsub(".rda", "", file)))); gc()
      data <- dplyr::bind_rows(data, temp)
      message(file)
    }

    setwd("D:/ucr_data_storage/clean_data/arrests")
    if (min(data$year) == max(data$year)) {
      years <- unique(data$year)
    }
    save_files(data = data,
               year = years,
               file_name = file_name,
               save_name = file_name,
               rda_and_stata_only = TRUE,
               codebook = FALSE)
    rm(data); gc();
    setwd(here::here("clean_data/arrests_temp"))
  }
}

