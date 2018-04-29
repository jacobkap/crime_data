# Making UCR Offenses Known and Clearances By Arrest into Yearly ----------
make_ucr_yearly <- function() {
  ucr <- data.frame()
  for (year in 1960:2016) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
    load(paste0("ucr_offenses_known_monthly_", year, ".rda"))
    do.call(assign, list("temp", as.name(paste0("ucr_offenses_known_monthly_", year))))
    do.call(rm, list(paste0("ucr_offenses_known_monthly_", year)))

    types <- tolower(c("ACT",
                       "CLR",
                       "CLR_18",
                       "UNFOUND"))
    crimes <- tolower(c("MURDER",
                        "MANSLAUGHTER",
                        "RAPE_TOTAL",
                        "FORCE_RAPE",
                        "ATTEMPTED_RAPE",
                        "ROBBERY_TOTAL",
                        "GUN_ROBBERY",
                        "KNIFE_ROBBERY",
                        "OTHER_WEAPON_ROBBERY",
                        "STRONG_ARM_ROBBERY",
                        "ASSAULT_TOTAL",
                        "GUN_ASSAULT",
                        "KNIFE_ASSAULT",
                        "OTHER_WEAPON_ASSAULT",
                        "HAND_FEET_ASSAULT",
                        "SIMPLE_ASSAULT",
                        "BURGLARY_TOTAL",
                        "BURG_FORCE_ENTRY",
                        "BURG_NO_FORCE_ENTRY",
                        "ATTEMPTED_BURGLARY",
                        "LARCENY_TOTAL",
                        "MTR_VHC_THEFT_TOTAL",
                        "AUTO_THEFT",
                        "TRUCK_BUS_THEFT",
                        "OTHER_VHC_THEFT",
                        "ALL_FIELDS"))
    months <- tolower(month.abb)
    officers <- tolower(c("OFFICERS_KILLED_BY_ACCIDENT",
                          "OFFICERS_KILLED_BY_FELONY",
                          "OFFICERS_ASSAULTED"))

    temp <- make_yearly_cols(temp, types, crimes)
    temp <- remove_monthly_cols(temp, months)
    temp <- make_agg_assault(temp)
    temp <- reorganize_cols(temp)

    temp$population_2[temp$population_2 == "inap"] <- 0
    temp$population_1 <- as.numeric(as.character(temp$population_1))
    temp$population_2 <- as.numeric(as.character(temp$population_2))
    temp$population_3 <- as.numeric(as.character(temp$population_3))
    cols_to_fix <- grep("mailing|update|city|msa|county|zip|included|field|agen|ICPSR|age|last", names(temp),
                        ignore.case = TRUE)
    temp[, cols_to_fix] <- sapply(temp[, cols_to_fix], as.character)


    ucr <- bind_rows(ucr, temp)
    rm(temp); message(year); gc(); Sys.sleep(3)
  }
  return(ucr)

}

saving_yearly <- function(data) {

  #  UCR_offenses_known_yearly_1960_2016 <- data

  save_files(data = data,
             year = "1960_2016",
             file_name = "ucr_offenses_known_yearly_",
             save_name = "ucr_offenses_known_yearly_")
  # save_as_zip("ucr_offenses_known_yearly_1960_2016_")

  # Write(codebook(UCR_offenses_known_yearly_1960_2016),
  #       file = paste0("UCR_offenses_known_yearly_1960_2016_codebook.txt"))
  #
  # save(UCR_offenses_known_yearly_1960_2016,
  #      file = "UCR_offenses_known_yearly_1960_2016.rda")
  #
  # write_dta(UCR_offenses_known_yearly_1960_2016,
  #           path = "UCR_offenses_known_yearly_1960_2016.dta")
  # write_csv(UCR_offenses_known_yearly_1960_2016,
  #           path = "UCR_offenses_known_yearly_1960_2016.csv")
  # write_sas(UCR_offenses_known_yearly_1960_2016,
  #           path = "UCR_offenses_known_yearly_1960_2016.sas")
  # write_sav(UCR_offenses_known_yearly_1960_2016,
  #           path = "UCR_offenses_known_yearly_1960_2016.sav")


  # file_ext <- c("rda", "dta", "csv", "sav", "sas")
  # all_files <- list.files()
  # codebooks <- all_files[grep("codebook", all_files)]
  # for (i in seq_along(file_ext)) {
  #   zip_files <- all_files[grep(file_ext[i], all_files)]
  #   zip_files <- c(zip_files, codebooks)
  #
  #   zip::zip(zipfile = paste0("UCR_offenses_known_yearly_1960_2016_", file_ext[i], ".zip"),
  #            files = zip_files)
  # }
}

