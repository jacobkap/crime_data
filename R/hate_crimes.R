source('C:/Users/user/Dropbox/R_project/crime_data/R/utils/global_utils.R')
hate_crimes <- agg_hate_crimes()
hate_crimes <- clean_hate_crimes(hate_crimes)


names(hate_crimes)
sort(unique(hate_crimes$bias_motivation_offense_1))
sort(unique(hate_crimes$location_code_offense_1))
sort(unique(hate_crimes$ucr_offense_code_1))
table(hate_crimes$hate_crime_incident_present_flag)
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

table(hate_crimes$hate_crime_incident_present_flag)
table(hate_crimes$hate_crime_incident_present_flag, hate_crimes$year)

setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/hate_crimes")
save_files(data = hate_crimes,
           year = "1992_2017",
           file_name = "ucr_hate_crimes_",
           save_name = "ucr_hate_crimes_")
save_as_zip("ucr_hate_crimes_1992_2017_")

agg_hate_crimes <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/hate_crimes")
  hate_crimes <- data.frame()
  for (year in 1992:2017) {
    message(year)

    if (year <= 2016) {
      data <- get_hate_crime_from_nacjd_data(year)
    } else {
      data <- get_hate_crime_from_fbi_data(year)
    }


    hate_crimes <-
      data %>%
      dplyr::mutate(INCIDENT_DATE              = lubridate::ymd(INCIDENT_DATE),
                    INCIDENT_DATE              = as.character(INCIDENT_DATE),
                    COVERED_BY_ORI             = as.character(COVERED_BY_ORI),
                    UCR_OFFENSE_CODE_4         = as.character(UCR_OFFENSE_CODE_4),
                    LOCATION_CODE_OFFENSE_4    = as.character(LOCATION_CODE_OFFENSE_4),
                    BIAS_MOTIVATION_OFFENSE_4  = as.character(BIAS_MOTIVATION_OFFENSE_4),
                    UCR_OFFENSE_CODE_5         = as.character(UCR_OFFENSE_CODE_5),
                    LOCATION_CODE_OFFENSE_5    = as.character(LOCATION_CODE_OFFENSE_5),
                    BIAS_MOTIVATION_OFFENSE_5  = as.character(BIAS_MOTIVATION_OFFENSE_5),
                    DATE_ORI_WENT_NIBRS        = as.character(DATE_ORI_WENT_NIBRS),
                    FBI_FIELD_OFFICE           = as.character(FBI_FIELD_OFFICE)) %>%
      dplyr::mutate(population = rowSums(.[, grepl("current_population",
                                                   names(.))],
                                         na.rm = TRUE)) %>%
      dplyr::select(-matches("^msa_code_[4-5]"),
                    -matches("^ucr_county_code_"),
                    -matches("^current_population_"),
                    -matches("^last_population_"),
                    -matches("^fips_county_")) %>%
      dplyr::bind_rows(hate_crimes)

    rm(data); gc()
  }
  return(hate_crimes)

}

clean_hate_crimes <- function(data) {
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/hate_crime_utils.R')
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
  crosswalk <- read_merge_crosswalks()
  crosswalk_cols <- names(crosswalk)
  crosswalk_cols <- crosswalk_cols[!crosswalk_cols %in% c("ori", "ori9")]


  data <-
    data %>%
    dplyr::rename_all(tolower) %>%
    dplyr::select(-starts_with("federal")) %>%
    dplyr::rename(state = numeric_state_code,
                  ori9  = originating_agency_identifier,
                  year  = master_file_year,
                  total_num_of_individual_victims = total_number_of_individual_victims,
                  date = incident_date) %>%
    dplyr::left_join(crosswalk, by = "ori9") %>%
    dplyr::mutate_if(is.character, tolower) %>%
    dplyr::mutate(date          = lubridate::ymd(date),
                  month         = as.character(lubridate::month(date,
                                                                label = TRUE,
                                                                abbr = FALSE)),
                  month_num     = lubridate::month(date),
                  day_of_week   = as.character(lubridate::wday(date,
                                                               label = TRUE,
                                                               abbr = FALSE)),
                  #To fix issue where codebook can't accept Date format
                  date                   = as.character(date),
                  unique_id              = paste(year, ori9, incident_number, sep = "_"),
                  state_abb              = make_state_abb(state),
                  population_group       = toupper(population_group),
                  population_group       = stringr::str_replace_all(population_group,
                                                                    population_group_fix),
                  core_city              = stringr::str_replace_all(core_city,
                                                             core_city_fix),
                  offenders_race_as_a_group = stringr::str_replace_all(offenders_race_as_a_group,
                                                                       offender_race_as_group_fix)) %>%
    dplyr::mutate_at(vars(matches("^ucr_offense")), stringr::str_replace_all,
                     ucr_offense_codes_fix) %>%
    dplyr::mutate_at(vars(matches("^bias_motivation")), stringr::str_replace_all,
                     bias_motivation_fix) %>%
    dplyr::mutate_at(vars(matches("^location")), stringr::str_replace_all,
                     location_fix) %>%
    dplyr::mutate_if(is.character, tolower) %>%
    dplyr::mutate(ori                    = toupper(ori),
                  ori9                   = toupper(ori9)) %>%
    dplyr::arrange(desc(year),
                   ori) %>%
    dplyr::select(ori,
                  ori9,
                  hate_crime_incident_present_flag,
                  state,
                  state_abb,
                  date,
                  month,
                  month_num,
                  day_of_week,
                  year,
                  population,
                  agency_name,
                  city_name,
                  crosswalk_cols,
                  misc_cols,
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
                  matches("^vic_type_individual"),
                  matches("^vic_type_business"),
                  matches("^vic_type_government"),
                  matches("^vic_type_society"),
                  matches("^vic_type_unknown"),
                  matches("^vic_type_financial"),
                  matches("^vic_type_religious"),
                  matches("^vic_type_other"),
                  matches("^vic_type_unknown"))

  return(data)
}

