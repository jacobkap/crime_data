source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
hate_crimes <- agg_hate_crimes()
hate_crimes <- clean_hate_crimes(hate_crimes)
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/hate_crimes")
save_files(data = hate_crimes,
           year = "1992_2017",
           file_name = "ucr_hate_crimes_",
           save_name = "ucr_hate_crimes_")
zip::zip(zipfile = "ucr_hate_crimes_1992_2017.zip",
         files = list.files())

agg_hate_crimes <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/hate_crimes")
  hate_crimes <- data.frame()
  for (year in 1992:2017) {
    message(year)
    data <- spss_ascii_reader(paste0("ucr_hate_crimes_incident_record_",
                                     year, ".txt"),
                              paste0("ucr_hate_crimes_incident_record_", year,
                                     ".sps"))
    data$ORIGINATING_AGENCY_IDENTIFIER <- NULL

    ori <- spss_ascii_reader(paste0("ucr_hate_crimes_incident_record_",
                                    year, ".txt"),
                             paste0("ucr_hate_crimes_incident_record_", year,
                                    ".sps"),
                             keep_columns = "ORIGINATING_AGENCY_IDENTIFIER",
                             value_label_fix = FALSE)
    data <- bind_cols(ori, data)
    data$INCIDENT_DATE <- lubridate::ymd(data$INCIDENT_DATE)

    data$INCIDENT_DATE              <- as.character(data$INCIDENT_DATE)
    data$COVERED_BY_ORI             <- as.character(data$COVERED_BY_ORI)
    data$UCR_OFFENSE_CODE_5         <- as.character(data$UCR_OFFENSE_CODE_5)
    data$LOCATION_CODE_OFFENSE_5    <- as.character(data$LOCATION_CODE_OFFENSE_5)
    data$BIAS_MOTIVATION_OFFENSE_5  <- as.character(data$BIAS_MOTIVATION_OFFENSE_5)
    hate_crimes <- bind_rows(hate_crimes, data)
    rm(data); gc()
  }
  return(hate_crimes)

}

clean_hate_crimes <- function(data) {
  misc_cols <- c("population_group",
                 "country_division",
                 "county_region",
                 "agency_indicator",
                 "core_city",
                 "covered_by_ori",
                 "fbi_field_office",
                 "judicial_district",
                 "agency_nibrs_flag",
                 "agency_inactive_date",
                 "data_source",
                 "date_ori_was_added",
                 "date_ori_went_nibrs",
                 "quarter_of_the_year")
  ucr_offense_codes <- c( "agg asslt"            = "aggravated assault",
                          "simple asslt"         = "simple assault",
                          "burg/b & e"           = "burglary, breaking and entering",
                          "drug/narc violations" = "drug/narcotic violations",
                          "theft of mv parts"    = "theft of motor vehicle parts",
                          "sex asslt w/object"   = "sexual assault with object",
                          "false pretenses/swindle/conf game" = "false pretenses/swindle/confidence game",
                          "murder/non-neg manslaughter" = "murder/non-negligent manslaughter",
                          "extort/blackmail"     = "extortion/blackmail",
                          "destruct/vandalism"   = "destruction of property/vandalism",
                          "theft from coin-op machine" = "theft from coin-operated machine",
                          "drug equip violations"  = "drug equipment violations" )
  bias_motivation <- c("anti-am indian" = "anti-american indian")
  location <- c("drug store/dr office/hosp" = "drug store/dr office/hospital",
                "rental stor. facil."       = "rental storage facility")

  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
  crosswalk <- read_merge_crosswalks()
  crosswalk_cols <- names(crosswalk)
  crosswalk_cols <- crosswalk_cols[!crosswalk_cols %in% c("ori", "ori9")]

  names(data) <- gsub("_public", "", names(data), ignore.case = TRUE)
  names(data) <- gsub("victim_type", "vic_type", names(data), ignore.case = TRUE)



  data <-
    data %>%
    dplyr::rename_all(tolower) %>%
    dplyr::select(-ir_record_type,
                  -state_alpha_abbreviation,
                  -starts_with("federal")) %>%
    dplyr::rename(state       = numeric_state_code,
           ori9        = originating_agency_identifier,
           year        = master_file_year,
           total_num_of_individual_victims = total_number_of_individual_victims) %>%
    dplyr::left_join(crosswalk, by = "ori9") %>%
    dplyr::mutate_if(is.character, tolower) %>%
    dplyr::mutate(incident_date          = lubridate::ymd(incident_date),
                  incident_month         = as.character(lubridate::month(incident_date,
                                                              label = TRUE,
                                                              abbr = FALSE)),
                  incident_month_num     = lubridate::month(incident_date),
                  incident_day_of_week   = as.character(lubridate::wday(incident_date,
                                                                        label = TRUE,
                                                                        abbr = FALSE)),
                  incident_day_of_month  = lubridate::mday(incident_date),
                  #To fix issue where codebook can't accept Date format
                  incident_date          = as.character(incident_date),
                  ori                    = toupper(ori),
                  ori9                   = toupper(ori9),
                  unique_id              = paste(year, ori9, incident_number, sep = "_"),
                  state_abb              = make_state_abb(state)) %>%
    dplyr::mutate_at(vars(matches("^ucr_offense")), stringr::str_replace_all,
                     ucr_offense_codes) %>%
    dplyr::mutate_at(vars(matches("^bias_motivation")), stringr::str_replace_all,
                     bias_motivation) %>%
    dplyr::mutate_at(vars(matches("^location")), stringr::str_replace_all,
                     location) %>%
    dplyr::arrange(desc(year), ori) %>%
    dplyr::select(ori,
                  ori9,
                  state,
                  state_abb,
                  year,
                  agency_name,
                  city_name,
                  crosswalk_cols,
                  misc_cols,
                  matches("^ucr_county"),
                  matches("^msa"),
                  matches("^current_population"),
                  matches("^last_population"),
                  matches("^fips_county_code_[0-9]"),
                  matches("activity"),
                  incident_number,
                  unique_id,
                  incident_date,
                  incident_month,
                  incident_month_num,
                  incident_day_of_week,
                  incident_day_of_month,
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


