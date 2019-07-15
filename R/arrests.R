source(here::here('R/utils/arrests_utils_objects.R'))
source(here::here('R/utils/arrests_utils.R'))
source(here::here('R/utils/global_utils.R'))
source(here::here('R/make_sps/make_arrest_sps.R'))
setwd(here::here("raw_data/asr_from_fbi"))
files = list.files(pattern = "DAT|dat|TXT|txt")

files
#get_temp_arrest_files(files[34:43])

combine_arrest_years()
setwd(here::here("clean_data/arrests"))
save_as_zip("ucr_arrests_yearly_1974_2016_",  pattern = "yearly")
save_as_zip("ucr_arrests_monthly_1974_2016_", pattern = "monthly")

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

    monthly_data <-
      detail_header %>%
      dplyr::left_join(monthly_header) %>%
      dplyr::full_join(agency_header) %>%
      get_number_months_reported()


    number_of_months_reported <-
      monthly_data %>%
      dplyr::select(number_of_months_reported,
                    ori) %>%
      dplyr::distinct(ori, .keep_all = TRUE)

    yearly_monthly_header <- make_arrests_yearly(monthly_header, "monthly")
    yearly_detail_header  <- make_arrests_yearly(detail_header, "offenses")


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
    message(file); gc(); Sys.sleep(5)
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
                                  type) {
  source(here::here('R/crosswalk.R'))
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
    #  message(names(combined_crimes)[i])
    for (n in 1:nrow(matches_types)) {
      file_name <- paste0("ucr_arrests_",
                          type, "_",
                          names(combined_crimes)[i], "_",
                          matches_types$name[n], "_")
      if (names(combined_crimes)[i] == "all_crimes" &&
          matches_types$name[n] %in% c("age_by_sex",
                                       "totals_age")) {
        next # Skips over the age categories for the all_crimes one -
        # so my laptop doesn't crash
      }
      if (names(combined_crimes)[i] != "all_crimes" &&
          matches_types$name[n] %in% c("totals_race",
                                       "totals_sex")) {
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

      wide_data <-
        wide_data %>%
        make_long_to_wide(type = type) %>%
        # Changes NA to 0s in numeric columns
        dplyr::mutate_if(is.numeric, list(~replace(., is.na(.), 0))) %>%
        # Combine everything together
        dplyr::full_join(monthly_header, by = first_join_by) %>%
        dplyr::full_join(agency_header, by = "ori") %>%
        dplyr::left_join(number_of_months_reported, by = "ori") %>%
        dplyr::left_join(crosswalk, by = "ori") %>%
        dplyr::mutate_if(is.character, tolower) %>%
        dplyr::mutate(ori  = toupper(ori),
                      ori9 = toupper(ori9),
                      state_abb = toupper(state_abb)) %>%
        dplyr::select(ori,
                      ori9,
                      number_of_months_reported,
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
                      -agency_subtype_1,
                      -agency_subtype_2,
                      -crosswalk_agency_name,
                      -census_name)


      setwd(here::here("clean_data/arrests_temp"))
      save_files(data = wide_data,
                 year = unique(wide_data$year),
                 file_name = file_name,
                 save_name = file_name,
                 rda_only  = TRUE)

    }
  }
}


combine_arrest_years <- function() {
  setwd(here::here("clean_data/arrests_temp"))
  all_files <- list.files()
  all_files <- gsub(".....rda$", "", all_files)
  all_files <- unique(all_files)
  all_files <- all_files[grepl("yearly.*age|yearly_all_crime|monthly.*all_crimes", all_files)]

  for (file in all_files) {
    files <- list.files(pattern = file)

    # If monthly, save each year individually
    if (grepl("monthly", file)) {
      for (file in files) {
        combine_and_save(file)
      }
    } else {
      combine_and_save(files)
    }
    Sys.sleep(5)
  }
}

combine_and_save <- function(files) {
  data <- data.frame(stringsAsFactors = FALSE)
  for (file in files) {
    load(file)
    assign("temp", get(gsub(".rda", "", file))) # Change name
    do.call("rm", list(as.name(gsub(".rda", "", file)))); gc()
    temp$state_abb <- toupper(temp$state_abb)
    temp$suburban <- NULL
    data <- dplyr::bind_rows(data, temp)
  }
  file_name <- gsub(".....rda$", "", file)
  years <- paste0(min(data$year), "_", max(data$year))
  if (min(data$year) == max(data$year)) {
    years <- unique(data$year)
  }
  setwd(here::here("clean_data/arrests"))
  save_files(data = data,
             year = years,
             file_name = file_name,
             save_name = file_name)
  rm(data); gc();
  setwd(here::here("clean_data/arrests_temp"))
}

