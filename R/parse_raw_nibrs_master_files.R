source('R/utils/global_utils.R')
setwd("D:/ucr_data_storage/raw_data/nibrs_from_fbi")


files <- list.files()
files <- data.frame(file = files,
                    year = readr::parse_number(files))
files <-
  files %>%
  mutate(year = fix_years(year)) %>%
  arrange(year)
files
segment_levels <- data.frame(names = c("batch_header_1",
                                       "batch_header_2",
                                       "batch_header_3",
                                       "batch_header_new",
                                       "administrative_segment",
                                       "offense_segment",
                                       "property_segment",
                                       "victim_segment",
                                       "offender_segment",
                                       "arrestee_segment",
                                       "group_b_arrest_report_segment",
                                       "window_exceptional_clearance_segment",
                                       "window_recovered_property_segment",
                                       "window_arrestee_segment"),
                             levels = c("B1",
                                        "B2",
                                        "B3",
                                        "BH",
                                        "01",
                                        "02",
                                        "03",
                                        "04",
                                        "05",
                                        "06",
                                        "07",
                                        "W1",
                                        "W3",
                                        "W6"))
segment_levels

for (n in 1:nrow(files)) {
  setwd("D:/ucr_data_storage/raw_data/nibrs_from_fbi")
  print(files$file[n])
  data <- read_lines(files$file[n])
 # data <- data.table::fread(files$file[n], sep = NULL, header = FALSE, strip.white = FALSE)
 # data <- data$V1
  head(data)
  length(data)
 print(table(substr(data, 1, 2)))

  for (i in 1:nrow(segment_levels)) {
    temp <- data[substr(data, 1, 2) %in% segment_levels$levels[i]]
    if (length(temp) > 0) {
      setwd("D:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
      write_lines(temp, file = paste0(segment_levels$names[i],
                                      "_", files$year[n], ".txt"))
    }
    rm(temp); gc(); message(segment_levels$names[i])
  }
  rm(data); gc(); Sys.sleep(2)
  message(files$file[n])
}
