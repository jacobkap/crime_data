setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/UCR_offenses")
library(readr)
library(stringr)
library(dplyr)
devtools::install_github("jacobkap/spssSetup")
library(spssSetup)

system.time(x <- spssSetup(dataset_name = "1960_offenses.txt",
               setup_file_name = "1960_offenses.sps",
               smart_col_class = TRUE))

system.time(ucr <- offenses_cleaner(dataset_name = "1960_offenses.txt",
                        setup_file_name = "1960_offenses.sps",
                        smart_col_class = TRUE))
system.time(ucr2 <- offenses_cleaner(dataset_name = "1981_offenses.txt",
                                    setup_file_name = "1981_offenses.sps",
                                    smart_col_class = TRUE))

for (i in 1961:2014) {
  timeStart <- proc.time()
  dataset <- offenses_cleaner(dataset_name = paste0(i, "_offenses.txt"),
                              setup_file_name = paste0(i, "_offenses.sps"),
                              smart_col_class = TRUE)
  ucr <- rbind(ucr, dataset)
  timeEnd <- proc.time()
  message(paste("Year", i, "completed",
                round(as.numeric((timeEnd - timeStart))[3], 5),
                "seconds elapsed", sep = " "))
}
ucr <- year_fixer(ucr)
ucr <- ucr[!is.na(ucr$year),]
load(paste0("C:/Users/user/Dropbox/R_project/crime_data/raw_data/",
            "UCR_offenses/UCR_2015.rda"))
UCR_2015 <- UCR_2015[, c(3, 5:65)]
ucr <- plyr::rbind.fill(ucr, UCR_2015)
# Makes dummy rows
all.years <- ucr[!duplicated(ucr$ORI),]
all.years <- all.years[, c(1:2)]
all.years <- do.call("rbind", replicate(56, all.years,
                                          simplify = FALSE))
ucr_years <- as.data.frame(rep(1960:2015, nrow(all.years)/56))
names(ucr_years) <- "year"
all.years <- dplyr::arrange(all.years, ORI)
all.years$year <- ucr_years$year
all.years <- merge(all.years, ucr, by = c("ORI", "year"),
                   all = TRUE)
ucr_offenses <- all.years

setwd("C:/Users/user/Dropbox/R_project/crime_data")
save(ucr_offenses, file = "ucr_offenses.rda", compress = "xz")


ucrchecking <- ucr[,c(2, 4, 7:8,5, 37, 10, 12, 15, 26, 38, 27, 31:32)]
ucrchecking <- ucrchecking[ucrchecking$year %in% 1985:2012 &
                             ucrchecking$population > 9999,]
bigcities <- ucrchecking[ucrchecking$population >= 250000,]
ucrtocheck <- ucrchecking[sample(1:nrow(ucrchecking), 1000),]
ucrtocheck <- rbind(bigcities, ucrtocheck)
ucrtocheck$available <- NA
ucrtocheck$match <- NA
ucrtocheck <- ucrtocheck[with(ucrtocheck, order(ORI)), ]
setwd("C:/Users/user/Desktop")
# write.csv(ucrtocheck, file = "ucrtocheck.csv")




