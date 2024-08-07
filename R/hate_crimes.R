source(here::here('R/utils/global_utils.R'))
source(here::here('R/utils/hate_crime_utils.R'))

# Some years have embedded nuls in the raw data
fix_embedded_nulls <- function(file) {
  r = readBin(file, raw(), file.info(file)$size)
  r[r==as.raw(0)] = as.raw(0x20) ## replace with 0x20 = <space>
  writeBin(r, file)
}
#fix_embedded_nulls(files[5])

hate_crimes <- get_hate_crimes()
#
#
table(hate_crimes$year)
table(hate_crimes$year[hate_crimes$hate_crime_incident_present_flag %in% "one or more hate crime incidents present"])

table(hate_crimes$year[hate_crimes$hate_crime_incident_present_flag %in% "one or more hate crime incidents present"], hate_crimes$month[hate_crimes$hate_crime_incident_present_flag %in% "one or more hate crime incidents present"])
names(hate_crimes)
summary(hate_crimes$population)
sort(unique(hate_crimes$bias_motivation_offense_1))
table(hate_crimes$bias_motivation_offense_1)
table(hate_crimes$bias_motivation_offense_1[hate_crimes$year == 2019])
table(hate_crimes$bias_motivation_offense_1[hate_crimes$year == 2021])
sort(unique(hate_crimes$location_code_offense_1))
sort(unique(hate_crimes$ucr_offense_code_1))
table(hate_crimes$hate_crime_incident_present_flag)
table(hate_crimes$hate_crime_incident_present_flag, hate_crimes$year)
table(hate_crimes$state)
table(hate_crimes$state_abb)
table(hate_crimes$year)
table(hate_crimes$month)
table(hate_crimes$month_num)
table(hate_crimes$day_of_week)
table(hate_crimes$offenders_race_as_a_group)
table(hate_crimes$total_offenders)
table(hate_crimes$total_num_of_individual_victims)

sapply(hate_crimes[, grep("vic_type_", names(hate_crimes))], table)
sapply(hate_crimes[, grep("quarter_activity", names(hate_crimes))], table)
summary(hate_crimes)

table(hate_crimes$hate_crime_incident_present_flag, hate_crimes$year)
#
setwd(here::here("E:/ucr_data_storage/clean_data/hate_crimes"))
hate_crimes <- hate_crimes %>% rename(hate_crime_incident_present = hate_crime_incident_present_flag)
save_files(data = hate_crimes,
           year = "1991_2021",
           file_name = "ucr_hate_crimes_",
           save_name = "ucr_hate_crimes_")
save_as_zip("ucr_hate_crimes_1991_2021_")

