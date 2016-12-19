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
