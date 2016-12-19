# Combine files into master file

setwd("C:/Users/user/Dropbox/R_project/crime_data")
load("crosswalk.rda")
load("leoka.rda")
load("supplementary_homicide.rda")
load("ucr_offenses.rda")


master_ucr <- dplyr::left_join(ucr_offenses, crosswalk)
master_ucr <- dplyr::left_join(master_ucr, leoka)
master_ucr <- dplyr::left_join(master_ucr, supplementary_homicide)
master_ucr <- master_ucr[-grep("99999", master_ucr$ORI),]
rownames(master_ucr) <- 1:nrow(master_ucr)
master_ucr <- master_ucr[, c(1:3, 66:103, 64:65, 4:63, 104:147)]
master_ucr <- dplyr::arrange(master_ucr, year, ORI)
save(master_ucr, file = "master_ucr.rda", compress = "xz")

master_column_dictionary <- data.frame(column = "1-27",
                                       source = "crosswalk")
leoka_column <- data.frame(column = "28-41",
                           source = "LEOKA")
offenses_column <- data.frame(column = "42-103",
                              source = "offenses_and_clearances")
shr_column <- data.frame(column = "104-147",
                         source = "supplementary_homicide_report")
master_column_dictionary <- rbind(master_column_dictionary,
                                  leoka_column,
                                  offenses_column,
                                  shr_column)
master_column_dictionary$info <- ""
master_column_dictionary$info[1] <- "Column dictionary for UCR master dataset"
save(master_column_dictionary, file = "master_column_dictionary.rda",
     compress = "xz")


# Save all as compress excel files
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/excel")
write.csv(crosswalk, xzfile("crosswalk.csv.xz"))
write.csv(master_column_dictionary,
          xzfile("master_column_dictionary.csv.xz"))
write.csv(supplementary_homicide,
          xzfile("supplementary_homicide.csv.xz"))
write.csv(leoka, xzfile("leoka.csv.xz"))
write.csv(ucr_offenses,
          xzfile("ucr_offenses.csv.xz"))
write.csv(master_ucr,
          xzfile("master_ucr.csv.xz"))


# Save as .dta for stata
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/stata")
names(supplementary_homicide) <- gsub("SHR_babysitter_or_parent_kills_child",
                                      "SHR_babysitter_or_parent",
                                      names(supplementary_homicide))
names(master_ucr) <- gsub("SHR_babysitter_or_parent_kills_child",
                                      "SHR_babysitter_or_parent",
                                      names(master_ucr))
haven::write_dta(crosswalk, path = "crosswalk.dta")
haven::write_dta(master_column_dictionary,
                 path = "master_column_dictionary.dta")
haven::write_dta(supplementary_homicide,
                 path = "supplementary_homicide.dta")
haven::write_dta(leoka, path = "leoka.dta")
haven::write_dta(ucr_offenses, path = "ucr_offenses.dta")
haven::write_dta(master_ucr, path = "master_ucr.dta")



# Save as .sas for sas
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/sas")
haven::write_sas(crosswalk, path = "crosswalk.sas")
haven::write_sas(master_column_dictionary,
                 path = "master_column_dictionary.sas")
haven::write_sas(supplementary_homicide,
                 path = "supplementary_homicide.sas")
haven::write_sas(leoka, path = "leoka.sas")
haven::write_sas(ucr_offenses, path = "ucr_offenses.sas")
haven::write_sas(master_ucr, path = "master_ucr.sas")

# Save as .sav for spss
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/spss")
haven::write_sav(crosswalk, path = "crosswalk.sav")
haven::write_sav(master_column_dictionary,
                 path = "master_column_dictionary.sav")
haven::write_sav(supplementary_homicide,
                 path = "supplementary_homicide.sav")
haven::write_sav(leoka, path = "leoka.sav")
haven::write_sav(ucr_offenses, path = "ucr_offenses.sav")
haven::write_sav(master_ucr, path = "master_ucr.sav")
