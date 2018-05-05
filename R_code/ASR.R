# Reads and cleans Arrest by Age, Sex, and Race (ASR) data from
# the FBI's UCR.
setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/ASR")
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/ASR_utils.R')

ASR_yearly <- data.frame()
for (year in 1980:2015) {
  message(year)

  data <- spss_ascii_reader(paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".txt"),
                           paste0("UCR_arrests_by_age_sex_race_",
                                  year, ".sps"))
  names(data) <- gsub("ORIGINATING_AGENCY_IDENTIFIER_CODE", "ORI", names(data))
  data <- data[data$ORIGINATING_AGENCY_IDENTIFIER_CODE == "CA00109",]
  data <- data.table(data)

  data2 <- melt(data, id.vars = c("OFFENSE_CODE", "MONTH", "ORI"),
                measure.vars = c("MALE_UNDER_10", "MALE_10_12", "MALE_13_14"))
  data2$value <- as.numeric(data2$value)
  data2$value[is.na(data2$value)] <- 0
  data2$variable <- paste(data2$MONTH, data2$OFFENSE_CODE, data2$variable)
  data3 <- dcast(data2, ORI ~ variable, value.var = "value")

  ASR_yearly <- dplyr::bind_rows(ASR_yearly, ASR)

}