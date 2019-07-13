# https://www.isp.state.il.us/crime/ucrhome.cfm
library(foreign)
library(dplyr)
setwd(here::here("raw_data/illinois_crime"))
# 1993-2009 mostly don't report UCR crime (large agencies do)

links <- data.frame(link =
                      c("cii09/db/Internet_Crime0908.dbf",
                        "cii08/db/Internet_Crime0807.dbf",
                        "cii07/db/Internet_Crime0706.dbf",
                        "cii06/db/Internet_Crime0605.dbf",
                        "cii05/db/internet_crime0504.dbf",
                        "cii04/db/internet_crime04_03.dbf",
                        "cii03/db/internet_crime03_02.dbf",
                        "cii02/db/internet_crime02_01.dbf",
                        "cii01/db/IndexOffenses2001,2000.dbf",
                        "cii00/db/cii00data.dbf",
                        "cii00/db/cii99data.dbf",
                        "cii99/db/Cii99.dbf"),
                    year = 2009:1998)



for (i in 1:nrow(links)) {
  file_link <- paste0("https://www.isp.state.il.us/docs/cii/",
                      links$link[i])
  file_name <- paste0("illinois_ucr_", links$year[i], ".dbf")

  download.file(url = file_link,
                destfile = file_name,
                mode = "wb")

}


files <- list.files()
illinois_ucr <- data.frame()
for (file in files) {
  temp <- foreign::read.dbf(file) %>%
    dplyr::select(-matches("NOTE|CHG"))
  illinois_ucr <- dplyr::bind_rows(illinois_ucr, temp)
}
z <- foreign::read.dbf(files[1])
