load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR/ASR_drug_liquor_crimes_1980_2015.rda")
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR/ASR_financial_crimes_1980_2015.rda")
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR/ASR_index_crimes_1980_2015.rda")
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR/ASR_other_crimes_1980_2015.rda")
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR/ASR_violent_or_sex_crimes_1980_2015.rda")
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/ASR/ASR_simple_1980_2015.rda")

data$year <- NULL
data$population <- NULL
num_cols <- sapply(data, is.numeric)
data <- data[, num_cols]
names(data)
summary(sapply(data, min))
summary(sapply(data, max))
summary(sapply(data, mean))
summary(sapply(data, median))
sapply(data[, 1:250], summary)

