# Reads NIBRS and saves it as rda for easier use later

devtools::install_github("jacobkap/spssSetup")
library(spssSetup)


nibrs_ascii_to_r("administrative")
nibrs_ascii_to_r("arrestee")
nibrs_ascii_to_r("batch_header_3")
nibrs_ascii_to_r("group_b_arrest")
nibrs_ascii_to_r("offender")
nibrs_ascii_to_r("offenses")
nibrs_ascii_to_r("property")
nibrs_ascii_to_r("victim")
nibrs_ascii_to_r("window_arrestee")
nibrs_ascii_to_r("window_exceptionally_cleared")
nibrs_ascii_to_r("window_property")

# Reads all ASCII files and saves as
# rda and stata format
nibrs_ascii_to_r <- function(file_type) {
  for (i in 1991:2014) {
    start <- proc.time()
    setwd(paste0("C:/Users/user/Dropbox/R_project/crime_data/",
                 "raw_data/NIBRS/ASCII/", file_type))
    # Reads in ASCII
    dataset <- spssSetup::spssSetup(dataset_name = paste0("nibrs_",
                                    i, "_",  file_type, ".txt"),
                                    setup_file_name = paste0("nibrs_",
                                    i, "_",  file_type, ".sps"),
                                    smart_col_class = TRUE)
    assign(paste0("nibrs_", i, "_", file_type), dataset)
    rm(dataset) # Remove to save memory

    # Saves as .rda
    setwd(paste0("C:/Users/user/Dropbox/R_project/crime_data/",
                 "raw_data/NIBRS/R/", file_type))
    save(list = paste0("nibrs_", i, "_", file_type),
         file = paste0("nibrs_", i, "_", file_type, ".rda"),
         compress = "xz")
    rm(list = paste0("nibrs_", i, "_", file_type)) # Remove to save memory
    end <- proc.time()
    print(paste0(i, " ", file_type, ": ", round((end-start)[3], 2),
                  " seconds elapsed"))
  }
}
