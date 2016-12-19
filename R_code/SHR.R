setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/SHR")
devtools::install_github("jacobkap/spssSetup")
library(spssSetup)

system.time(shr <- spssSetup(dataset_name = "1975_SHR.txt",
                               setup_file_name = "1975_SHR.sps",
                               smart_col_class = TRUE))
shr <- shr_cleaner(shr)

for (i in 1976:2014) {
  timeStart <- proc.time()
  dataset <- spssSetup(dataset_name = paste0(i, "_SHR.txt"),
                       setup_file_name = paste0(i, "_SHR.sps"),
                       smart_col_class = TRUE)
  dataset <- shr_cleaner(dataset)


  shr <- plyr::rbind.fill(shr, dataset)


  timeEnd <- proc.time()
  message(paste("Year", i, "completed",
                round(as.numeric((timeEnd - timeStart))[3], 5),
                "seconds elapsed", sep = " "))
}
supplementary_homicide <- shr
library(dplyr)
supplementary_homicide <- shr_subsetter(supplementary_homicide)
setwd("C:/Users/user/Dropbox/R_project/crime_data")
save(supplementary_homicide, file = "supplementary_homicide.rda",
     compress = "xz")

shr_cleaner <- function(dataset) {

  names(dataset) <- gsub(".*agency_code,*",
                         "ori_code", names(dataset))

  to_remove <- c("icpsr", "msa", "pop",
                 "update", "name", "county", "group", "part",
                 "edition", "geo", "date", "sub", "state", "under",
                 "form", "month", "output", "identifier", "incident",
                 "sequence", "indication", "type", "sit",
                 "agency")
  dataset <- dataset[,-grep(paste(to_remove, collapse = "|"),
                           names(dataset),
                           ignore.case = TRUE)]

  names(dataset) <- gsub("^_|_$",
                         "", names(dataset))
  names(dataset) <- gsub("victim_sex",
                         "victim_1_sex", names(dataset))
  names(dataset) <- gsub("victim_age",
                         "victim_1_age", names(dataset))
  names(dataset) <- gsub("victim_race",
                         "victim_1_race", names(dataset))
  names(dataset) <- gsub("perpetrator",
                         "offender", names(dataset))
  names(dataset) <- gsub("offender_sex",
                         "offender_1_sex", names(dataset))
  names(dataset) <- gsub("^weapon$",
                         "offender_1_weapon", names(dataset))
  names(dataset) <- gsub("^offender_sex$",
                         "offender_1_sex", names(dataset))
  names(dataset) <- gsub("^circumstance$",
                         "circumstance_1", names(dataset))
  names(dataset) <- gsub(".*victim_count.*",
                         "additional_victim_count", names(dataset))
  names(dataset) <- gsub(".*off.*_count.*",
                         "additional_offender_count", names(dataset))


  names(dataset) <- gsub("gender", "sex", names(dataset))
  names(dataset) <- gsub("eth.*", "hispanic", names(dataset))
  names(dataset) <- gsub("offender_(.*)_relation.*",
                         "relationship_\\1", names(dataset))
  names(dataset) <- gsub("offender_(.*)_c.*",
                         "circumstance_\\1", names(dataset))
  names(dataset) <- gsub("^_|_$",
                         "", names(dataset))
  names(dataset) <- gsub("offndr_count.*",
                         "offender_count", names(dataset))
  names(dataset) <- gsub("victim_coun.*",
                         "victim_count", names(dataset))
  names(dataset) <- gsub("type_of_offense_ho.*",
                         "homicide_type", names(dataset))
  names(dataset) <- gsub("year.*",
                         "year", names(dataset))
  names(dataset) <- gsub("perpetrator",
                         "offender", names(dataset))

  dataset <- year_fixer(dataset)
  dataset <- tolower_all(dataset)
  dataset$ori_code <- toupper(dataset$ori_code)




  return(dataset)
}


