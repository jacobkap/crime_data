setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/leoka")
devtools::install_github("jacobkap/spssSetup")
library(spssSetup)

system.time(leoka <- spssSetup(dataset_name = "1975_leoka.txt",
                        setup_file_name = "1975_leoka.sps",
                        smart_col_class = TRUE))
leoka <- leoka_name_fixer(leoka)

for (i in 1976:2014) {
  timeStart <- proc.time()
  dataset <- spssSetup(dataset_name = paste0(i, "_leoka.txt"),
                              setup_file_name = paste0(i, "_leoka.sps"),
                              smart_col_class = TRUE)
  dataset <- leoka_name_fixer(dataset)
  leoka <- plyr::rbind.fill(leoka, dataset)
  timeEnd <- proc.time()
  message(paste("Year", i, "completed",
                round(as.numeric((timeEnd - timeStart))[3], 5),
                "seconds elapsed", sep = " "))
}

leoka$total_officers <- leoka$male_officers + leoka$female_officers
leoka$total_civilians <- leoka$male_civilians + leoka$female_civilians
load(paste0("C:/Users/user/Dropbox/R_project/crime_data/raw_data/",
            "leoka/leoka_2015.rda"))
leoka <- plyr::rbind.fill(leoka, leoka_2015)
leoka$officers_per_1000_pop <- (leoka$total_officers /
                                leoka$population) * 1000
leoka$civilians_per_1000_pop <- (leoka$total_civilians /
                                 leoka$population) * 1000
leoka$employees_per_1000_pop <- (leoka$total_employees /
                                 leoka$population) * 1000
leoka$male_officers_per_1000_pop <- (leoka$male_officers /
                                     leoka$population) * 1000
leoka$female_officers_per_1000_pop <- (leoka$female_officers /
                                       leoka$population) * 1000
leoka$population <- NULL

for (i in 3:ncol(leoka)) {
  leoka[,i][leoka[,i] %in% c("NaN", "Inf")] <- NA
  leoka[,i][leoka$total_employees == 0] <- NA
}
leoka$total_civilians[is.na(leoka$total_employees)] <- NA
leoka$total_officers[is.na(leoka$total_employees)] <- NA
leoka <- year_fixer(leoka)
setwd("C:/Users/user/Dropbox/R_project/crime_data")
save(leoka, file = "leoka.rda", compress = "xz")

leoka_name_fixer <- function(dataset) {

  dataset <- dataset[, grep("ori|year|officers$|civilian|employee|pop",
                            names(dataset),
                            ignore.case = TRUE)]

  name_start <- c("ori_code",
                  "number_male_civilians|male_employees_civilians",
                  "number_male_officers|male_employees_officers",
                  "total_male_employees|male_employees_total",
                  "number_female_officers|female_employees_officers",
                  "female_employees_civilians|number_female_civilians",
                  "female_employees_total|total_female_employees",
                  "^pop.*")
  new_name <- c("ORI", "male_civilians", "male_officers",
                "male_employees", "female_officers", "female_civilians",
                "female_employees",
                "population")

  leoka_names <- data.frame(cbind(name_start, new_name),
                            stringsAsFactors = FALSE)

  for (i in 1:nrow(leoka_names)) {
    names(dataset) <- gsub(leoka_names[i, 1], leoka_names[i, 2],
                           names(dataset))
  }

  dataset <- dataset[, -grep("rate|per", names(dataset))]


  return(dataset)
}

year_fixer <- function(dataset) {
  dataset$year <- paste0("19", dataset$year)
  dataset$year <- gsub("1919", "19", dataset$year)
  dataset$year <- gsub("1920", "20", dataset$year)
  return(dataset)
}
