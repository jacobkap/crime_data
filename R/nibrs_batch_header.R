here::here("setup_files/nibrs_batch_header_1_segment.sps")
library(here)
source(here('R/utils/global_utils.R'))
source(here('R/utils/saving_utils.R'))

source("C:/Users/jkkap/Dropbox/R_project/crime_data/R/make_sps/make_nibrs_batch_header_1_sps.R")
source("C:/Users/jkkap/Dropbox/R_project/crime_data/R/make_sps/make_nibrs_batch_header_2_sps.R")
source("C:/Users/jkkap/Dropbox/R_project/crime_data/R/make_sps/make_nibrs_batch_header_3_sps.R")
save_as_zip("nibrs_batch_headers_", pattern = "batch_header")
library(dplyr)
library(asciiSetupReader)
library(readr)

add_incident_num_spacing <- function(data, file) {
  data <- gsub('^(.{13})', '\\1zzzzzzzzzzzz', data)
  writeLines(data, file)
}
#
# setwd("D:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
# files <- list.files(pattern = "batch")
# files

# for (file in files) {
#   year_value <- gsub("batch_header_[0-9]_|batch_header_new_|.txt", "", file)
#   if (year_value >= 2017) {
#     next
#   }
#   file_name <- gsub(".txt", "_fixed.txt", file)
#   data <- read_lines(file)
#   add_incident_num_spacing(data, file_name)
#   message(file)
# }



setwd("D:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
files <- list.files(pattern = "fixed|2017|2018|2019|202")
files <- files[grep("batch", files)]
files

for (year_temp in 1991:2021) {
  setwd("D:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
  message(year_temp)
  if (year_temp >= 2013) {
    file <- files[grep(year_temp, files)]
    batch_header <- read_ascii_setup(file,
                                     here::here("setup_files/nibrs_batch_header_1.sps")) %>%
      dplyr::select(-segment_level,
                    -incident_number)

  } else {
    batch_header_1 <- read_ascii_setup(paste0("batch_header_1_", year_temp, "_fixed.txt"),
                                       here::here("setup_files/nibrs_batch_header_1.sps")) %>%
      dplyr::select(state,
                    ori,
                    date_ori_was_added,
                    date_ori_went_nibrs,
                    city_name,
                    state_abbreviation,
                    population_group,
                    country_division,
                    country_region,
                    agency_indicator,
                    core_city,
                    covered_by_ori,
                    fbi_field_office,
                    judicial_district,
                    agency_nibrs_flag,
                    agency_inactive_date)

    batch_header_2 <- read_ascii_setup(paste0("batch_header_2_", year_temp, "_fixed.txt"),
                                       here::here("setup_files/nibrs_batch_header_2.sps")) %>%
      dplyr::select(-segment_level,
                    -state,
                    -incident_number,
                    -blank)

    batch_header_3 <- read_ascii_setup(paste0("batch_header_3_", year_temp, "_fixed.txt"),
                                       here::here("setup_files/nibrs_batch_header_3.sps")) %>%
      dplyr::select(-segment_level,
                    -state,
                    -incident_number,
                    -fips_county_code_1,
                    -fips_county_code_2,
                    -fips_county_code_3,
                    -fips_county_code_4,
                    -fips_county_code_5,
                    -blank)
    batch_header <-
      batch_header_1 %>%
      left_join(batch_header_2) %>%
      left_join(batch_header_3)
  }

  for (i in 1:ncol(batch_header)) {
    batch_header$temp <- batch_header[, i]
    batch_header$temp <- gsub(" V[0-9]{2}$", "", batch_header$temp)
    batch_header[, i] <- batch_header$temp
    batch_header$temp <- NULL
  }
  if (-any(grepl("year", names(batch_header)))) {
    batch_header$year <- year_temp
  }

  batch_header <-
    batch_header %>%
    dplyr::mutate(current_population_1 = as.numeric(current_population_1),
                  current_population_2 = as.numeric(current_population_2),
                  current_population_3 = as.numeric(current_population_3),
                  current_population_4 = as.numeric(current_population_4),
                  current_population_5 = as.numeric(current_population_5)) %>%
    dplyr::mutate(population = current_population_1 +
                    current_population_2 +
                    current_population_3 +
                    current_population_4 +
                    current_population_5) %>%
    dplyr::select(ori,
                  year,
                  state,
                  population,
                  everything()) %>%
    dplyr::rename(september_window_record_submitte = september_window_record_submitted)

  setwd("D:/ucr_data_storage/clean_data/nibrs")
  save_files(data = batch_header,
             year = unique(batch_header$year),
             file_name = "nibrs_batch_header_",
             save_name = "nibrs_batch_header_")

}