offenses_cleaner <- function(dataset_name,
                             setup_file_name,
                             smart_col_class) {
  dataset <- spssSetup::spssSetup(dataset_name = dataset_name,
                    setup_file_name = setup_file_name,
                    smart_col_class = smart_col_class)
  names(dataset) <- tolower(names(dataset))
  names(dataset) <- gsub(" ", "_", names(dataset))
  names(dataset) <- gsub(":|<|>|#|/|-|,", "", names(dataset))
  names(dataset) <- gsub("__", "_", names(dataset))
  names(dataset) <- gsub("numb", "num", names(dataset))
  names(dataset) <- gsub("larcny", "larceny", names(dataset))
  dataset[, grep("months_reported", names(dataset), ignore.case = TRUE)] <-
    trimws(dataset[, grep("months_reported", names(dataset),
                        ignore.case = TRUE)])

  for (i in grep("act|cl", names(dataset))) {
    dataset[,i][dataset[,i] < -9] <- 0
  }

  for (i in grep("act|cl|ar", names(dataset))) {
    dataset[,i] <- suppressWarnings(as.numeric(dataset[,i]))
  }


  # Make yearly total columns - actual number of offenses
  # The temp part of the name is just to make it easier
  # to grep the columns for my subsetted data. It will be
  # removed from the name

  dataset$temp_murder <- rowSums(dataset[,
           grep("act_num_murder|off_murder", names(dataset))]) # Murder
  dataset$temp_manslaughter <- rowSums(dataset[,
           grep("act_num_manslghtr|off_mansau", names(dataset))]) # Manslaughter
  dataset$temp_rape <- rowSums(dataset[,
           grep("act_num_rape_totl|off_total_rape", names(dataset))]) # Rape
  dataset$temp_forcible_rape <- rowSums(dataset[,
           grep("num_forc_rape|off_rape_by_force", names(dataset))])
  # Forcible Rape
  dataset$temp_attempted_rape <- rowSums(dataset[,
           grep("act_num_atmptd_rap|off_attempt_rape",
                names(dataset))])
  # Attempted Rape
  dataset$temp_robbery <- rowSums(dataset[,
           grep("act_num_rob|off_total_robbery",
                names(dataset))]) # Robbery
  dataset$temp_gun_robbery <- rowSums(dataset[,
           grep("num_gun_rob|off_gun_robbery", names(dataset))]) # Gun Robbery
  dataset$temp_knife_robbery <- rowSums(dataset[,
           grep("num_knife_rob|off_knife_robbery",
                names(dataset))]) # Knife Robbery
  dataset$temp_other_weapon_robbery <- rowSums(dataset[,
           grep("num_oth_wpn_ro|off_oth_weap_robb",
                names(dataset))]) # Other Weapon Robbery
  dataset$temp_strongarm_robbery <- rowSums(dataset[,
           grep("num_str|off_str_arm_robb",
                names(dataset))]) # Strongarm Robbery
  dataset$temp_assault <- rowSums(dataset[,
           grep("act_num_asslt|off_total_aslt",
                names(dataset))]) # Assault
  dataset$temp_gun_assault <- rowSums(dataset[,
           grep("num_gun_ass|off_gun_aslt",
                names(dataset))]) # Gun Assault
  dataset$temp_knife_assault <- rowSums(dataset[,
           grep("num_knife_ass|off_knife_aslt",
                names(dataset))]) # Knife Assault
  dataset$temp_other_weapon_assault <- rowSums(dataset[,
           grep("act_oth_wpn_ass|off_oth_weap_aslt|act_oth_wpn_aslt",
                names(dataset))]) # Other Weapon Assault
  handfeet <- c("act_hndfeet_asl", "act_handft_ass", "off_hand_feet_aslt",
                 "num_hndft_assl", "act_num_hndft_aslt",
                "act_hnd_feet_asl", "act_num_hnd_ft_assl")
  dataset$temp_unarmed_assault <- rowSums(dataset[,
  grep(paste(handfeet, collapse = "|"),
                names(dataset))]) # Hand/feet Assault
  dataset$temp_simple_assault <- rowSums(dataset[,
  grep("act_simple_asslt|off_simple_aslt|num_simpl_assau|act_simpl_assau",
                names(dataset))]) # Simple Assault
  dataset$temp_aggravated_assault <- dataset$temp_gun_assault +
      dataset$temp_knife_assault + dataset$temp_unarmed_assault +
      dataset$temp_other_weapon_assault # Aggravated Assault
  dataset$temp_burglary <- rowSums(dataset[,
           grep("act_burglary_tot|off_total_burg|num_burg_tot",
                names(dataset))]) # Burglary
  dataset$temp_attempted_burglary <- rowSums(dataset[,
           grep("act_att_burg|off_att_force_enty|act_att_frc_entry",
                names(dataset))]) # Attempted Burglary
  dataset$temp_forcible_entry <- rowSums(dataset[,
           grep("act_force_entr|off_force_entry|act_num_force_entry",
                names(dataset))]) # Forcible entry

  nonforce_entry <- c("act_entryno_for", "off_no_force_enty",
                      "num_entr_no_frc", "act_entry_no_forc")
  dataset$temp_nonforcible_entry <- rowSums(dataset[,
           grep(paste(nonforce_entry, collapse = "|"),
                names(dataset))]) # Nonforcible entry
  dataset$temp_larceny <- rowSums(dataset[,
           grep("act_larceny_tot|off_total_larceny|act_num_larceny_totl",
                names(dataset))]) # Larceny
  dataset$temp_motor_vehicle_theft <- rowSums(dataset[,
           grep("act_vhc_theft|off_total_motor|num_all_vhc_thf|act_all_vehic",
                names(dataset))]) # Vehicle theft
  dataset$temp_auto_theft <- rowSums(dataset[,
           grep("act_auto|num_auto_theft", names(dataset))]) # Auto Theft
  dataset$temp_truckbus_theft <- rowSums(dataset[,
   grep("act_trckbus|off_truck_and_van|num_truck_theft|act_truckvan_thf|act_trck",
                names(dataset))]) # Truck/bus Theft
  dataset$temp_other_vehicle_theft <- rowSums(dataset[,
           grep("act_oth_vhc|off_other_vehicle",
                names(dataset))]) # Other vehicle Theft
  dataset$temp_all_fields <- rowSums(dataset[,
          grep("act_all_fields|off_grand_total|num_all_offncs|act_all_offenses",
               names(dataset))]) # All Fields
  dataset$temp_violent_crime <- dataset$temp_murder +
    dataset$temp_rape +
    dataset$temp_robbery +
    dataset$temp_aggravated_assault
  dataset$temp_property_crime <- dataset$temp_burglary +
    dataset$temp_larceny +
    dataset$temp_motor_vehicle_theft
  dataset$temp_index_crime <- dataset$temp_violent_crime +
                         dataset$temp_property_crime


  # Make yearly total columns - cleared number of offenses (Total cleared count)

  dataset$temp_murder_cleared <- rowSums(dataset[,
             grep("tot_clr_murder|arst_murder",
                  names(dataset))]) # Murder cleared
  dataset$temp_manslaughter_cleared <- rowSums(dataset[,
             grep("tot_clr_mans|arst_mansaugh",
                  names(dataset))]) # Manslaughter cleared
  dataset$temp_rape_cleared <- rowSums(dataset[,
             grep("tot_clr_rape|arst_total_rape",
                  names(dataset))]) # Rape cleared
  dataset$temp_forcible_rape_cleared <- rowSums(dataset[,
             grep("tot_clr_forc_rap|arst_rape_by_force",
                  names(dataset))]) # Forcible Rape
  # cleared
  dataset$temp_attempted_rape_cleared <- rowSums(dataset[,
             grep("tot_clr_atmptd_rap|arst_attempt_rape",
                  names(dataset))]) # Attempted Rape
  # cleared
  dataset$temp_robbery_cleared <- rowSums(dataset[,
             grep("tot_clr_totl_rob|arst_total_robbery|clr_robbry_totl"
                  , names(dataset))]) # Robbery cleared
  dataset$temp_gun_robbery_cleared <- rowSums(dataset[,
             grep("tot_clr_gun_rob|arst_gun_robbery",
                  names(dataset))]) # Gun Robbery cleared
  dataset$temp_knife_robbery_cleared <- rowSums(dataset[,
             grep("tot_clr_knife_rob|arst_knife_robbery",
                  names(dataset))]) # Knife Robbery
  # cleared
  dataset$temp_other_weapon_robbery_cleared <- rowSums(dataset[,
             grep("tot_clr_oth_wpn_ro|arst_oth_weap_robb",
                  names(dataset))]) # Other Weapon
  # Robbery cleared
  dataset$temp_strongarm_robbery_cleared <- rowSums(dataset[,
             grep("tot_clr_str|arst_str_arm_rob",
                  names(dataset))]) # Strongarm Robbery
  # cleared
  dataset$temp_assault_cleared <- rowSums(dataset[,
             grep("tot_clr_ass|arst_total_aslt",
                  names(dataset))]) # Assault cleared
  dataset$temp_gun_assault_cleared <- rowSums(dataset[,
             grep("tot_clr_gun_ass|arst_gun_aslt",
                  names(dataset))]) # Gun Assault cleared
  dataset$temp_knife_assault_cleared <- rowSums(dataset[,
             grep("tot_clr_knife_ass|arst_knife_aslt",
                  names(dataset))]) # Knife
    # Assault cleared
  dataset$temp_other_weapon_assault_cleared <- rowSums(dataset[,
             grep("tot_clr_oth_wpn_asl|arst_oth_weap_aslt|cl_oth_wpn_aslt",
                  names(dataset))]) # Other
  # Weapon Assault cleared
  dataset$temp_unarmed_assault_cleared <- rowSums(dataset[,
            grep("tot_clr_hnd|arst_hand_feet_aslt|tot_clr_handft_aslt",
                 names(dataset))]) # Hand/feet Assault cleared
  dataset$temp_simple_assault_cleared <- rowSums(dataset[,
           grep("tot_clr_simple|arst_simple_aslt|clr_simpl_assaul",
                names(dataset))]) # Simple Assault
  # cleared
  dataset$temp_aggravated_assault_cleared <- dataset$temp_gun_assault_cleared +
    dataset$temp_knife_assault_cleared + dataset$temp_unarmed_assault_cleared +
    dataset$temp_other_weapon_assault_cleared # Aggravated Assault cleared
  dataset$temp_burglary_cleared <- rowSums(dataset[,
          grep("tot_clr_brg|arst_total_burg|clr_burg_total",
               names(dataset))]) # Burglary cleared
  dataset$temp_attempted_burglary_cleared <- rowSums(dataset[,
          grep("tot_clr_att_burg|arst_att_force_enty|clr_att_frc_enty",
               names(dataset))]) # Attempted Burglary cleared
  dataset$temp_forcible_entry_cleared <- rowSums(dataset[,
          grep("tot_clr_forc_entr|arst_force_entry|clr_force_entry",
               names(dataset))]) # Forcible entry cleared
  dataset$temp_nonforcible_entry_cleared <- rowSums(dataset[,
          grep("tot_clr_entrno|arst_no_force_enty|clr_entr_no_frc",
               names(dataset))]) # Nonforcible entry cleared
  dataset$temp_larceny_cleared <- rowSums(dataset[,
          grep("tot_clr_larc|arst_total_larceny",
               names(dataset))]) # Larceny cleared
  dataset$temp_motor_vehicle_theft_cleared <- rowSums(dataset[,
          grep("tot_clr_vhc|arst_total_motor|clr_all_vhc_thf",
               names(dataset))]) # Vehicle theft cleared
  dataset$temp_auto_theft_cleared <- rowSums(dataset[,
          grep("tot_clr_auto|arst_auto_theft", names(dataset))])
  # Auto Theft cleared
  dataset$temp_truckbus_theft_cleared <- rowSums(dataset[,
          grep("tot_clr_trck|arst_truck_and_van|clr_truck_theft",
               names(dataset))]) # Truck/bus Theft cleared
  dataset$temp_other_vehicle_theft_cleared <- rowSums(dataset[,
          grep("tot_clr_oth_vhc|tot_cl_oth_vhc_thft|tot_cl_oth_vhc_theft",
               names(dataset))]) # Other vehicle
  #Theft cleared
  dataset$temp_all_fields_cleared <- rowSums(dataset[,
          grep("tot_clr_all|arst_grand_total", names(dataset))])
  # All Fields cleared
  dataset$temp_violent_crime_cleared <- dataset$temp_murder_cleared +
    dataset$temp_rape_cleared +
    dataset$temp_robbery_cleared +
    dataset$temp_aggravated_assault_cleared
  dataset$temp_property_crime_cleared <- dataset$temp_burglary_cleared +
    dataset$temp_larceny_cleared +
    dataset$temp_motor_vehicle_theft_cleared
  dataset$temp_index_crime_cleared <- dataset$temp_violent_crime_cleared +
    dataset$temp_property_crime_cleared


  # Subsets data into only the columns that we want to keep
  columns_to_grab <- c("ori_code", "year",
                       "^population_1",
                       "^temp", "months")
  dataset <- dataset[, grep(paste(columns_to_grab, collapse = "|"),
                          names(dataset), value = TRUE)]
  names(dataset) <- gsub("^temp_", "", names(dataset))

  dataset <- dataset[, c(grep("ori", names(dataset)),
                         grep("year", names(dataset)),
                         grep("months_rep", names(dataset)),
                         grep("pop", names(dataset)),
                         5:64)]
  names(dataset)[1:4] <- c("ORI",  "year",
                           "months_reported", "population")

  dataset$all_months_reported <- 0
  dataset$all_months_reported[grep("12|Dec", dataset$months_reported,
                               ignore.case = TRUE)] <- 1
  dataset$months_reported <- NULL


  return(dataset)
}


year_fixer <- function(dataset) {
  dataset$year <- paste0("19", dataset$year)
  dataset$year <- gsub("1919", "19", dataset$year)
  dataset$year <- gsub("1920", "20", dataset$year)
  dataset$year <- as.numeric(dataset$year)
  return(dataset)
}
