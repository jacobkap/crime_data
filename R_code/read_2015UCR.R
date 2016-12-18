# This data will read and clean the FBI's UCR data from 2015
setwd("C:/Users/user/Dropbox/R_project/crime/UCR_2015")

offenses_2015 <- readLines("offenses2015.txt")
# Keeps only rows with agency info, and crimes/clearances countys
offenses_2015 <- offenses_2015[grep("12 mo tot|12015|tot clear",
                                    offenses_2015, ignore.case = TRUE)]
# Make into dataframe
offenses_2015 <- data.frame(offenses_2015)
names(offenses_2015) <- "temp" # This column name is easier to
                               # use than the default
offenses_2015$temp <- as.character(offenses_2015$temp)



# Grabs the information about the agency from row 1/5
# state, agency name, ORI, population of jurisdiction
offenses_2015_final <- data.frame(state = "", agency_name = "",
                                  ORI = "", population = "",
                                  stringsAsFactors = FALSE)
for (i in seq(1, nrow(offenses_2015), 5)) {

  row_to_check <- offenses_2015$temp[i]
  row_to_check <- gsub("DOC, OIG.|DOC,OIG.|:|\\.|,|& ", "", row_to_check)
  row_to_check <- gsub("([A-Z]) ([A-Z])",
                       "\\1_\\2", row_to_check)
  row_to_check <- gsub("([A-Z]) ([A-Z])",
                       "\\1_\\2", row_to_check)
  row_to_check <- gsub("\\s+", " ", row_to_check)

  storage <- strsplit(row_to_check,
                      split = " ")
  ori <- grep("^.......$", storage[[1]], value = TRUE)
  ori <- ori[ori != storage[[1]][3]]
  ori <- ori[!grepl("_", ori)]
  temp <- data.frame(state = storage[[1]][2],
                     agency_name = storage[[1]][3],
                     ORI = ori[grep("[A-Z]{2,7}[0-9]{0,5}",
                                             ori)],
                     population = storage[[1]][grep("^pop$", storage[[1]],
                                                    ignore.case = TRUE) + 1])
  offenses_2015_final <- rbind(offenses_2015_final, temp)
}
offenses_2015_final <- offenses_2015_final[-1,]
offenses_2015_final$year <- 2015
# Checki  ng that it worked
for (i in sample(1:nrow(offenses_2015_final), 100)) {
  Sys.sleep(0.5)
  print(offenses_2015_final[i,])
}

# This grabs info on the yearly count of crimes for:
# violent crime, murder, rape, robbery, agg assault,
# simple assault, property crime, burglary, larcent,
# motor vehicle theft, arson

crimes1 <- data.frame(violent_crime = "",
                      murder = "",
                      rape = "",
                      robbery = "",
                      aggravated_assault = "",
                      simple_assault = "",
                      property_crime = "",
                      burglary = "",
                      larceny = "",
                      motor_vehicle_theft = "",
                      stringsAsFactors = FALSE)
for (i in seq(2, nrow(offenses_2015), 5)) {
  row_to_check <- offenses_2015$temp[i]
  for (n in c(21, 28, 36, 44, 54, 64, 74, 83, 93, 102, 120)) {
    if (substr(row_to_check, n, n) %in% c(" ", "")) {
      substr(row_to_check, n, n) <- "0"
    }
  }
  row_to_check <- gsub("\\s+", " ", row_to_check)
  storage <- strsplit(row_to_check,
                      split = " ")

  temp <- data.frame(violent_crime = storage[[1]][5],
                        murder = storage[[1]][6],
                        rape = storage[[1]][7],
                        robbery = storage[[1]][8],
                        aggravated_assault = storage[[1]][9],
                        simple_assault = storage[[1]][10],
                        property_crime = storage[[1]][11],
                        burglary = storage[[1]][12],
                        larceny = storage[[1]][13],
                        motor_vehicle_theft = storage[[1]][14])
  crimes1 <- rbind(crimes1, temp)

}
crimes1 <- crimes1[-1,]



# This grabs info on the yearly count of crimes for:
# forcible rape (completed rape), attempted rape
# gun robbery, knife robbery, other weapon robbery,
# unarmed robbery, gun assault, knife assault,
# other weapon assault, unarmed assault,
# forcible entry, nonforcible entry,
# attempted burglary, auto theft, truckbus theft,
# other vehicle theft

crimes2 <- data.frame(forcible_rape = "",
                      attempted_rape = "",
                      gun_robbery = "",
                      knife_robbery = "",
                      other_weapon_robbery = "",
                      strongarm_robbery = "",
                      gun_assault = "",
                      knife_assault = "",
                      other_weapon_assault = "",
                      unarmed_assault = "",
                      forcible_entry = "",
                      nonforcible_entry = "",
                      attempted_burglary = "",
                      auto_theft = "",
                      truckbus_theft = "",
                      other_vehicle_theft = "",
                      stringsAsFactors = FALSE)
