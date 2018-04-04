# Checks for accuracy
data <- shr
cols <- c(race_cols, ethnic_cols, weapon_cols, relationship_cols,
          circumstance_cols, subcircumstance_cols, age_cols, sex_cols,
          count_cols, misc_cols)

sapply(shr[, race_cols], unique)
sapply(shr[, ethnic_cols], unique)
sapply(shr[, weapon_cols], unique)
sapply(shr[, relationship_cols], unique)
sapply(shr[, circumstance_cols], unique)
sapply(shr[, subcircumstance_cols], unique)
sapply(shr[, age_cols], unique)
sapply(shr[, sex_cols], unique)
sapply(shr[, count_cols], unique)
table(sort(shr$YEAR))
unique(shr$HOMICIDE_TYPE)
unique(shr$SITUATION)
unique(shr$GROUP)
unique(shr$SUB_GROUP)
unique(shr$GEOGRAPHIC_DIVISION)
unique(shr$STATE)
unique(shr$MONTH_OF_OFFENSE)
unique(shr$TYPE_OF_ACTION)
unique(shr$MSA_INDICATION)
summary(shr$POPULATION)
table(nchar(shr$ORI))
str(shr)
names(shr)[!names(shr) %in% c(cols, "HOMICIDE_TYPE", "SITUATION",
                             "GROUP", "SUB_GROUP", "GEOGRAPHIC_DIVISION",
                             "ORI", "YEAR", "POPULATION")]

table(substr(shr$ORI, 1, 2) == shr$state_abb)
table(shr$STATE[substr(shr$ORI, 1, 2) != shr$state_abb])



# Checks that remove additiomsl victims/offenders worked right.
# All values should be 0
sum(!is.na(shr$victim_3_age[shr$additional_victim_count < 2]))
sum(!is.na(shr$victim_2_age[shr$additional_victim_count < 1]))
sum(!is.na(shr$victim_4_race[shr$additional_victim_count < 3]))
sum(!is.na(shr$victim_11_ethnic_origin[shr$additional_victim_count < 10]))
sum(!is.na(shr$victim_9_sex[shr$additional_victim_count < 8]))
sum(!is.na(shr$victim_5_race[shr$additional_victim_count < 4]))
sum(!is.na(shr$victim_4_age[shr$additional_victim_count < 3]))
sum(!is.na(shr$victim_10_ethnic_origin[shr$additional_victim_count < 9]))
sum(!is.na(shr$victim_9_race[shr$additional_victim_count < 8]))
sum(!is.na(shr$victim_8_age[shr$additional_victim_count < 7]))

sum(!is.na(shr$offender_3_age[shr$additional_offender_count < 2]))
sum(!is.na(shr$offender_2_age[shr$additional_offender_count < 1]))
sum(!is.na(shr$offender_4_race[shr$additional_offender_count < 3]))
sum(!is.na(shr$offender_11_ethnic_origin[shr$additional_offender_count < 10]))
sum(!is.na(shr$offender_9_sex[shr$additional_offender_count < 8]))
sum(!is.na(shr$offender_5_race[shr$additional_offender_count < 4]))
sum(!is.na(shr$offender_4_age[shr$additional_offender_count < 3]))
sum(!is.na(shr$offender_10_ethnic_origin[shr$additional_offender_count < 9]))
sum(!is.na(shr$offender_9_race[shr$additional_offender_count < 8]))
sum(!is.na(shr$offender_8_age[shr$additional_offender_count < 7]))


