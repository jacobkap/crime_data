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
                    "window_arrestee_segment",
                    "batch_header")



read_and_save_nibrs_segments("property_segment", years = 2021)
save_nibrs_as_zip("property_segment")
save_nibrs_as_zip <- function(segments) {
  setwd("E:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
  for (segment in segments) {
    setwd("E:/ucr_data_storage/clean_data/nibrs")
    save_as_zip(paste0("nibrs_1991_2021_", segment, "_"),
                pattern = paste0("nibrs_", segment))
    message(segment)
  }
}


read_and_save_nibrs_segments <- function(segments, years = NULL) {
  for (segment in segments) {


    source(here::here(paste0("R/make_sps/nibrs_", segment, "_sps.R")))
    setwd("E:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
    files <- list.files(pattern = paste0("^", segment))


    if (!is.null(years)) {
      files <- files[readr::parse_number(files) %in% years]
    }
    print(files)


    for (file in files) {
      setwd("E:/ucr_data_storage/raw_data/nibrs_master_files_parsed")

      data <- read_ascii_setup(file, here::here(paste0("setup_files/nibrs_",
                                                       segment, ".sps")))

     data <-
        data %>%
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


      if (all(c("incident_number", "ori") %in% names(data))) {
        data$unique_incident_id <- paste(data$ori, data$incident_number)
      }


      setwd("E:/ucr_data_storage/clean_data/nibrs")
      save_files(data = data,
                 year = unique(data$year),
                 file_name = paste0("nibrs_", segment, "_"),
                 save_name = paste0("nibrs_", segment, "_"))
      message(file)
      #print(names(data))
      print(nrow(data))
      #check_nibrs_data(data)
      rm(data); gc(); #Sys.sleep(5)
    }
  }
}

check_nibrs_data <- function(data) {
  summary(data$incident_date)
  data$incident_number                 <- NULL
  data$ori                             <- NULL
  data$incident_date                   <- NULL
  data$arrest_date                     <- NULL
  data$arrest_transaction_incident_num <- NULL
  data$arrest_transaction_number       <- NULL
  data$arrestee_sequence_number        <- NULL
  data$exceptional_clearance_date      <- NULL
  data$date_recovered                  <- NULL
  data$unique_incident_id              <- NULL
  print(sapply(data, function(x) sort(unique(x), na.last = TRUE)))
  message("\n\n\n\n")
}

# Check data
files <- list.files(pattern = "2020.rds")
files
for (file in files) {
  data <- readRDS(file)
  message(file)
  check_nibrs_data(data)

}


