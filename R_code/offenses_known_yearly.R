# Making UCR Offenses Known and Clearances By Arrest into Yearly ----------
make_ucr_yearly <- function() {
  offenses_known_yearly <- data.frame()
  for (year in 1960:2016) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    load(paste0("ucr_offenses_known_monthly_", year, ".rda"))
    do.call(assign, list("data", as.name(paste0("ucr_offenses_known_monthly_", year))))
    do.call(rm, list(paste0("ucr_offenses_known_monthly_", year)))

    types <- tolower(c("act",
                       "clr",
                       "clr_18",
                       "unfound"))
    crimes <- c("murder",
                "manslaughter",
                "rape_total",
                "force_rape",
                "attempted_rape",
                "robbery_total",
                "gun_robbery",
                "knife_robbery",
                "other_weapon_robbery",
                "strong_arm_robbery",
                "assault_total",
                "aggravated_assault",
                "gun_assault",
                "knife_assault",
                "other_weapon_assault",
                "hand_feet_assault",
                "simple_assault",
                "burglary_total",
                "burg_force_entry",
                "burg_no_force_entry",
                "attempted_burglary",
                "theft_total",
                "mtr_vhc_theft_total",
                "auto_theft",
                "truck_bus_theft",
                "other_vhc_theft",
                "all_fields")
    months <- tolower(month.abb)
    officers <- tolower(c("officers_killed_by_accident",
                          "officers_killed_by_felony",
                          "officers_assaulted"))

    data <- make_yearly_cols(data, types, crimes, officers)
    data <-
      data %>%
      dplyr::mutate_at(vars(other_cols), as.character) %>%
      dplyr::select(-matches(paste0(tolower(month.abb), "_", collapse = "|"))) %>%
      dplyr::select(starting_cols,
                    cross_names,
                    other_cols,
                    starts_with("officer"),
                    starts_with("act_"),
                    starts_with("clr_"),
                    starts_with("unfound"))

    offenses_known_yearly <- bind_rows(offenses_known_yearly, data)
    rm(data); message(year); gc(); Sys.sleep(3)
  }
  return(offenses_known_yearly)

}

saving_yearly <- function(data) {
  save_files(data = data,
             year = "1960_2016",
             file_name = "ucr_offenses_known_yearly_",
             save_name = "ucr_offenses_known_yearly_")
}

