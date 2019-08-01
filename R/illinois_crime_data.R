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

# Excel links
excel_links <- c("https://www.isp.state.il.us/docs/cii/cii17/ds/CrimeData_17_16.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/CrimeData_16_15.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/CrimeData_15_14.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/IndexCrimeDrugArrestData_14_13.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii13/ds/IndexCrimeOffenses_Data_13_12.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii12/ds/Internet_Crime_12_11.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii17/ds/DomesticOffenses_17_16.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii17/ds/HateCrime_17_16.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii17/ds/SchoolIncidents_17_16.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/DomesticOffenses_16_15.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/HateCrime_16_15.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/SchoolIncidents_16_15.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/DomesticOffenses_15_14.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/HateCrime_15_14.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/SchoolIncidents_15_14.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/DomesticOffenseData_14_13.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/HateCrimeData_14_13.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/SchoolIncidentData_14_13.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii13/ds/Supplemental_Data_13_12.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii13/ds/HateCrime_Data_13_12.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii12/ds/Internet_Supplemental_12_11.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii12/ds/Internet_HateCrime_12_11.xlsx",
                 "https://www.isp.state.il.us/docs/cii/cii11/ds/Internet_Supplemental_11_10.xls",
                 "https://www.isp.state.il.us/docs/cii/cii11/ds/Internet_HateCrime_11_10.xls",
                 "https://www.isp.state.il.us/docs/cii/cii09/db/Internet_Supplemental0908.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii08/db/Offense_Arrest_data_layout0807.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii08/db/Internet_Supplemental0807.DBF",
                 "https://www.isp.state.il.us/docs/cii/cii08/db/Supplemental_data_layout0807.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii07/db/Offense_Arrest_data_layout0706.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii07/db/Internet_Supplemental0706.DBF",
                 "https://www.isp.state.il.us/docs/cii/cii07/db/Supplemental_data_layout0706.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii06/db/Offense_Arrest_data_layout0605.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii06/db/internet_supplemental0605.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii06/db/supplemental_data_layout0605.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii05/db/Offense_Arrest_data_layout0504.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii05/db/internet_supplemental0504.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii05/db/supplemental_data_layout0504.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii17/ds/CrimeDataLayout_17_16.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii17/ds/DomesticOffensesLayout_17_16.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii17/ds/HateCrimeLayout_17_16.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii17/ds/SchoolIncidentsLayout_17_16.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/CrimeDataLayout_16_15.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/DomesticOffensesLayout_16_15.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/HateCrimeLayout_16_15.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii16/ds/SchoolIncidentsLayout_16_15.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/CrimeDataLayout_15_14.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/DomesticOffensesLayout_15_14.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/HateCrimeLayout_15_14.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii15/ds/SchoolIncidentsLayout_15_14.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/IndexCrimeDrugArrestDataLayout_14_13.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/DomesticOffenseDataLayout_14_13.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/HateCrimeDataLayout_14_13.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii14/ds/SchoolIncidentDataLayout_14_13.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii13/ds/IndexCrimeOffenses_DataLayout_13_12.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii13/ds/Supplemental_DataLayout_13_12.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii13/ds/HateCrime_DataLayout_13_12.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii12/ds/IndexOffenses_DrugArrests_DataLayout_12_11.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii12/ds/Supplemental_DataLayout_12_11.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii12/ds/HateCrime_DataLayout_12_11.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii11/ds/IndexOffenses_DrugArrests_DataLayout_11_10.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii11/ds/Supplemental_DataLayout_11_10.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii11/ds/HateCrime_DataLayout_11_10.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii09/db/Offense_Arrest_data_layout0908.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii09/db/Supplemental_data_layout0908.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii05/db/Offense_Arrest_data_layout0504.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii05/db/internet_supplemental0504.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii05/db/supplemental_data_layout0504.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii04/db/data_layout04.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii04/db/internet_supplemental04_03.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii04/db/supp_layout04.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii03/db/data_layout03.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii03/db/internet_supplemental03_02.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii03/db/supp_layout03.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii02/db/data_layout02.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii02/db/internet_supplemental02_01.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii02/db/supp_layout02.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii01/db/IndexOffLayout.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii01/db/SupplementalData2001,2000.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii01/db/SuppDataLayout.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii00/db/CII00dbflayout.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii00/db/cii00supp.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii00/db/supp00lo.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii99/db/cii99lo.pdf",
                 "https://www.isp.state.il.us/docs/cii/cii99/db/CII99SUPP2.dbf",
                 "https://www.isp.state.il.us/docs/cii/cii99/db/sup99low.pdf")

for (file in excel_links) {

  file_name <- gsub(".*/(ds|db)/", "", file)

  download.file(url = file,
                destfile = file_name,
                mode = "wb")
  Sys.sleep(1)

}


files <- list.files()
illinois_ucr <- data.frame()
for (file in files) {
  temp <- foreign::read.dbf(file) %>%
    dplyr::select(-matches("NOTE|CHG"))
  illinois_ucr <- dplyr::bind_rows(illinois_ucr, temp)
}
z <- foreign::read.dbf(files[1])
