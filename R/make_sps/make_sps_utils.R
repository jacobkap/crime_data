devtools::install_github("jacobkap/asciiSetupReader")
library(asciiSetupReader)
library(readr)

# For making sps files
setup_num_adder <- function(data, adder, iterations) {
  adder_temp <- adder
  final <- c()
  for (i in 1:iterations) {
    numbers_start <- stringr::str_split_fixed(data, "-", 2)[, 1]
    numbers_start <- as.numeric(numbers_start)

    numbers_end   <- stringr::str_split_fixed(data, "-", 2)[, 2]
    numbers_end   <- as.numeric(numbers_end)
    numbers_end[is.na(numbers_end)] <- numbers_start[is.na(numbers_end)]

    numbers_start <- numbers_start + adder
    numbers_end   <- numbers_end + adder
    temp  <- paste0(numbers_start, "-", numbers_end)
    final <- c(final, temp)
    adder <- adder + adder_temp

  }
  return(final)
}

check_raw_length <- function() {
  files <- list.files()
  files <- files[grepl("txt|dat$", files, ignore.case = TRUE)]
  for (file in files) {
    message(file)
    z <- readr::read_lines(file)

    # Gets rid of weird characters
    z = iconv(z, to = 'ASCII//TRANSLIT')
    print(table(nchar(z)))
    rm(z); gc()
  }
}


state_group_division_value_labels <- c("state = ",
                                       "50 = Alaska",
                                       "01 = Alabama",
                                       "03 = Arkansas",
                                       "54 = American Samoa",
                                       "02 = Arizona",
                                       "04 = California",
                                       "05 = Colorado",
                                       "06 = Connecticut",
                                       "52 = Canal Zone",
                                       "08 = District of Columbia",
                                       "07 = Delaware",
                                       "09 = Florida",
                                       "10 = Georgia",
                                       "55 = Guam",
                                       "51 = Hawaii",
                                       "14 = Iowa",
                                       "11 = Idaho",
                                       "12 = Illinois",
                                       "13 = Indiana",
                                       "15 = Kansas",
                                       "16 = Kentucky",
                                       "17 = Louisiana",
                                       "20 = Massachusetts",
                                       "19 = Maryland",
                                       "18 = Maine",
                                       "21 = Michigan",
                                       "22 = Minnesota",
                                       "24 = Missouri",
                                       "23 = Mississippi",
                                       "25 = Montana",
                                       "26 = Nebraska",
                                       "32 = North Carolina",
                                       "33 = North Dakota",
                                       "28 = New Hampshire",
                                       "29 = New Jersey",
                                       "30 = New Mexico",
                                       "27 = Nevada",
                                       "31 = New York",
                                       "34 = Ohio",
                                       "35 = Oklahoma",
                                       "36 = Oregon",
                                       "37 = Pennsylvania",
                                       "53 = Puerto Rico",
                                       "38 = Rhode Island",
                                       "39 = South Carolina",
                                       "40 = South Dakota",
                                       "41 = Tennessee",
                                       "42 = Texas",
                                       "43 = Utah",
                                       "62 = Virgin Islands",
                                       "45 = Virginia",
                                       "44 = Vermont",
                                       "46 = Washington",
                                       "48 = Wisconsin",
                                       "47 = West Virginia",
                                       "49 = Wyoming",
                                       "population_group = ",
                                       "0  = possessions",
                                       "1  = city 250,000+",
                                       "1A = city 1,000,000+",
                                       "1B = city 500,000 thru 999,999",
                                       "1C = city 250,000 thru 499,999",
                                       "2  = city 100,000 thru 249,999",
                                       "3  = city 50,000 thru 99,999",
                                       "4  = city 25,000 thru 49,999",
                                       "5  = city 10,000 thru 24,999",
                                       "6  = city 2,500 thru 9,999",
                                       "7  = city under 2,500",
                                       "8  = non-msa county",
                                       "8A = non-msa county 100,000+",
                                       "8B = non-msa county 25,000 thru 99,999",
                                       "8C = non-msa county 10,000 thru 24,999",
                                       "8D = non-msa county under 10,000",
                                       "8E = non-msa state police",
                                       "9  = msa-county",
                                       "9A = msa-county 100,000+",
                                       "9B = msa-county 25,000 thru 99,999",
                                       "9C = msa-county 10,000 thru 24,999",
                                       "9D = msa-county under 10,000",
                                       "9E = msa state police",
                                       "country_division = ",
                                       "0 = Possessions",
                                       "1 = New England",
                                       "2 = Middle Atlantic",
                                       "3 = East North Central",
                                       "4 = West North Central",
                                       "5 = South Atlantic",
                                       "6 = East South Central",
                                       "7 = West South Central",
                                       "8 = Mountain",
                                       "9 = Pacific")
