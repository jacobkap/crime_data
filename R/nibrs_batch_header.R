source('R/utils/global_utils.R')

source("R/make_sps/make_nibrs_batch_header_1_sps.R")
source("R/make_sps/make_nibrs_batch_header_2_sps.R")
source("R/make_sps/make_nibrs_batch_header_3_sps.R")

add_incident_num_spacing <- function(data, file) {
  data <- gsub('^(.{13})', '\\1zzzzzzzzzzzz', data)
  writeLines(data, file)
}


files <- list.files(path = "E:/ucr_data_storage/raw_data/nibrs_master_files_parsed",
                    pattern = "fixed",
                    full.names = TRUE)
files
file.remove(files)

files <- list.files(path = "E:/ucr_data_storage/raw_data/nibrs_master_files_parsed",
                    pattern = "batch",
                    full.names = TRUE)
files

for (file in files) {
  year_value <- gsub("batch_header_[0-9]_|batch_header_new_|.txt", "", file)
  year_value <- gsub("E:/ucr_data_storage/raw_data/nibrs_master_files_parsed/",
                     "",
                     year_value)
  if (year_value >= 2017) {
    next
  }
  file_name <- gsub(".txt", "_fixed.txt", file)
  data <- read_lines(file)

  data <- iconv(data, "UTF-8", "ASCII", sub = "")
  data <- gsub(" conty, ", " county, ", data, ignore.case = TRUE)

  add_incident_num_spacing(data, file_name)
  message(file)
}



files <- list.files(path = "E:/ucr_data_storage/raw_data/nibrs_master_files_parsed",
                    pattern = "fixed|2017|2018|2019|202",
                    full.names = TRUE)
files <- files[grep("batch", files)]
files

final <- vector("list", length = length(files))
for (year_temp in 1991:2024) {
  folder <- "E:/ucr_data_storage/raw_data/nibrs_master_files_parsed/"
  message(year_temp)
  if (year_temp >= 2013) {
    file <- files[grep(year_temp, files)]
    batch_header <- read_ascii_setup(file,
                                    "setup_files/nibrs_batch_header_1.sps") %>%
      dplyr::select(-segment_level,
                    -incident_number)

  } else {
    batch_header_1 <- read_ascii_setup(paste0(folder, "batch_header_1_", year_temp, "_fixed.txt"),
                                     "setup_files/nibrs_batch_header_1.sps") %>%
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
                    agency_inactive_date) %>%
      distinct()

    batch_header_2 <- read_ascii_setup(paste0(folder, "batch_header_2_", year_temp, "_fixed.txt"),
                                      "setup_files/nibrs_batch_header_2.sps") %>%
      dplyr::select(-segment_level,
                    -state,
                    -incident_number,
                    -blank) %>%
      distinct()

    batch_header_3 <- read_ascii_setup(paste0(folder, "batch_header_3_", year_temp, "_fixed.txt"),
                                     "setup_files/nibrs_batch_header_3.sps") %>%
      dplyr::select(-segment_level,
                    -state,
                    -incident_number,
                    -fips_county_code_1,
                    -fips_county_code_2,
                    -fips_county_code_3,
                    -fips_county_code_4,
                    -fips_county_code_5,
                    -blank) %>%
      distinct()
    batch_header <-
      batch_header_1 %>%
      left_join(batch_header_2, by = join_by(ori)) %>%
      left_join(batch_header_3, by = join_by(ori))
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

  # Population in 2000 is missing so we use last population (i.e. 1999 population)
  # for that year.
  if (year_temp %in% 2000) {
    batch_header$current_population_1 <- batch_header$last_population_1
    batch_header$current_population_2 <- batch_header$last_population_2
    batch_header$current_population_3 <- batch_header$last_population_3
    batch_header$current_population_4 <- batch_header$last_population_4
    batch_header$current_population_5 <- batch_header$last_population_5
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


  batch_header$state <- gsub("Wyoming V2", "Wyoming", batch_header$state)
  final <- final %>%
    bind_rows(batch_header)

}
final <-
  final %>%
  mutate_if(is.character, tolower) %>%
  mutate(ori = toupper(ori))
saveRDS(final,
        paste0("E:/ucr_data_storage/clean_data/nibrs/batch_header/nibrs_batch_header_",
               min(final$year),
               "_",
               max(final$year),
               ".rds"))