get_hate_crime_from_fbi_data <- function(year) {

  ir <- asciiSetupReader::spss_ascii_reader(paste0("ucr_hate_crimes_raw_", year, ".txt"),
                                            paste0("ucr_hate_crimes_incident_record_", year, ".sps"))
  ir <- ir[ir$hate_crime_record_type == "IR", ]
  ir$hate_crime_record_type <- NULL
  ir <- spread_type_of_victim(ir)

  bh <- asciiSetupReader::spss_ascii_reader(paste0("ucr_hate_crimes_raw_", year, ".txt"),
                                            paste0("ucr_hate_crimes_batch_header_", year, ".sps"))
  bh <-
    bh %>%
    dplyr::filter(hate_crime_record_type == "BH") %>%
    dplyr::select(-incident_number,
                  -state_abbreviation,
                  -numeric_state_code,
                  -hate_crime_record_type) %>%
    dplyr::mutate(hate_crime_incident_present_flag = "no hate crime incidents present")
  bh$hate_crime_incident_present_flag[bh$ori %in% ir$ori] <- "one or more hate crime incidents present"

  data <-
    bh %>%
    left_join(ir) %>%
    dplyr::rename_all(toupper) %>%
    dplyr::rename(ORIGINATING_AGENCY_IDENTIFIER = ORI) %>%
    dplyr::mutate_at(vars(matches("NUMBER_OF_VICTIMS_OFFENSE_")), readr::parse_number)

  return(data)
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
  victim_type_names <- c("individual victim",
                         "business victim",
                         "government victim",
                         "society/public victim",
                         "unknown victim",
                         "financial institution victim",
                         "religious organization victim",
                         "other victim")
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

      data[, col_name] <- "not victim"

      data[, col_name][grepl(type_col, temp,
                             ignore.case = TRUE)] <- victim_type_names[victim_type_cols == type_col]

    }
  }

  data <-
    data %>%
    dplyr::select(-matches("^type_of_victims_offense_"))

  return(data)
}

get_hate_crime_from_nacjd_data <- function(year) {
  data <- spss_ascii_reader(paste0("ucr_hate_crimes_incident_record_",
                                   year, ".txt"),
                            paste0("ucr_hate_crimes_incident_record_", year,
                                   ".sps"))

  batch_header <-  spss_ascii_reader(paste0("ucr_hate_crimes_batch_header_",
                                            year, ".txt"),
                                     paste0("ucr_hate_crimes_batch_header_",
                                            year, ".sps"),
                                     keep_columns = c("ORI",
                                                      "HC_FLAG",
                                                      "MASTERYR"),
                                     value_label_fix = FALSE)
  batch_header$HATE_CRIME_INCIDENT_PRESENT_FLAG <-
    stringr::str_replace_all(batch_header$HATE_CRIME_INCIDENT_PRESENT_FLAG,
                             c("^0$" = "No hate crime incidents present",
                               "^1$" = "One or more hate crime incidents present"))
  names(batch_header) <- gsub("ORI.*", "ORIGINATING_AGENCY_IDENTIFIER",
                              names(batch_header))

  data$ORIGINATING_AGENCY_IDENTIFIER <- NULL
  data$POPULATION_GROUP <- NULL

  ori <- spss_ascii_reader(paste0("ucr_hate_crimes_incident_record_",
                                  year, ".txt"),
                           paste0("ucr_hate_crimes_incident_record_",
                                  year, ".sps"),
                           keep_columns = c("ORIGINATING_AGENCY_IDENTIFIER",
                                            "POPULATION_GROUP"),
                           value_label_fix = FALSE)
  data <-
    data %>%
    dplyr::bind_cols(ori) %>%
    dplyr::rename(COUNTRY_REGION = COUNTY_REGION) %>%
    dplyr::right_join(batch_header) %>%
    dplyr::select(-IR_RECORD_TYPE,
                  -STATE_ALPHA_ABBREVIATION)
  names(data) <- gsub("_public", "", names(data), ignore.case = TRUE)
  names(data) <- gsub("victim_type", "VIC_TYPE", names(data), ignore.case = TRUE)

  return(data)
}

