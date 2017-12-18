library(dplyr)
devtools::install_github("jacobkap/asciiSetupReader")
library(readr)
library(feather)
library(haven)
library(memisc)
library(zip)
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

  temp$POPULATION_1 <- as.numeric(as.character(temp$POPULATION_1))
  temp$POPULATION_2 <- as.numeric(as.character(temp$POPULATION_2))
  temp$POPULATION_3 <- as.numeric(as.character(temp$POPULATION_3))
  cols_to_fix <- grep("mailing|update|city|msa|county|zip|included|field|agen|ICPSR|age|last", names(temp),
                      ignore.case = TRUE)
  temp[, cols_to_fix] <- sapply(temp[, cols_to_fix], as.character)


  ucr <- bind_rows(ucr, temp)
  rm(temp); message(year)
}


saving_yearly <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/yearly_offenses_known")

  UCR_offenses_known_yearly_1960_2016 <- ucr

  Write(codebook(UCR_offenses_known_yearly_1960_2016),
        file = paste0("UCR_offenses_known_yearly_1960_2016.txt"))

  save(UCR_offenses_known_yearly_1960_2016,
       file = "UCR_offenses_known_yearly_1960_2016.rda")

  write_dta(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.dta")
  write_csv(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.csv")
  write_feather(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.feather")
  write_sas(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.sas")
  write_sav(UCR_offenses_known_yearly_1960_2016,
            path = "UCR_offenses_known_yearly_1960_2016.sav")

  file_ext <- c("rda", "dta", "feather", "csv", "sav", "sas")
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

make_agg_assault <- function(dataset) {
  dataset$ACT_AGG_ASSAULT <- rowSums(dataset[, grep("ACT_(OTH|GUN|KNIFE|HAND).*ASSA",
                                                    names(dataset))])
  dataset$CLR_AGG_ASSAULT <- rowSums(dataset[, grep("CLR_(OTH|GUN|KNIFE|HAND).*ASSA",
                                                    names(dataset))])
  dataset$CLR_18_AGG_ASSAULT <- rowSums(dataset[, grep("CLR_18_(OTH|GUN|KNIFE|HAND).*ASSA",
                                                       names(dataset))])
  dataset$UNFOUND_AGG_ASSAULT <- rowSums(dataset[, grep("UNFOUND_(OTH|GUN|KNIFE|HAND).*ASSA",
                                                        names(dataset))])
  return(dataset)
}

make_yearly_cols <- function(dataset, types, crimes) {
  for (crime in crimes) {
    for (type in types) {
      dataset[, paste(type, crime, sep = "_")] <- rowSums(dataset[, grep(paste(type, crime, sep = "_"),
                                                                         names(dataset), value = TRUE)])
    }
  }

  if (any(grepl("OFFICERS", names(temp)))) {
    for (officer in officers) {
      dataset[, officer] <- rowSums(dataset[, grep(officer, names(dataset), value = TRUE)])
    }
  }

  return(dataset)
}

remove_monthly_cols <- function(dataset, months) {
  types <- c("ACT", "CLR", "UNFOUND", "CARD")
  if (any(grepl("OFFICERS", names(dataset)))) {
    types <- c(types, "OFFICER")
  }

    dataset <- dataset[, -grep("LAST|ICPSR|OLD|NUMBER|SEQU|SOURCE|AGE|SUB|MONTH|IDENT|FIELD",
                               names(dataset))]


  for (month in months) {
    for (type in types) {
      dataset <- dataset[, -grep(paste(month, type, sep = "_"),
                                 names(dataset))]
    }
  }
  return(dataset)
}

reorganize_cols <- function(dataset) {
  acts <- grep("ACT", names(dataset))
  clr <- grep("CLR_[^0-9]", names(dataset))
  clr_18 <- grep("CLR_18", names(dataset))
  unfound <- grep("UNFOUND", names(dataset))
  officers <- grep("OFFICER", names(dataset))
  other <- 1:ncol(dataset)
  other <- other[!other %in% c(acts, clr, clr_18, unfound, officers)]

  dataset <- dataset[, c(other, officers, acts, clr, clr_18, unfound)]
  return(dataset)
}
