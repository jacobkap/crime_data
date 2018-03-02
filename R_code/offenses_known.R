source('C:/Users/user/Dropbox/R_project/crime_data/R_code/offenses_known_utils.R')

# Checks old data to make sure it is same (or close enough - i.e. no changes to
# crime values) after I fixed the asciiReader package
# which is mostly just adding missing values and changing how numeric columns
# are actually made numeric
# setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
# for (year in 1960:2016) {
#
#   temp <- spss_ascii_reader(dataset_name = paste0(year, "_UCR_offenses_known.txt"),
#                             sps_name = paste0(year, "_UCR_offenses_known.sps"))
#   temp <- cleaning_UCR(temp)
#
#   if (year == 2000) temp$DEC_OFFICERS_ASSAULTED <- NULL
#
#   classes <- sapply(temp, class)
#   numeric_cols <- names(classes[classes == "numeric"])
#   factor_cols <- names(classes[classes == "factor"])
#   character_cols <- names(classes[classes == "character"])
#   load(paste0("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known/UCR_offenses_known_monthly_",
#                year, ".rda"))
#   old <- get(paste0("UCR_offenses_known_", year))
#   old[numeric_cols] <- sapply(old[numeric_cols], function(x) as.numeric(as.character(x)))
#   old[factor_cols] <- sapply(old[factor_cols], function(x) as.character(x))
#   temp[factor_cols] <- sapply(temp[factor_cols], function(x) as.character(x))
#   old[character_cols] <- sapply(old[character_cols], function(x) as.character(x))
#
#   message(paste0(year, "      ", all.equal(temp, old)))
#   message("\n\n")
#   rm(temp); rm(old); do.call(rm, list(paste0("UCR_offenses_known_", year)))
#   gc(); Sys.sleep(2.5)
#
# }

# Save in various data formats --------------------------------------------
for (year in 1960:2016) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
  temp <- spss_ascii_reader(dataset_name = paste0(year, "_UCR_offenses_known.txt"),
                            sps_name = paste0(year, "_UCR_offenses_known.sps"))
  temp <- cleaning_UCR(temp)

  factor_cols <- sapply(temp, is.factor)
  temp[factor_cols] <- sapply(temp[factor_cols], function(x) as.character(x))

  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
  assign(paste0("UCR_offenses_known_", year), temp) # Change name
  Write(codebook(temp),
        file = paste0("UCR_offenses_known_codebook_", year, ".txt"))
  rm(temp)

  save( list = paste0("UCR_offenses_known_", year),
        file = paste0("UCR_offenses_known_monthly_", year, ".rda"))
  do.call("write_dta", list(as.name(paste0("UCR_offenses_known_", year)),
                            path = paste0("UCR_offenses_known_monthly_",
                                          year, ".dta")))
  do.call("write_csv", list(as.name(paste0("UCR_offenses_known_", year)),
                            path = paste0("UCR_offenses_known_monthly_",
                                          year, ".csv")))
  do.call("write_sav", list(as.name(paste0("UCR_offenses_known_", year)),
                            path = paste0("UCR_offenses_known_monthly_",
                                          year, ".sav")))
  do.call("rm", list(as.name(paste0("UCR_offenses_known_", year))))
  gc(); Sys.sleep(5)

  message(year)
}

save_as_zip <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known")
  file_ext <- c("rda", "dta", "csv", "sav")
  all_files <- list.files()
  codebooks <- all_files[grep("codebook", all_files)]
  for (i in seq_along(file_ext)) {
    zip_files <- all_files[grep(file_ext[i], all_files)]
    zip_files <- c(zip_files, codebooks)

    zip::zip(zipfile = paste0("UCR_offenses_known_monthly_1960_2016_",
                              file_ext[i], ".zip"),
             files = zip_files)
  }
}
save_as_zip()

save_raw_as_zip <- function() {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
  all_files <- list.files()

  zip::zip(zipfile = "UCR_offenses_known_1960_2016_ascii_sps.zip",
           files = all_files)

}
save_raw_as_zip()