# Looks at population and group
# Some populations aren't in the group category of population
# but that seems like its an error in the original data
summary(shr$population[shr$group == "city 25,000 thru 49,999"])
nrow(shr[shr$group == "city 25,000 thru 49,999" & shr$population < 25000, ])
summary(shr$population[shr$group == "city 250,000+"])
summary(shr$population[shr$group == "city 10,000 thru 24,999"])
nrow(shr[shr$group == "city 10,000 thru 24,999" & shr$population < 10000, ])
summary(shr$population[shr$group == "city 2,500 thru 9,999"])
nrow(shr[shr$group == "city 2,500 thru 9,999" & shr$population >= 25000, ])
summary(shr$population[shr$group == "city 100,000 thru 249,999"])
summary(shr$population[shr$group == "city 50,000 thru 99,999"])
nrow(shr[shr$group == "city 50,000 thru 99,999" & shr$population < 50000, ])
summary(shr$population[shr$group == "msa county 100,000+"])
nrow(shr[shr$group == "msa county 100,000+" & shr$population < 100000, ])
summary(shr$population[shr$group == "city 250,000 thru 499,999"])
summary(shr$population[shr$group == "msa county 25,000 thru 99,999"])
nrow(shr[shr$group == "msa county 25,000 thru 99,999" & shr$population < 25000, ])
summary(shr$population[shr$group == "non-msa county 25,000 thru 99,999"])
nrow(shr[shr$group == "non-msa county 25,000 thru 99,999" &
          shr$population < 25000, ])
nrow(shr[shr$group == "non-msa county 25,000 thru 99,999" &
          shr$population > 100000, ])
summary(shr$population[shr$group == "non-msa county under 10,000"])
nrow(shr[shr$group == "non-msa county under 10,000" & shr$population > 10000 &
       !is.na(shr$population), ])
summary(shr$population[shr$group == "city 500,000 thru 999,999"])
summary(shr$population[shr$group == "city 1,000,000+"])
summary(shr$population[shr$group == "non-msa county 100,000+"])
nrow(shr[shr$group == "non-msa county 100,000+" & shr$population < 100000, ])
summary(shr$population[shr$group == "city 10,000 thru 25,000"])
nrow(shr[shr$group == "city 10,000 thru 25,000" & shr$population < 10000, ])
summary(shr$population[shr$group == "city 100,000 thru 249,999"])
summary(shr$population[shr$group == "msa county 100,000+"])
nrow(shr[shr$group == "msa county 100,000+" & shr$population < 100000, ])
summary(shr$population[shr$sub_group == "msa county 100,000+"])
nrow(shr[shr$sub_group == "msa county 100,000+" & shr$population < 100000 &
        !is.na(shr$sub_group), ])
summary(shr$population[shr$sub_group == "city 25,000 thru 49,999"])
nrow(shr[shr$sub_group == "city 25,000 thru 49,999" & shr$population < 25000 &
          !is.na(shr$sub_group), ])
summary(shr$population[shr$sub_group == "city 250,000 thru 499,999"])
summary(shr$population[shr$sub_group == "city 10,000 thru 24,999"])
nrow(shr[shr$sub_group == "city 10,000 thru 24,999" & shr$population < 10000 &
          !is.na(shr$sub_group), ])
summary(shr$population[shr$sub_group == "city 2,500 thru 9,999"])
summary(shr$population[shr$sub_group == "msa county 25,000 thru 99,999"])
nrow(shr[shr$sub_group == "msa county 25,000 thru 99,999" &
          shr$population < 25000 & !is.na(shr$sub_group), ])
summary(shr$population[shr$sub_group == "city 100,000 thru 249,999"])
summary(shr$population[shr$sub_group == "msa county 10,000 thru 24,999"])
summary(shr$population[shr$sub_group == "non-msa county 10,000 thru 24,999"])
summary(shr$population[shr$sub_group == "non-msa county under 10,000"])
summary(shr$population[shr$sub_group == "non-msa county 25,000 thru 99,999"])
summary(shr$population[shr$sub_group == "city under 2,500"])
nrow(shr[shr$sub_group == "city under 2,500" & shr$population > 2500 &
        !is.na(shr$sub_group), ])
summary(shr$population[shr$sub_group == "city 50,000 thru 99,999"])
nrow(shr[shr$sub_group == "city 50,000 thru 99,999" & shr$population < 50000 &
          !is.na(shr$sub_group), ])
summary(shr$population[shr$sub_group == "city 500,000 thru 999,999"])
summary(shr$population[shr$sub_group == "city 1,000,000+"])
summary(shr$population[shr$sub_group == "city 1,000,000+"])
summary(shr$population[shr$sub_group == "msa county under 10,000"])