setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/SHR")
devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(data.table)
library(stringr)

system.time(shr <- spss_ascii_reader(dataset_name = "1977_SHR.txt",
                                     sps_name = "1977_SHR.sps"))

shr <- data.table()
for (i in 1976:2015) {
  data <- spss_ascii_reader(dataset_name = paste0(i, "_SHR.txt"),
                               sps_name = paste0(i, "_SHR.sps"))
  names(data) <- str_replace_all(names(data), shr_names)
  data <- data.table(data)
  shr <- rbind(shr, data, fill = TRUE)


  message(i); rm(data); gc(); Sys.sleep(1)
}
shr <- data.frame(shr)
names(shr)

shr_names <- c("SUBC.*" = "SUBCIRCUMSTANCE",
               "ETHNC_ORIGN" = "ETHNIC_ORIGIN",
               "ORIGN|ORGIN"       = "ORIGIN",
               "ETHNC"       = "ETHNIC",
               "ETHNIC$" = "ETHNIC_ORIGIN",
               "GENDER" = "SEX",
               "OFFENDER_([0-9]+)_CIR.*" =  "CIRCUMSTANCE_\\1",
               "OFFENDER_([0-9]+)_SUB.*" = "SUBCIRCUMSTANCE_\\1",
               "OFFENDER_([0-9]+)_REL.*" =  "RELATIONSHIP_\\1",
               "SUB_CIRCUMSTANCE" = "SUBCIRCUMSTANCE")
