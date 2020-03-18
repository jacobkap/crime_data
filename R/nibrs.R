source(here::here('R/utils/global_utils.R'))
source(here::here('R/utils/saving_utils.R'))


nibrs_segments <- c("administrative_segment",
                    "offense_segment",
                    "property_segment",
                    "victim_segment",
                    "offender_segment",
                    "arrestee_segment",
                    "group_b_arrest_report_segment",
                    "window_exceptional_clearance_segment",
                    "window_recovered_property_segment",
                    "window_arrestee_segment")

# read_and_save_nibrs_segments(nibrs_segments)
save_nibrs_as_zip(nibrs_segments)
save_nibrs_as_zip <- function(segments) {
  for (segment in segments) {
    setwd("D:/ucr_data_storage/clean_data/nibrs")
    save_as_zip(paste0("nibrs_1991_2018_", segment, "_"), pattern = segment)
  }
}

read_and_save_nibrs_segments <- function(segments) {
  for (segment in segments) {

    source(here::here(paste0("R/make_sps/nibrs_", segment, "_sps.R")))
    setwd("D:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
    files <- list.files(pattern = paste0("^", segment))
    print(files)


    for (file in files) {
      setwd("D:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
      data <- read_ascii_setup(file, here::here(paste0("setup_files/nibrs_",
                                                       segment, ".sps"))) %>%
        select(-segment_level) %>%
        mutate(state_abb = crimeutils::make_state_abb(state),
               state     = tolower(state),
               year      = parse_number(file)) %>%
        select(ori,
               year,
               state,
               state_abb,
               everything()) %>%
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



      setwd("D:/ucr_data_storage/clean_data/nibrs")
      save_files(data = data,
                 year = unique(data$year),
                 file_name = paste0("nibrs_", segment, "_segment_"),
                 save_name = paste0("nibrs_", segment, "_segment_"))
      message(file)
    }
  }
}


# Check data

files <- list.files(pattern = "2018.rda")
for (file in files) {
  load(file)
  assign("data", get(gsub(".rda", "", file)))
  rm(list = gsub(".rda", "", file))
  message(file)
  data$incident_number                 <- NULL
  data$ori                             <- NULL
  data$incident_date                   <- NULL
  data$arrest_date                     <- NULL
  data$arrest_transaction_incident_num <- NULL
  data$arrest_transaction_number       <- NULL
  data$arrestee_sequence_number        <- NULL
  data$exceptional_clearance_date      <- NULL
  data$date_recovered                  <- NULL
  print(sapply(data, unique))
  message("\n\n\n\n\n")

}