get_hate_crimes <- function() {

  setwd(here::here("E:/ucr_data_storage/raw_data/hate_crime_from_fbi"))
  files <- list.files()
  print(files)
  hate_crimes <- data.frame()
  for (file in files) {
    fix_embedded_nulls(file)
    batch_header <- read_ascii_setup(file,
                                     here::here("setup_files/ucr_hate_crimes_batch_header.sps")) %>%
      dplyr::filter(hate_crime_record_type == "BH") %>%
      dplyr::select(-incident_number,
                    -state_abbreviation,
                    -state,
                    -hate_crime_record_type)
    batch_header$date_ori_went_nibrs[batch_header$date_ori_went_nibrs %in% 0] <- NA
    batch_header <-
      batch_header %>%
      dplyr::mutate(hate_crime_incident_present_flag = "no hate crime incidents present",
                    date_ori_was_added   = ymd(date_ori_was_added),
                    date_ori_went_nibrs  = ymd(date_ori_went_nibrs),
                    agency_inactive_date = ymd(agency_inactive_date),
                    current_population_1 = as.numeric(current_population_1),
                    current_population_2 = as.numeric(current_population_2),
                    current_population_3 = as.numeric(current_population_3),
                    current_population_4 = as.numeric(current_population_4),
                    current_population_5 = as.numeric(current_population_5),
                    fbi_field_office     = as.character(fbi_field_office)) %>%
      dplyr::mutate(population = rowSums(.[, grepl("current_population",
                                                   names(.))], na.rm = TRUE)) %>%
      dplyr::select(-matches("^msa_code_[4-5]"),
                    -matches("^ucr_county_code_"),
                    -matches("^current_population_"),
                    -matches("^last_population_"),
                    -matches("^fips_county_"))


    incident_report <- read_ascii_setup(file,
                                        here::here("setup_files/ucr_hate_crimes_incident_report.sps")) %>%
      dplyr::filter(hate_crime_record_type == "IR") %>%
      dplyr::select(-hate_crime_record_type)

    incident_report <- spread_type_of_victim(incident_report)

    batch_header$hate_crime_incident_present_flag[batch_header$ori %in% incident_report$ori] <- "one or more hate crime incidents present"

    ## For when special character (accent mark) appears in name
    batch_header$city_name <- iconv(batch_header$city_name, from = "UTF-8",
                                    to = "ASCII//TRANSLIT")
    incident_report$incident_number <- iconv(incident_report$incident_number, from = "UTF-8",
                                             to = "ASCII//TRANSLIT")


    data <-
      batch_header %>%
      dplyr::left_join(incident_report, by = "ori9", multiple = "all") %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate_at(vars(matches("[0-9]$")), as.character)
    data$state[data$state %in% c("69", "98", "99")] <- NA
    # data$core_city <- as.character(data$core_city)
    # data$agency_nibrs_flag <- as.character(data$agency_nibrs_flag)
    # data$covered_by_ori <- as.character(data$covered_by_ori)
    message(unique(data$year))
    hate_crimes <- dplyr::bind_rows(hate_crimes, data)
    message(file)
  }

  source(here::here("R/crosswalk.R"))
  crosswalk <- read_merge_crosswalks()
  crosswalk_cols <- names(crosswalk)
  crosswalk_cols <- crosswalk_cols[!crosswalk_cols %in% c("ori", "ori9")]

  hate_crimes <-
    hate_crimes %>%
    dplyr::mutate(ori9          = toupper(ori9)) %>%
    dplyr::left_join(crosswalk, by = "ori9") %>%
    dplyr::mutate(incident_date = ymd(incident_date),
                  month         = as.character(lubridate::month(incident_date,
                                                                label = TRUE,
                                                                abbr = FALSE)),
                  month_num     = lubridate::month(incident_date),
                  day_of_week   = as.character(lubridate::wday(incident_date,
                                                               label = TRUE,
                                                               abbr = FALSE)),
                  unique_id     = paste(year,
                                        ori9,
                                        incident_number, sep = "_"),
                  state_abb     = make_state_abb(state)) %>%
    dplyr::arrange(desc(year),
                   ori) %>%
    dplyr::select(ori,
                  ori9,
                  hate_crime_incident_present_flag,
                  state,
                  state_abb,
                  incident_date,
                  month,
                  month_num,
                  day_of_week,
                  year,
                  population,
                  agency_name,
                  city_name,
                  misc_cols,
                  crosswalk_cols,
                  matches("^msa"),
                  matches("^fips_county_code_[0-9]"),
                  incident_number,
                  unique_id,
                  total_num_of_individual_victims,
                  total_offenders,
                  offenders_race_as_a_group,
                  matches("^number_of_victims"),
                  matches("^ucr_offense"),
                  matches("^bias_motivation"),
                  matches("^location"),
                  matches("^vic_type"))

  hate_crimes <- data.frame(hate_crimes)
  return(hate_crimes)
}


spread_type_of_victim <- function(data) {

  victim_type_cols <- c("individual",
                        "business",
                        "government",
                        "society",
                        "unknown",
                        "financial",
                        "religious",
                        "other")
  for (type_col in victim_type_cols) {
    for (i in 1:10) {
      col_name <- paste0("vic_type_", type_col, "_offense_", i)
      temp <- data[, paste0("type_of_victims_offense_", i)]
      temp <- gsub("IB", "I B", temp)
      temp <- gsub("B |B$", "Business ", temp)
      temp <- gsub("I |I$", "Individual ", temp)
      temp <- gsub("F |F$", "Financial Institution ", temp)
      temp <- gsub("G |G$", "Government ", temp)
      temp <- gsub("R |R$", "Religious Organization ", temp)
      temp <- gsub("S |S$", "Society/Public ", temp)
      temp <- gsub("O |O$", "Other ", temp)
      temp <- gsub("U |U$", "Unknown ", temp)

      data[, col_name] <- 0

      data[, col_name][grepl(type_col, temp, ignore.case = TRUE)] <- 1

    }
  }

  data <-
    data %>%
    dplyr::select(-matches("^type_of_victims_offense_"))

  return(data)
}

