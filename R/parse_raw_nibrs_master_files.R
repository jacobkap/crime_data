source(here::here('R/utils/global_utils.R'))
setwd("D:/ucr_data_storage/raw_data/nibrs_from_fbi")


files <- list.files()
files <- data.frame(file = files,
                    year = readr::parse_number(files),
                    stringsAsFactors = FALSE)
files <-
  files %>%
  mutate(year = fix_years(year)) %>%
  arrange(desc(year))

segment_levels <- data.frame(names = c("batch_header_1",
                                       "batch_header_2",
                                       "batch_header_3",
                                       "administrative_segment",
                                       "offense_segment",
                                       "property_segment",
                                       "victim_segment",
                                       "offender_segment",
                                       "arrestee_segment",
                                       "group_b_arrest_report_segment",
                                       "window_exceptional_clearance_segment",
                                       "window_recovered_property_segment",
                                       "window_arrestee_segment",
                                       "batch_header_segment"),
                             levels = c("B1",
                                        "B2",
                                        "B3",
                                        "01",
                                        "02",
                                        "03",
                                        "04",
                                        "05",
                                        "06",
                                        "07",
                                        "W1",
                                        "W3",
                                        "W6",
                                        "BH"),
                             stringsAsFactors = FALSE)

for (n in 1:nrow(files)) {
  setwd("D:/ucr_data_storage/raw_data/nibrs_from_fbi")
print(files$file[n])
  #data <- read_lines(files$file[n])
  data <- data.table::fread(files$file[n], sep = NULL, header = FALSE)
  data <- data$V1
  print(table(substr(data, 1, 2)))

  for (i in 1:nrow(segment_levels)) {


    temp <- data[substr(data, 1, 2) %in% segment_levels$levels[i]]
    if (length(temp) > 0) {
      setwd("D:/ucr_data_storage/raw_data/nibrs_master_files_parsed")
      write_lines(temp, path = paste0(segment_levels$names[i],
                                      "_", files$year[n], ".txt"))
    }
  }
  message(files$file[n])
}


keep_going <- TRUE
skip <- 0
n_max <- 1000000
while(keep_going) {
  temp <- read_lines(files$file[n], skip = skip, n_max = n_max)
  data <- data.table::fread(files$file[n], sep = NULL, header = FALSE, skip = skip, nrows = n_max)
  data <- data$V1
  print(table(substr(data, 1, 2)))
  skip <- skip + 1000000
  print(length(data))
  if (nrow(data) == 0) {
    keep_going <- FALSE
  }
  gc()
}
