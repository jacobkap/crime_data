# Making UCR Offenses Known and Clearances By Arrest into Yearly ----------
make_ucr_yearly <- function() {
  offenses_known_yearly <- data.frame()
  for (year in 1960:2016) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    load(paste0("ucr_offenses_known_monthly_", year, ".rda"))
    do.call(assign, list("data", as.name(paste0("ucr_offenses_known_monthly_", year))))
    do.call(rm, list(paste0("ucr_offenses_known_monthly_", year)))

    pop_cols <- c("total_population",
                  "population_1",
                  "population_2",
                  "population_3")


    agency_desc_cols <- c("ori9",
                          "year",
                          "month",
                          "date",
                          "state",
                          "state_abb",
                          "months_reported",
                          "fips_state_code",
                          "fips_county_code",
                          "fips_state_county_code",
                          "fips_place_code",
                          "fips_state_place_code",
                          "agency_type",
                          "agency_subtype_1",
                          "agency_subtype_2",
                          "group_number",
                          "division",
                          "city_sequence_number",
                          "core_city_indication",
                          "covered_by_code",
                          "field_office",
                          "total_population",
                          "population_1",
                          "county_1",
                          "msa_1",
                          "population_2",
                          "county_2",
                          "msa_2",
                          "population_3",
                          "county_3",
                          "msa_3",
                          "special_mailing_group",
                          "special_mailing_address",
                          "agency_name",
                          "mailing_address_line_1",
                          "mailing_address_line_2",
                          "mailing_address_line_3",
                          "mailing_address_line_4",
                          "zip_code")

    temp <-
      data %>%
      dplyr::select(agency_desc_cols,
                    "ori")
    temp <- temp[!duplicated(temp$ori), ]

  data <-
    data %>%
    dplyr::select(-agency_desc_cols) %>%
    dplyr::group_by(ori) %>%
    dplyr::summarize_all(sum) %>%
    dplyr::left_join(temp) %>%
    dplyr::select(starting_cols,
                  cross_names,
                  other_cols,
                  starts_with("officer"),
                  starts_with("act_"),
                  starts_with("clr_"),
                  starts_with("unfound")) %>%
    dplyr::mutate_at(vars(other_cols), as.character) %>%
    dplyr::mutate_at(vars(pop_cols), as.numeric)

    offenses_known_yearly <- bind_rows(offenses_known_yearly, data)
    rm(data); message(year); gc(); Sys.sleep(1)
  }
  return(offenses_known_yearly)

}

saving_yearly <- function(data) {
  save_files(data = data,
             year = "1960_2016",
             file_name = "ucr_offenses_known_yearly_",
             save_name = "ucr_offenses_known_yearly_")
}

