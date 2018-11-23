context("test-offenses_known_values")
load("C:/Users/user/Dropbox/R_project/crime_data/clean_data/offenses_known/offenses_known_yearly_1960_2017.rda")
data <-
  offenses_known_yearly_1960_2017 %>%
  dplyr::filter(year %in% 1985:2014) %>%
  dplyr::arrange(year)

setwd("C:/Users/user/Dropbox/R_project/crime_data/inst/testdata")
alexander_alabama_test  <- read_clean_csv_for_tests("alexander_alabama")
fairfield_alabama_test  <- read_clean_csv_for_tests("fairfield_alabama")
fort_payne_alabama_test <- read_clean_csv_for_tests("fort_payne_alabama")
birmingham_alabama_test <- read_clean_csv_for_tests("birmingham_alabama")
mobile_alabama_test     <- read_clean_csv_for_tests("mobile_alabama")
tuscaloosa_alabama_test <- read_clean_csv_for_tests("tuscaloosa_alabama")
ozark_alabama_test      <- read_clean_csv_for_tests("ozark_alabama")
oxford_alabama_test     <- read_clean_csv_for_tests("oxford_alabama")
madison_alabama_test    <- read_clean_csv_for_tests("madison_alabama")
huntsville_alabama_test <- read_clean_csv_for_tests("huntsville_alabama")

alexander_alabama_real  <- data[data$ori %in% "AL06201" &
                                  data$year %in% alexander_alabama_test$year, ]
fairfield_alabama_real  <- data[data$ori %in% "AL00104"  &
                                  data$year %in% fairfield_alabama_test$year, ]
fort_payne_alabama_real <- data[data$ori %in% "AL02801" &
                                  data$year %in% fort_payne_alabama_test$year, ]
birmingham_alabama_real <- data[data$ori %in% "AL00102" &
                                  data$year %in% birmingham_alabama_test$year, ]
mobile_alabama_real     <- data[data$ori %in% "AL00201" &
                                  data$year %in% mobile_alabama_test$year, ]
tuscaloosa_alabama_real <- data[data$ori %in% "AL06301" &
                                  data$year %in% tuscaloosa_alabama_test$year, ]
ozark_alabama_real      <- data[data$ori %in% "AL02601" &
                                  data$year %in% ozark_alabama_test$year, ]
oxford_alabama_real     <- data[data$ori %in% "AL01105" &
                                  data$year %in% oxford_alabama_test$year, ]
madison_alabama_real    <- data[data$ori %in% "AL04702" &
                                  data$year %in% madison_alabama_test$year, ]
huntsville_alabama_real <- data[data$ori %in% "AL04701" &
                                  data$year %in% huntsville_alabama_test$year, ]


test_that("Offenses known values are accurate - same as ucrdatatool.gov", {

  # Alexander Alabama
  expect_equal(alexander_alabama_real$population,
               alexander_alabama_test$population)
  expect_equal(alexander_alabama_real$actual_murder,
               alexander_alabama_test$murder)
  expect_equal(alexander_alabama_real$actual_rape_total,
               alexander_alabama_test$rape)
  expect_equal(alexander_alabama_real$actual_robbery_total,
               alexander_alabama_test$robbery)
  expect_equal(alexander_alabama_real$actual_assault_aggravated,
               alexander_alabama_test$aggravated_assault)
  expect_equal(alexander_alabama_real$actual_burg_total,
               alexander_alabama_test$burglary)
  expect_equal(alexander_alabama_real$actual_theft_total,
               alexander_alabama_test$theft)
  expect_equal(alexander_alabama_real$actual_mtr_veh_theft_total,
               alexander_alabama_test$motor_vehicle_theft)

  # Fairfield Alabama
  expect_equal(fairfield_alabama_real$population,
               fairfield_alabama_test$population)
  expect_equal(fairfield_alabama_real$actual_murder,
               fairfield_alabama_test$murder)
  expect_equal(fairfield_alabama_real$actual_rape_total,
               fairfield_alabama_test$rape)
  expect_equal(fairfield_alabama_real$actual_robbery_total,
               fairfield_alabama_test$robbery)
  expect_equal(fairfield_alabama_real$actual_assault_aggravated,
               fairfield_alabama_test$aggravated_assault)
  expect_equal(fairfield_alabama_real$actual_burg_total,
               fairfield_alabama_test$burglary)
  expect_equal(fairfield_alabama_real$actual_theft_total,
               fairfield_alabama_test$theft)
  expect_equal(fairfield_alabama_real$actual_mtr_veh_theft_total,
               fairfield_alabama_test$motor_vehicle_theft)

})






# Cleared crimes from crime data explorer ---------------------------------

# test_that("cleared murder", {
#
#   expect_equal(alexander_alabama$actual_murder, c())
# })
#
#
# test_that("cleared rape", {
#
#   expect_equal(alexander_alabama$tot_clr_murder, c())
#
# })
#
# test_that("cleared robbery", {
#
#   expect_equal(alexander_alabama$tot_clr_robbery_total, c())
#
# })
#
# test_that("cleared aggravated assault", {
#
#   expect_equal(alexander_alabama$tot_clr_aggravated_assault, c())
#
# })
#
# test_that("cleared burglary", {
#
#   expect_equal(alexander_alabama$tot_clr_burg_total, c())
#
# })
#
# test_that("cleared theft", {
#
#   expect_equal(alexander_alabama$tot_clr_theft_total, c())
#
# })
#
# test_that("cleared motor vehicle", {
#
#   expect_equal(alexander_alabama$tot_clr_mtr_veh_theft_total, c())
#
# })
