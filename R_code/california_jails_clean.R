source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/california_jails_utils.R')


jails <- clean_jails()
california_jails_facility_monthly <- jails[[1]]
california_jails_county_monthly   <- jails[[2]]
california_jails_county_quarterly <- jails[[3]]

setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/california_jails")
save_files(california_jails_facility_monthly,
           "_1995_2018",
           file_name = "california_jail_facility_monthly",
           save_name = "california_jail_facility_monthly")
save_files(california_jails_county_monthly,
           "_1995_2018",
           file_name = "california_jail_county_monthly",
           save_name = "california_jail_county_monthly")
save_files(california_jails_county_quarterly,
           "_1995_2018",
           file_name = "california_jail_county_quarterly",
           save_name = "california_jail_county_quarterly")

save_as_zip("california_jail_survey_")

clean_jails <- function() {
  library(tidyverse)
  library(rvest)
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/cali_jails")
  facility_files         <- list.files(pattern = "facility_monthly")
  county_monthly_files   <- list.files(pattern = "county_monthly")
  county_quarterly_files <- list.files(pattern = "county_quarterly")

  facility         <- data.frame(stringsAsFactors = FALSE)
  county_monthly   <- data.frame(stringsAsFactors = FALSE)
  county_quarterly <- data.frame(stringsAsFactors = FALSE)
  for (i in 1:24) {
    facility <-
      read_html(facility_files[i]) %>%
      html_node("table") %>%
      html_table(header = TRUE) %>%
      dplyr::mutate_all(as.character) %>%
      dplyr::mutate_all(fix_abbreviations) %>%
      dplyr::mutate_at(5:10, parse_number) %>%
      dplyr::mutate(Jurisdiction = gsub("Dept.$", "Department",
                                        Jurisdiction)) %>%
      bind_rows(facility)

    num_cols <- c(4:14, 16:34)
    if (i >= 8) num_cols <- c(4:14, 16:39)
    county_monthly <-
      read_html(county_monthly_files[i]) %>%
      html_node("table") %>%
      html_table(header = TRUE) %>%
      dplyr::mutate_all(as.character) %>%
      dplyr::mutate_all(fix_abbreviations) %>%
      dplyr::mutate_at(num_cols, parse_number) %>%
      dplyr::mutate(Jurisdiction = gsub("Dept.$", "Department",
                                        Jurisdiction)) %>%
      bind_rows(county_monthly)

    county_quarterly <-
      read_html(county_quarterly_files[i]) %>%
      html_node("table") %>%
      html_table(header = TRUE) %>%
      dplyr::mutate_all(as.character) %>%
      dplyr::mutate_all(fix_abbreviations) %>%
      dplyr::mutate_at(4:9, parse_number) %>%
      dplyr::mutate(Jurisdiction = gsub("Dept.$", "Department",
                                        Jurisdiction)) %>%
      bind_rows(county_quarterly)

    message(i)

  }

  names(facility)         <- fix_names(names(facility))
  names(county_monthly)   <- fix_names(names(county_monthly))
  names(county_quarterly) <- fix_names(names(county_quarterly))

  names(facility)         <- stringr::str_replace_all(names(facility),
                                                      name_changes)
  names(county_monthly)   <- stringr::str_replace_all(names(county_monthly),
                                                      name_changes)
  names(county_quarterly) <- stringr::str_replace_all(names(county_quarterly),
                                                      name_changes)

  facility         <- left_join(county_match, facility)
  county_monthly   <- left_join(county_match, county_monthly)
  county_quarterly <- left_join(county_match, county_quarterly)

  facility         <- facility %>%
    dplyr::arrange(desc(year), month, census_county_name)
  county_monthly   <- county_monthly %>%
    dplyr::arrange(desc(year), month, census_county_name)
  county_quarterly <- county_quarterly %>%
    dplyr::arrange(desc(year), quarter, census_county_name)

  # Fix dates for column highest pop occurred on
  county_monthly$day_of_highest_count <-
    lubridate::mdy(county_monthly$day_of_highest_count)
  county_monthly$day_of_highest_count <-
    as.character(county_monthly$day_of_highest_count)



  jails <- list(facility, county_monthly, county_quarterly)
  return(jails)
}


