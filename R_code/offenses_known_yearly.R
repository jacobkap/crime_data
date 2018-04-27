source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_utils.R')

# Making UCR Offenses Known and Clearances By Arrest into Yearly ----------

ucr <- data.frame()
for (year in 1960:2016) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
  load(paste0("UCR_offenses_known_monthly_", year, ".rda"))
  do.call(assign, list("temp", as.name(paste0("UCR_offenses_known_", year))))
  do.call(rm, list(paste0("UCR_offenses_known_", year)))

  types <- c("ACT", "CLR", "CLR_18", "UNFOUND")
  crimes <- c("MURDER", "MANSLAUGHTER", "RAPE_TOTAL", "FORCE_RAPE", "ATT_RAPE",
              "ROBBERY_TOTAL", "GUN_ROBBERY", "KNIFE_ROBBERY", "OTH_WEAP_ROBBERY",
              "STRONG_ARM_ROBBERY", "ASSAULT_TOTAL", "GUN_ASSAULT", "KNIFE_ASSAULT",
              "OTH_WEAP_ASSAULT", "HAND_FEET_ASSAULT", "SIMPLE_ASSAULT",
              "BURGLARY_TOTAL", "BURG_FORCE_ENTRY", "BURG_NO_FORCE_ENTRY", "ATT_BURGLARY",
              "LARCENY_TOTAL", "MTR_VHC_THEFT_TOTAL", "AUTO_THEFT",
              "TRUCK_BUS_THEFT", "OTH_VHC_THEFT", "ALL_FIELDS")
  months <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP",
              "OCT", "NOV", "DEC")
  officers <- c("OFFICERS_KILL_BY_ACC", "OFFICERS_KILL_BY_FEL",
                "OFFICERS_ASSAULTED")

  temp <- make_yearly_cols(temp, types, crimes)
  temp <- remove_monthly_cols(temp, months)
  temp <- make_agg_assault(temp)
  temp <- reorganize_cols(temp)

  temp$POPULATION_2[temp$POPULATION_2 == "Inap"] <- 0
  temp$POPULATION_1 <- as.numeric(as.character(temp$POPULATION_1))
  temp$POPULATION_2 <- as.numeric(as.character(temp$POPULATION_2))
  temp$POPULATION_3 <- as.numeric(as.character(temp$POPULATION_3))
  cols_to_fix <- grep("mailing|update|city|msa|county|zip|included|field|agen|ICPSR|age|last", names(temp),
                      ignore.case = TRUE)
  temp[, cols_to_fix] <- sapply(temp[, cols_to_fix], as.character)


  ucr <- bind_rows(ucr, temp)
  rm(temp); message(year); gc(); Sys.sleep(3)
}


saving_yearly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/yearly_offenses_known")

  UCR_offenses_known_yearly_1960_2016 <- ucr

  Write(codebook(UCR_offenses_known_yearly_1960_2016),
        file = paste0("UCR_offenses_known_yearly_1960_2016_codebook.txt"))

  save(UCR_offenses_known_yearly_1960_2016,
       file = "UCR_offenses_known_yearly_1960_2016.rda")

  write_dta(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.dta")
  write_csv(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.csv")
  write_sas(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.sas")
  write_sav(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.sav")

  file_ext <- c("rda", "dta", "csv", "sav", "sas")
  all_files <- list.files()
  codebooks <- all_files[grep("codebook", all_files)]
  for (i in seq_along(file_ext)) {
    zip_files <- all_files[grep(file_ext[i], all_files)]
    zip_files <- c(zip_files, codebooks)

    zip::zip(zipfile = paste0("UCR_offenses_known_yearly_1960_2016_", file_ext[i], ".zip"),
             files = zip_files)
  }


}
saving_yearly()