for (i in seq(4, nrow(offenses_2015), 5)) {
  row_to_check <- offenses_2015$temp[i]
  for (n in c(19, 27, 34, 41, 49, 57, 64, 71, 79,
              87, 94, 103, 111, 118, 125, 133)) {
    if (substr(row_to_check, n, n) %in% c(" ", "")) {
      substr(row_to_check, n, n) <- "0"
    }
  }
  row_to_check <- gsub("\\s+", " ", row_to_check)
  storage <- strsplit(row_to_check,
                      split = " ")

  temp <- data.frame(forcible_rape = storage[[1]][5],
                        attempted_rape = storage[[1]][6],
                        gun_robbery = storage[[1]][7],
                        knife_robbery = storage[[1]][8],
                        other_weapon_robbery = storage[[1]][9],
                        strongarm_robbery = storage[[1]][10],
                        gun_assault = storage[[1]][11],
                        knife_assault = storage[[1]][12],
                        other_weapon_assault = storage[[1]][13],
                        unarmed_assault = storage[[1]][14],
                        forcible_entry = storage[[1]][15],
                        nonforcible_entry = storage[[1]][16],
                        attempted_burglary = storage[[1]][17],
                        auto_theft = storage[[1]][18],
                        truckbus_theft = storage[[1]][19],
                        other_vehicle_theft = storage[[1]][20],
                        stringsAsFactors = FALSE)
  crimes2 <- rbind(crimes2, temp)

}
crimes2 <- crimes2[-1,]



# This grabs info on the yearly count of crime cleared for:
# violent crime, murder, rape, robbery, agg assault,
# simple assault, property crime, burglary, larcent,
# motor vehicle theft, arson

clearance1 <- data.frame(violent_crime_cleared = "",
                      murder_cleared = "",
                      rape_cleared = "",
                      robbery_cleared = "",
                      aggravated_assault_cleared = "",
                      simple_assault_cleared = "",
                      property_crime_cleared = "",
                      burglary_cleared = "",
                      larceny_cleared = "",
                      motor_vehicle_theft_cleared = "",
                      months_reported = "",
                      stringsAsFactors = FALSE)
for (i in seq(3, nrow(offenses_2015), 5)) {
  row_to_check <- offenses_2015$temp[i]
  for (n in c(21, 28, 36, 44, 54, 64, 74, 83, 93, 102, 110, 115, 120)) {
    if (substr(row_to_check, n, n) %in% c(" ", "")) {
      substr(row_to_check, n, n) <- "0"
    }
  }
  row_to_check <- gsub("\\s+", " ", row_to_check)
  storage <- strsplit(row_to_check,
                      split = " ")

  temp <- data.frame(violent_crime_cleared = storage[[1]][4],
                     murder_cleared = storage[[1]][5],
                     rape_cleared = storage[[1]][6],
                     robbery_cleared = storage[[1]][7],
                     aggravated_assault_cleared = storage[[1]][8],
                     simple_assault_cleared = storage[[1]][9],
                     property_crime_cleared = storage[[1]][10],
                     burglary_cleared = storage[[1]][11],
                     larceny_cleared = storage[[1]][12],
                     motor_vehicle_theft_cleared = storage[[1]][13],
                     months_reported = storage[[1]][15])
  clearance1 <- rbind(clearance1, temp)

}
clearance1 <- clearance1[-1,]




# This grabs info on the yearly count of crimes cleared for:
# forcible rape (completed rape), attempted rape
# gun robbery, knife robbery, other weapon robbery,
# unarmed robbery, gun assault, knife assault,
# other weapon assault, unarmed assault,
# forcible entry, nonforcible entry,
# attempted burglary, auto theft, truckbus theft,
# other vehicle theft
clearance2 <- data.frame(forcible_rape_cleared = "",
                      attempted_rape_cleared = "",
                      gun_robbery_cleared = "",
                      knife_robbery_cleared = "",
                      other_weapon_robbery_cleared = "",
                      strongarm_robbery_cleared = "",
                      gun_assault_cleared = "",
                      knife_assault_cleared = "",
                      other_weapon_assault_cleared = "",
                      unarmed_assault_cleared = "",
                      forcible_entry_cleared = "",
                      nonforcible_entry_cleared = "",
                      attempted_burglary_cleared = "",
                      auto_theft_cleared = "",
                      truckbus_theft_cleared = "",
                      other_vehicle_theft_cleared = "",
                      stringsAsFactors = FALSE)
