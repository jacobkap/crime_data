source("R/utils/global_utils.R")


nibrs_segments <- c(
  "administrative_segment",
  "offense_segment",
  "property_segment",
  "victim_segment",
  "offender_segment",
  "arrestee_segment",
  "group_b_arrest_report_segment",
  "window_exceptional_clearance_segment",
  "window_recovered_property_segment",
  "window_arrestee_segment"
)




read_and_save_nibrs_segments <- function(segments, years = NULL) {
  for (segment in segments) {
    source(paste0("R/make_sps/nibrs_", segment, "_sps.R"))
    source(paste0("R/make_sps/nibrs_arrestee_segment_sps_vermont_2015.R"))
    source(paste0("R/make_sps/nibrs_window_arrestee_segment_sps_vermont_2015.R"))
  raw_folder <- "E:/ucr_data_storage/raw_data/nibrs_master_files_parsed"
    files <- list.files(path = raw_folder, pattern = paste0("^", segment), full.names = TRUE)
    files <- files[!grepl("vermont", files)]

    if (!is.null(years)) {
      files <- files[readr::parse_number(files) %in% years]
    }
    print(files)
    if (length(files) %in% 0) {
      next
    }

    for (file in files) {

      data <- read_ascii_setup(file, paste0(
        "setup_files/nibrs_",
        segment, ".sps"
      ))
      if (file %in% "E:/ucr_data_storage/raw_data/nibrs_master_files_parsed/arrestee_segment_2015.txt" &
          segment %in% "arrestee_segment") {

        vermont <- read_ascii_setup("E:/ucr_data_storage/raw_data/nibrs_master_files_parsed/arrestee_segment_2015.txt", paste0(
          "setup_files/nibrs_",
          segment, "_vermont_2015.sps"
        )) %>%
          mutate(arrest_date = as.character(arrest_date),
                 automatic_weapon_indicator_2 = as.character(automatic_weapon_indicator_2),
                 age_of_arrestee = as.character(age_of_arrestee)) %>%
          filter(state %in% "Vermont")
        data <-
          data %>%
          filter(!state %in% "Vermont") %>%
          bind_rows(vermont)
        rm(vermont)
      }
      if (file %in% "E:/ucr_data_storage/raw_data/nibrs_master_files_parsed/window_arrestee_segment_2015.txt" & segment %in% "window_arrestee_segment") {

        vermont <- read_ascii_setup("E:/ucr_data_storage/raw_data/nibrs_master_files_parsed/window_arrestee_segment_2015vermont.txt", paste0(
          "setup_files/nibrs_",
          segment, "_vermont_2015.sps"
        )) %>%
          mutate(arrest_date = as.character(arrest_date),
                 automatic_weapon_indicator_1 = as.character(automatic_weapon_indicator_1),
                 arrestee_weapon_2 = as.character(arrestee_weapon_2),
                 ucr_offense_code_4 = as.character(ucr_offense_code_4),
                 ucr_offense_code_5 = as.character(ucr_offense_code_5),
                 age_of_arrestee = as.character(age_of_arrestee)) %>%
          filter(state %in% "Vermont")
        data <-
          data %>%
          filter(!state %in% "Vermont") %>%
          bind_rows(vermont)
        rm(vermont)
      }

      data <-
        data %>%
        dplyr::select(-segment_level) %>%
        mutate(
          state_abb = crimeutils::make_state_abb(state),
          state = tolower(state),
          year = parse_number(file)
        ) %>%
        dplyr::select(
          ori,
          year,
          state,
          state_abb,
          everything()
        ) %>%
        arrange(ori)
      if ("incident_date" %in% names(data)) {
        data$incident_date <- ymd(data$incident_date)
      }
      # Arrestee segment
      if ("arrest_date" %in% names(data)) {
        data$arrest_date <- ymd(data$arrest_date)
      }
      # Administrative segment
      if ("exceptional_clearance_date" %in% names(data)) {
        data$exceptional_clearance_date <- ymd(data$exceptional_clearance_date)
      }
      # Property recovered segment
      if ("date_recovered" %in% names(data)) {
        data$date_recovered <- ymd(data$date_recovered)
      }
      data$city_submission <- NULL


      if (all(c("year", "incident_number", "ori") %in% names(data))) {
        data$unique_incident_id <- paste(data$year, data$ori, data$incident_number)
      }


      data <-
        data %>%
        mutate_if(is.character, tolower) %>%
        mutate(ori = toupper(ori))

      clean_folder <- "E:/ucr_data_storage/clean_data/nibrs/"
      save_files(
        data = data,
        year = unique(data$year),
        file_name = paste0(clean_folder, segment, "/nibrs_", segment, "_"),
        save_name = paste0(clean_folder, segment, "/nibrs_", segment, "_")
      )
      message(file)
      rm(data)
      gc()
    }
  }
}

check_nibrs_data <- function(data) {
  summary(data$incident_date)
  data$incident_number <- NULL
  data$ori <- NULL
  data$officer_killed_other_agency_ori <- NULL
  data$value_of_property <- NULL
  data$incident_date <- NULL
  data$arrest_date <- NULL
  data$arrest_transaction_incident_num <- NULL
  data$arrest_transaction_number <- NULL
  data$arrestee_sequence_number <- NULL
  data$exceptional_clearance_date <- NULL
  data$date_recovered <- NULL
  data$unique_incident_id <- NULL
  data$city_name <- NULL
  data$covered_by_ori <- NULL
  data$population <- NULL
  data$current_population_1 <- NULL
  data$ucr_county_code_1 <- NULL
  data$msa_code_1 <- NULL
  data$current_population_2 <- NULL
  data$ucr_county_code_2 <- NULL
  data$msa_code_2 <- NULL
  data$current_population_3 <- NULL
  data$ucr_county_code_3 <- NULL
  data$msa_code_3 <- NULL
  data$estimated_quantity_1 <- NULL
  data$estimated_quantity_2 <- NULL
  data$estimated_quantity_3 <- NULL
  data$est_quantity_fractional_1000th1 <- NULL
  data$est_quantity_fractional_1000th2 <- NULL
  data$est_quantity_fractional_1000th3 <- NULL
  print(sapply(data, function(x) sort(unique(x), na.last = TRUE)))
  message("\n\n\n\n")
}


read_and_save_nibrs_segments(segments = nibrs_segments, years = 1991:2024)

# Check data
files <- list.files(path = "E:/ucr_data_storage/clean_data/nibrs/offense_segment/",
                    full.names = TRUE)
files
for (file in files) {
  data <- readRDS(file)
  message(file)
  check_nibrs_data(data)
}

