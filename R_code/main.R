# Thank you to Daniel Goldberg for helping
# me with the supplemental homicide report
# categories and with ideas about this
# dataset in general.

# Combine files into master file

setwd("C:/Users/user/Dropbox/R_project/crime_data")
load("police_agency_identifier_crosswalk.rda")
load("ucr_police_employee_leoka.rda")
load("ucr_supplementary_homicide_report.rda")
load("ucr_offenses_clearances.rda")

ucr_supplementary_homicide_report$year <-
  as.numeric(ucr_supplementary_homicide_report$year)
ucr_police_employee_leoka$year <-
  as.numeric(ucr_police_employee_leoka$year)

master_crime <- dplyr::left_join(ucr_offenses_clearances,
                                 police_agency_identifier_crosswalk)
master_crime <- dplyr::left_join(master_crime,
                                 ucr_police_employee_leoka)
master_crime <- dplyr::left_join(master_crime,
                                 ucr_supplementary_homicide_report)
rownames(master_crime) <- 1:nrow(master_crime)
master_crime <- master_crime[, c(1:3, 66:103, 64:65, 4:63, 104:147)]
master_crime <- dplyr::arrange(master_crime, year, ORI)
save(master_crime, file = "master_crime.rda", compress = "xz")

master_column_dictionary <- data.frame(column = "1-27",
                  source = "police_agency_identifier_crosswalk")
ucr_police_employee_leoka_column <- data.frame(column = "28-41",
                           source = "ucr_police_employee_leoka")
offenses_column <- data.frame(column = "42-103",
                              source = "offenses_and_clearances")
shr_column <- data.frame(column = "104-147",
                         source = "ucr_supplementary_homicide_report_report")
master_column_dictionary <- rbind(master_column_dictionary,
                                  ucr_police_employee_leoka_column,
                                  offenses_column,
                                  shr_column)
master_column_dictionary$info <- ""
master_column_dictionary$info[1] <- "Column dictionary for UCR master dataset"
save(master_column_dictionary, file = "master_column_dictionary.rda",
     compress = "xz")


# Save all as compress excel files
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/excel")
write.csv(police_agency_identifier_crosswalk,
          file = "police_agency_identifier_crosswalk.csv")
write.csv(master_column_dictionary,
          file = "master_column_dictionary.csv")
write.csv(ucr_supplementary_homicide_report,
          file = "ucr_supplementary_homicide_report.csv")
write.csv(ucr_police_employee_leoka, file = "ucr_police_employee_leoka.csv")
write.csv(ucr_offenses_clearances,
          file = "ucr_offenses_clearances.csv")
write.csv(master_crime,
          file = "master_crime.csv")


# Save as .dta for stata
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/stata")
names(ucr_supplementary_homicide_report) <-
           gsub("SHR_babysitter_or_parent_kills_child",
          "SHR_babysitter_or_parent",
          names(ucr_supplementary_homicide_report))
names(master_crime) <- gsub("SHR_babysitter_or_parent_kills_child",
                      "SHR_babysitter_or_parent",
                      names(master_crime))
haven::write_dta(police_agency_identifier_crosswalk,
                 path = "police_agency_identifier_crosswalk.dta")
haven::write_dta(master_column_dictionary,
                 path = "master_column_dictionary.dta")
haven::write_dta(ucr_supplementary_homicide_report,
                 path = "ucr_supplementary_homicide_report.dta")
haven::write_dta(ucr_police_employee_leoka,
                 path = "ucr_police_employee_leoka.dta")
haven::write_dta(ucr_offenses_clearances,
                 path = "ucr_offenses_clearances.dta")
haven::write_dta(master_crime, path = "master_crime.dta")



# Save as .sas for sas
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/sas")
haven::write_sas(police_agency_identifier_crosswalk,
                 path = "police_agency_identifier_crosswalk.sas")
haven::write_sas(master_column_dictionary,
                 path = "master_column_dictionary.sas")
haven::write_sas(ucr_supplementary_homicide_report,
                 path = "ucr_supplementary_homicide_report.sas")
haven::write_sas(ucr_police_employee_leoka,
                 path = "ucr_police_employee_leoka.sas")
haven::write_sas(ucr_offenses_clearances, path = "ucr_offenses_clearances.sas")
haven::write_sas(master_crime, path = "master_crime.sas")

# Save as .sav for spss
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/spss")
haven::write_sav(police_agency_identifier_crosswalk,
                 path = "police_agency_identifier_crosswalk.sav")
haven::write_sav(master_column_dictionary,
                 path = "master_column_dictionary.sav")
haven::write_sav(ucr_supplementary_homicide_report,
                 path = "ucr_supplementary_homicide_report.sav")
haven::write_sav(ucr_police_employee_leoka,
                 path = "ucr_police_employee_leoka.sav")
haven::write_sav(ucr_offenses_clearances,
                 path = "ucr_offenses_clearances.sav")
haven::write_sav(master_crime, path = "master_crime.sav")