for (i in seq(5, nrow(offenses_2015), 5)) {
  row_to_check <- offenses_2015$temp[i]
  for (n in c(19, 27, 34, 41, 49, 57, 64, 71, 79,
              87, 94, 103, 111, 118, 125, 133)) {
    if (substr(row_to_check, n, n) %in% c(" ", "")) {
      substr(row_to_check, n, n) <- "0"
    }
  }
  row_to_check <- gsub("\\s+", " ", row_to_check)
  storage <- strsplit(row_to_check,
                      split = " ")

  temp <- data.frame(forcible_rape_cleared = storage[[1]][4],
                     attempted_rape_cleared = storage[[1]][5],
                     gun_robbery_cleared = storage[[1]][6],
                     knife_robbery_cleared = storage[[1]][7],
                     other_weapon_robbery_cleared = storage[[1]][8],
                     strongarm_robbery_cleared = storage[[1]][9],
                     gun_assault_cleared = storage[[1]][10],
                     knife_assault_cleared = storage[[1]][11],
                     other_weapon_assault_cleared = storage[[1]][12],
                     unarmed_assault_cleared = storage[[1]][13],
                     forcible_entry_cleared = storage[[1]][14],
                     nonforcible_entry_cleared = storage[[1]][15],
                     attempted_burglary_cleared = storage[[1]][16],
                     auto_theft_cleared = storage[[1]][17],
                     truckbus_theft_cleared = storage[[1]][18],
                     other_vehicle_theft_cleared = storage[[1]][19],
                     stringsAsFactors = FALSE)
  clearance2 <- rbind(clearance2, temp)

}
clearance2 <- clearance2[-1,]



offenses_2015_final <- cbind(offenses_2015_final, crimes1, crimes2,
                             clearance1, clearance2)
offenses_2015_final$state <- gsub("NB", "NE",
                                  offenses_2015_final$state)
offenses_2015_final$state <- state.name[match(offenses_2015_final$state,
                                              state.abb)]

for (i in 4:ncol(offenses_2015_final)) {
  offenses_2015_final[,i] <- as.numeric(offenses_2015_final[,i])
}

offenses_2015_final$assault <- offenses_2015_final$simple_assault +
                               offenses_2015_final$aggravated_assault
offenses_2015_final$assault_cleared <-
                      offenses_2015_final$simple_assault_cleared +
                      offenses_2015_final$aggravated_assault_cleared
offenses_2015_final$all_fields <- offenses_2015_final$murder +
                                  offenses_2015_final$motor_vehicle_theft +
                                  offenses_2015_final$rape +
                                  offenses_2015_final$robbery +
                                  offenses_2015_final$assault +
                                  offenses_2015_final$burglary +
                                  offenses_2015_final$larceny
offenses_2015_final$all_fields_cleared <-
                      offenses_2015_final$murder_cleared +
                      offenses_2015_final$motor_vehicle_theft_cleared +
                      offenses_2015_final$rape_cleared +
                      offenses_2015_final$robbery_cleared +
                      offenses_2015_final$assault_cleared +
                      offenses_2015_final$burglary_cleared +
                      offenses_2015_final$larceny_cleared

for (i in 2:ncol(offenses_2015_final)) {
  offenses_2015_final[,i][is.na(offenses_2015_final[,i])] <- 0
}


offenses_2015_final$index_crime <- offenses_2015_final$violent_crime +
                                    offenses_2015_final$property_crime
offenses_2015_final$index_crime_cleared <-
  offenses_2015_final$violent_crime_cleared +
  offenses_2015_final$property_crime_cleared



UCR_2015 <- offenses_2015_final
UCR_2015$state <- tolower(UCR_2015$state)
UCR_2015$all_months_reported <- 0
UCR_2015$all_months_reported[UCR_2015$months_reported == 12] <- 1
setwd("C:/Users/user/Dropbox/R_project/crime/ucr_data")
save(UCR_2015, file = "UCR_2015.rda")
library(haven)
write_dta(UCR_2015, "UCR_2015.dta")



# This will read the 2015 LEOKA 'data'
setwd("C:/Users/user/Dropbox/R_project/crime/UCR_2015")
leoka_2015 <- data.frame(readLines("2015_leoka.txt"),
                         stringsAsFactors = FALSE)
leoka_2015 <- data.frame(leoka_2015[-grep("^1|^0|^ ORI|^ _|^ -",
                         leoka_2015[,1]),], stringsAsFactors = FALSE)
leoka_2015$ORI <- substr(leoka_2015[,1], 2, 8)
leoka_2015[,1] <- substr(leoka_2015[,1], 45, 101)
leoka_2015[,1] <- gsub("\\s+", " ", leoka_2015[,1])
leoka_list <- strsplit(leoka_2015[,1], split = " ")
leoka_2015$population <- lapply(leoka_list, `[`, 2)
leoka_2015$total_employees <- lapply(leoka_list, `[`, 3)
leoka_2015$total_officers <- lapply(leoka_list, `[`, 4)
leoka_2015$total_civilians <- lapply(leoka_list, `[`, 5)
leoka_2015[,1] <- NULL

for (i in 2:ncol(leoka_2015)) {
  leoka_2015[,i] <- gsub(",", "", leoka_2015[,i])
  leoka_2015[,i] <- unlist(leoka_2015[,i])
  leoka_2015[,i] <- as.numeric(leoka_2015[,i])
}
leoka_2015$year <- 2015
save(leoka_2015, file = "leoka_2015.rda")