shr_subsetter <- function(dataset) {

  names(dataset) <- gsub("relationship", "offender_relationship",
                         names(dataset))
  names(dataset) <- gsub("circumstance", "offender_circumstance",
                         names(dataset))

  dataset$additional_offender_count <-
       as.numeric(dataset$additional_offender_count)
  dataset$additional_victim_count <-
       as.numeric(dataset$additional_victim_count)
  dataset$total_homicides <- dataset$additional_victim_count + 1
  dataset$total_homicides <- as.numeric(dataset$total_homicides)


  dataset$agency_count <- NULL
  #If no additional victim/offender, makes it NA in that column
  for (i in grep("victim_[2-9]|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 0] <- NA
  }
  for (i in grep("victim_[3-9]|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 1] <- NA
  }
  for (i in grep("victim_[4-9]|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 2] <- NA
  }
  for (i in grep("victim_[5-9]|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 3] <- NA
  }
  for (i in grep("victim_[6-9]|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 4] <- NA
  }
  for (i in grep("victim_[7-9]|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 5] <- NA
  }
  for (i in grep("victim_[8-9]|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 6] <- NA
  }
  for (i in grep("victim_9|victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 7] <- NA
  }
  for (i in grep("victim_10|victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 8] <- NA
  }
  for (i in grep("victim_11", names(dataset))) {
       dataset[,i][
       dataset$additional_victim_count == 9] <- NA
  }



  for (i in grep("offender.*_[2-9]|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 0] <- NA
  }
  for (i in grep("offender.*_[3-9]|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 1] <- NA
  }
  for (i in grep("offender.*_[4-9]|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 2] <- NA
  }
  for (i in grep("offender.*_[5-9]|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 3] <- NA
  }
  for (i in grep("offender.*_[6-9]|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 4] <- NA
  }
  for (i in grep("offender.*_[7-9]|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 5] <- NA
  }
  for (i in grep("offender.*_[8-9]|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 6] <- NA
  }
  for (i in grep("offender.*_9|offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 7] <- NA
  }
  for (i in grep("offender.*_10|offender.*_11",
       names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 8] <- NA
  }
  for (i in grep("offender.*_11", names(dataset))) {
       dataset[,i][
       dataset$additional_offender_count == 9] <- NA
  }



  names(dataset) <- gsub("offender_relationship", "relationship",
                         names(dataset))
  names(dataset) <- gsub("offender_circumstance", "circumstance",
                         names(dataset))

  for (i in 1:ncol(dataset)) {
    dataset[,i] <- gsub(".*inap.*|^$", NA, dataset[,i])
  }

  # Make total male/female killed/killer column
  dataset$male_victims <- 0
  dataset$female_victims <- 0
  dataset$male_offenders <- 0
  dataset$female_offenders <- 0

  for (i in 1:11) {
    # Victim sex count
  dataset$male_victims[dataset[, grep(paste0("victim_", i, "_sex"),
          names(dataset))] %in% "male"] <-
    dataset$male_victims[dataset[, grep(paste0("victim_", i, "_sex"),
            names(dataset))] %in% "male"] + 1
  dataset$female_victims[dataset[, grep(paste0("victim_", i, "_sex"),
          names(dataset))] %in% "female"] <-
    dataset$female_victims[dataset[, grep(paste0("victim_", i, "_sex"),
            names(dataset))] %in% "female"] + 1

  # Offender sex count
  dataset$male_offenders[dataset[, grep(paste0("offender_", i, "_sex"),
          names(dataset))] %in% "male"] <-
    dataset$male_offenders[dataset[, grep(paste0("offender_", i, "_sex"),
            names(dataset))] %in% "male"] + 1
  dataset$female_offenders[dataset[, grep(paste0("offender_", i, "_sex"),
          names(dataset))] %in% "female"] <-
    dataset$female_offenders[dataset[, grep(paste0("offender_", i, "_sex"),
            names(dataset))] %in% "female"] + 1
  }

  dataset <- dataset[, -grep("sex", names(dataset))]

    # Clean race
  race_columns <- grep("race", names(dataset))
  for (i in race_columns) {
    dataset[, i] <- gsub("black.*|negro.*",
                         "black", dataset[, i])
    dataset[, i] <- gsub("white.*",
                         "white", dataset[, i])
    dataset[, i] <- gsub(".*ind.*|.*esk.*",
                         "american_indian", dataset[, i])

    dataset[, i] <- gsub("chinese|japanese|asian.*|.*pacific.*|asn.*",
                         "asian", dataset[, i])
  }

  # Clean hispanic
  hispanic_columns <- grep("hispanic", names(dataset))
  for (i in hispanic_columns) {
    dataset[,i] <- gsub(".*not reported.*|.*unk.*|^$", "unknown",
                        dataset[,i])
    dataset[,i] <- gsub(".*not.*", "not hispanic", dataset[,i])
    dataset[,i] <- gsub(".*origin.*|.*latino.*", "hispanic",
                        dataset[,i])
  }


  # Makes hispanic a race
  for (i in 1:11) {
    dataset[, grep(paste0("victim_", i, "_race"), names(dataset))][dataset[,
              grep(paste0("victim_", i, "_hispanic"),
                   names(dataset))] == "hispanic"] <- "hispanic"

  }
  for (i in 1:11) {
    dataset[, grep(paste0("offender_", i, "_race"), names(dataset))][dataset[,
              grep(paste0("offender_", i, "_hispanic"),
                   names(dataset))] == "hispanic"] <- "hispanic"

  }
  # Removes hispanic columns
  dataset <- dataset[, -grep("hispanic", names(dataset))]

  # Make race columns
  dataset$white_victim <- 0
  dataset$black_victim <- 0
  dataset$hispanic_victim <- 0
  dataset$asian_victim <- 0
  dataset$american_indian_victim <- 0

  dataset$white_offender <- 0
  dataset$black_offender <- 0
  dataset$hispanic_offender <- 0
  dataset$asian_offender <- 0
  dataset$american_indian_offender <- 0

  for (i in 1:11) {
    # victim race count
    dataset$white_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "white"] <-
      dataset$white_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "white"] + 1
    dataset$black_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "black"] <-
      dataset$black_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "black"] + 1
    dataset$hispanic_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "hispanic"] <-
      dataset$hispanic_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "hispanic"] + 1
    dataset$asian_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "asian"] <-
      dataset$asian_victim[dataset[, grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "asian"] + 1
    dataset$american_indian_victim[dataset[,
            grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "american_indian"] <-
      dataset$american_indian_victim[dataset[,
            grep(paste0("victim_", i, "_race"),
            names(dataset))] %in% "american_indian"] + 1

    # Offender race count
    dataset$white_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "white"] <-
      dataset$white_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "white"] + 1
    dataset$black_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "black"] <-
      dataset$black_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "black"] + 1
    dataset$hispanic_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "hispanic"] <-
      dataset$hispanic_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "hispanic"] + 1
    dataset$asian_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "asian"] <-
      dataset$asian_offender[dataset[, grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "asian"] + 1
    dataset$american_indian_offender[dataset[,
            grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "american_indian"] <-
      dataset$american_indian_offender[dataset[,
            grep(paste0("offender_", i, "_race"),
            names(dataset))] %in% "american_indian"] + 1
  }

  dataset <- dataset[, -grep("race", names(dataset))]


  # Clean weapons
  weapon_columns <- grep("weapon", names(dataset))
  for (i in weapon_columns) {
    dataset[,i] <- gsub(".*handgun.*|hndgn.*", "handgun", dataset[,i])
    dataset[,i] <- gsub(".*knife.*|.*cutting.*|.*knfe.*", "knife", dataset[,i])
    other_firearms <- c(".*firearm type.*",
                       "^fire$", "frrm type.*", "other gun",
                       "frarm type not.*", "firarm tpe nt sttd",
                       "firrm type nt sttd", "firearm not stated",
                       "frrm not stated", "frrm not sttd")
    dataset[,i] <- gsub(paste(other_firearms, collapse = "|"),
                        "other_firearms", dataset[,i])
    dataset[,i] <- gsub("blunt.*|.*beating.*|person.*|blnt.*",
                        "beating_or_blunt_object", dataset[,i])
     other_weapons <- c("str.*", "push.*", ".*gas.*", "poison.*",
                        ".*drug.*", ".*push.*", ".*pshd.*",
                        ".*not designated.*", "asphyxiation",
                        "explosives", ".*hang.*",
                        "drowning", "arson", "^other$",
                        "othr type nt dsgntd", "othr wpn nt dsgntd",
                        "other wpn nt dsgntd")
    dataset[,i] <- gsub(paste(other_weapons, collapse = "|"),
                        "other_weapon", dataset[,i])
    dataset[,i] <- gsub(".*unk.*|90|99|oth type dk", "unknown", dataset[,i])
  }
  dataset$beating_or_blunt_object <- 0
  dataset$handgun <- 0
  dataset$rifle <- 0
  dataset$shotgun <- 0
  dataset$other_firearms <- 0
  dataset$knife <- 0
  dataset$other_weapons <- 0

  for (i in 1:11) {
  dataset$beating_or_blunt_object[dataset[,
          grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "beating_or_blunt_object"] <-
    dataset$beating_or_blunt_object[dataset[,
          grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "beating_or_blunt_object"] + 1
  dataset$handgun[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "handgun"] <-
    dataset$handgun[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "handgun"] + 1
  dataset$rifle[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "rifle"] <-
    dataset$rifle[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "rifle"] + 1
  dataset$shotgun[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "shotgun"] <-
    dataset$shotgun[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "shotgun"] + 1
  dataset$other_firearms[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "other_firearms"] <-
    dataset$other_firearms[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "other_firearms"] + 1
  dataset$knife[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "knife"] <-
    dataset$knife[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "knife"] + 1
  dataset$other_weapons[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "other_weapon"] <-
    dataset$other_weapons[dataset[, grep(paste0("offender_", i, "_weapon"),
          names(dataset))] %in% "other_weapon"] + 1

  }
  dataset <- dataset[, -grep("offender.*weapon", names(dataset))]


  # Clean relationship
  relationship_columns <- grep("relationship", names(dataset))
  for (i in relationship_columns) {
    immediate <- c(".*brother.*", ".*sister.*", "in law",
                   ".*son.*", ".*daughter.*", ".*mom.*",
                   ".*dad.*", ".*mother.*", ".*father.*")
    dataset[,i] <- gsub(paste(immediate, collapse = "|"),
                        "immediate_family", dataset[,i])
    spouse <- c(".*common.*", "homo.*", "hmsxl.*", "ex.*", "girlfriend",
                "boyfriend", "spouse",
                "wife", "husband")
    dataset[,i] <- gsub(paste(spouse, collapse = "|"),
                        "spouse", dataset[,i])
    dataset[,i] <- gsub(".*not.*|dk.*",
                        "unknown", dataset[,i])
    other_relation_terms <- c("neighbor", "oth.*known.*",
                              "emplo.*", "oth vic.*",
                              "othr knwn vctm")
    dataset[,i] <- gsub(paste0(other_relation_terms, collapse = "|"),
                        "other", dataset[,i])
  }
  dataset$acquaintance <- 0
  dataset$friend <- 0
  dataset$immediate_family <- 0
  dataset$other_relationship <- 0
  dataset$other_family <- 0
  dataset$spouse <- 0
  dataset$stranger <- 0
  dataset$unknown_relationship <- 0

  for (i in 1:11) {
    dataset$acquaintance[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "acquaintance"] <-
      dataset$acquaintance[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "acquaintance"] + 1
    dataset$friend[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "friend"] <-
      dataset$friend[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "friend"] + 1
    dataset$immediate_family[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "immediate_family"] <-
      dataset$immediate_family[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "immediate_family"] + 1
    dataset$other_relationship[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "other"] <-
      dataset$other_relationship[dataset[,
              grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "other"] + 1
    dataset$other_family[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "other family"] <-
      dataset$other_family[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "other family"] + 1
    dataset$spouse[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "spouse"] <-
      dataset$spouse[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "spouse"] + 1
    dataset$stranger[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "stranger"] <-
      dataset$stranger[dataset[, grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "stranger"] + 1
    dataset$unknown_relationship[dataset[,
              grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "unknown"] <-
      dataset$unknown_relationship[dataset[,
              grep(paste0("relationship_", i, "$"),
              names(dataset))] %in% "unknown"] + 1
  }
  dataset <- dataset[, -grep("^relationship", names(dataset))]


  # clean circumstance
  circumstance_columns <- grep("circumstance", names(dataset))
  for (i in circumstance_columns) {
    dataset[,i] <- gsub(".*brawl.*|.*argument.*|brwl.*|argmt.*",
                        "argument_brawl", dataset[,i])
    dataset[,i] <- gsub(".*gang.*|.*gng.*", "gang", dataset[,i])
    dataset[,i] <- gsub(".*po.*|.*pc.*|.*plce.*",
                      "felon_killed_by_police", dataset[,i])
    dataset[,i] <- gsub(".*civil.*|.*citn.*|.*citi.*",
                        "felon_killed_by_citizen", dataset[,i])
    dataset[,i] <- gsub(".*not.*|.*undtrmnd|.*undetermined",
                        "unknown", dataset[,i])
    dataset[,i] <- gsub("rape|.*sex.*|prost.*|.*vice.*|gambling",
                        "sex_offense_and_vice",
                        dataset[,i])
    dataset[,i] <- gsub(".*negligen.*gun|.*hunt.*|.*play.*|.*clean.*",
                        "negligent_control_of_gun", dataset[,i])
    dataset[,i] <- gsub(".*sitter.*|parent.*|.*parnt|.*bbysttr",
                        "babysitter_or_parent_kills_child", dataset[,i])
    dataset[,i] <- gsub(".*drug.*",
                        "drug_related", dataset[,i])
    dataset[,i] <- gsub(".*spouse.*|.*spous.*|love.*",
                        "lovers_triangle_or_spousal", dataset[,i])
    other_circs <- c("motor.*", "mtr.*", ".*inst.*", ".*abort.*",
                     "larc.*", "all.*", "oth fel.*", "susp.*",
                     "sniper.*", "other fam.*", "relation.*",
                     "arson", "felony murder", "32",
                     "oth non fel type")
    dataset[,i] <- gsub(paste(other_circs, collapse = "|"),
                        "other", dataset[,i])
  }

  dataset$argument_brawl <- 0
  dataset$babysitter_or_parent_kills_child <- 0
  dataset$burglary <- 0
  dataset$drug_related <- 0
  dataset$gang <- 0
  dataset$felon_killed_by_police <- 0
  dataset$felon_killed_by_citizen <- 0
  dataset$lovers_triangle_or_spousal <- 0
  dataset$negligent_control_of_gun <- 0
  dataset$other_circumstance <- 0
  dataset$robbery <- 0
  dataset$sex_offense_and_vice <- 0
  dataset$unknown_circumstance <- 0


  for (i in 1:11) {
    dataset$argument_brawl[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "argument_brawl"] <-
      dataset$argument_brawl[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "argument_brawl"] + 1
    dataset$babysitter_or_parent_kills_child[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "babysitter_or_parent_kills_child"] <-
      dataset$babysitter_or_parent_kills_child[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "babysitter_or_parent_kills_child"] + 1
    dataset$burglary[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "burglary"] <-
      dataset$burglary[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "burglary"] + 1
    dataset$drug_related[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "drug_related"] <-
      dataset$drug_related[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "drug_related"] + 1
    dataset$gang[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "gang"] <-
      dataset$gang[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "gang"] + 1
    dataset$felon_killed_by_citizen[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "felon_killed_by_citizen"] <-
        dataset$felon_killed_by_citizen[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "felon_killed_by_citizen"] + 1
    dataset$felon_killed_by_police[dataset[,
            grep(paste0("circumstance_", i, "$"),
            names(dataset))] %in% "felon_killed_by_police"] <-
      dataset$felon_killed_by_police[dataset[,
            grep(paste0("circumstance_", i, "$"),
            names(dataset))] %in% "felon_killed_by_police"] + 1
    dataset$lovers_triangle_or_spousal[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "lovers_triangle_or_spousal"] <-
      dataset$lovers_triangle_or_spousal[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "lovers_triangle_or_spousal"] + 1
    dataset$negligent_control_of_gun[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "negligent_control_of_gun"] <-
      dataset$negligent_control_of_gun[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "negligent_control_of_gun"] + 1
    dataset$other_circumstance[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "other"] <-
      dataset$other_circumstance[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "other"] + 1
    dataset$robbery[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "robbery"] <-
      dataset$robbery[dataset[, grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "robbery"] + 1
    dataset$sex_offense_and_vice[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "sex_offense_and_vice"] <-
      dataset$sex_offense_and_vice[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "sex_offense_and_vice"] + 1
    dataset$unknown_circumstance[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "unknown"] <-
      dataset$unknown_circumstance[dataset[,
              grep(paste0("circumstance_", i, "$"),
              names(dataset))] %in% "unknown"] + 1
  }
  dataset <- dataset[, -grep("^circumstance", names(dataset))]


  # Clean age
  age_columns <- grep("age", names(dataset))
  for (i in age_columns) {
    under_age_1 <- c("00", ".*unk.*", "^years old or more",
                     ".*univer.*", "^year old$|^$")
    dataset[,i] <- gsub(paste0(under_age_1, collapse = "|"),
                        "unknown", dataset[,i])
    dataset[,i] <- gsub(".*birth.*|.*day.*|.*dys.*",
                        "0", dataset[,i])
    dataset[,i] <- gsub("1 year old",
                        "1", dataset[,i])
    dataset[,i] <- gsub(".*99.*",
                        "99", dataset[,i])
  }

  dataset$victim_age_0_to_5 <- 0
  dataset$victim_age_6_to_11 <- 0
  dataset$victim_age_12_to_14 <- 0
  dataset$victim_age_15_to_17 <- 0
  dataset$victim_age_18_to_24 <- 0
  dataset$victim_age_25_to_49 <- 0
  dataset$victim_age_50_and_up <- 0
  dataset$victim_age_unknown <- 0

  dataset$offender_age_under_12 <- 0
  dataset$offender_age_12_to_17 <- 0
  dataset$offender_age_18_to_24 <- 0
  dataset$offender_age_25_to_49 <- 0
  dataset$offender_age_50_and_up <- 0
  dataset$offender_age_unknown <- 0


  for (i in 1:11) {
  dataset$victim_age_0_to_5[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("victim_", i, "_age"),
          names(dataset))])) %in% 0:5] <-
      dataset$victim_age_0_to_5[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("victim_", i, "_age"),
          names(dataset))])) %in% 0:5] + 1
  dataset$victim_age_6_to_11[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("victim_", i, "_age"),
          names(dataset))])) %in% 6:11] <-
      dataset$victim_age_6_to_11[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("victim_", i, "_age"),
          names(dataset))])) %in% 6:11] + 1
  dataset$victim_age_12_to_14[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 12:14] <-
      dataset$victim_age_12_to_14[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 12:14] + 1
  dataset$victim_age_15_to_17[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 15:17] <-
      dataset$victim_age_15_to_17[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 15:17] + 1
  dataset$victim_age_18_to_24[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 18:24] <-
      dataset$victim_age_18_to_24[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 18:24] + 1
  dataset$victim_age_25_to_49[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 25:49] <-
      dataset$victim_age_25_to_49[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 25:49] + 1
  dataset$victim_age_50_and_up[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 50:99] <-
      dataset$victim_age_50_and_up[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))])) %in% 50:99] + 1
  dataset$victim_age_unknown[
         dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))] %in% "unknown"] <-
      dataset$victim_age_unknown[
         dataset[,
         grep(paste0("victim_", i, "_age"),
         names(dataset))] %in% "unknown"] + 1


  dataset$offender_age_under_12[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("offender_", i, "_age"),
          names(dataset))])) %in% 0:11] <-
      dataset$offender_age_under_12[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("offender_", i, "_age"),
          names(dataset))])) %in% 0:11] + 1
  dataset$offender_age_12_to_17[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("offender_", i, "_age"),
          names(dataset))])) %in% 12:17] <-
    dataset$offender_age_12_to_17[
          suppressWarnings(as.numeric(dataset[,
          grep(paste0("offender_", i, "_age"),
          names(dataset))])) %in% 12:17] + 1
  dataset$offender_age_18_to_24[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))])) %in% 18:24] <-
    dataset$offender_age_18_to_24[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))])) %in% 18:24] + 1
  dataset$offender_age_25_to_49[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))])) %in% 25:49] <-
    dataset$offender_age_25_to_49[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))])) %in% 25:49] + 1
  dataset$offender_age_50_and_up[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))])) %in% 50:99] <-
    dataset$offender_age_50_and_up[
         suppressWarnings(as.numeric(dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))])) %in% 50:99] + 1
   dataset$offender_age_unknown[
         dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))] %in% "unknown"] <-
      dataset$offender_age_unknown[
         dataset[,
         grep(paste0("offender_", i, "_age"),
         names(dataset))] %in% "unknown"] + 1

  }
  dataset <- dataset[, -grep("victim.*age", names(dataset))]
  dataset <- dataset[, -grep("offender.*age", names(dataset))]
  dataset <- dataset[, -grep("additional", names(dataset))]

  dataset$total_homicides[is.na(dataset$total_homicides)] <- 1
  dataset$total_homicides <- as.numeric(dataset$total_homicides)


  dataset <- dataset %>% dplyr::group_by(ori_code, year) %>%
    dplyr::summarise_each(funs(sum))

  dataset$total_murders <- dataset$total_homicides -
                           (dataset$felon_killed_by_police +
                            dataset$felon_killed_by_citizen +
                           dataset$negligent_control_of_gun)

  names(dataset) <- paste0("SHR_", names(dataset))
  names(dataset)[1] <- "ORI"
  names(dataset)[2] <- "year"
    return(dataset)


}


year_fixer <- function(dataset) {
  dataset$year <- paste0("19", dataset$year)
  dataset$year <- gsub("1919", "19", dataset$year)
  dataset$year <- gsub("1920", "20", dataset$year)
  return(dataset)
}

tolower_all <- function(dataset) {
  for (i in 1:ncol(dataset)) {
    dataset[,i] <- tolower(dataset[,i])

  }
  return(dataset)
}


