devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/property_stolen")
for (year in 1998:2015) {
  data <- spss_ascii_reader(paste0("ucr_property_stolen_",
                                    year, ".txt"),
                             paste0("ucr_property_stolen_", year,
                                    ".sps"))
  print(paste(year, "     cols:", ncol(data), "     rows:", nrow(data)))
}
