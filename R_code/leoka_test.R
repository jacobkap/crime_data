options(warn = 2)
leoka <- data.table()
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')
for (year in 1975:2015) {
  setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/LEOKA")
  message(year)
  data <- spss_ascii_reader(dataset_name = paste0(year, "_leoka.txt"),
                            sps_name = paste0(year, "_leoka.sps"))

  names(data) <- name_fixer(names(data))
  # cols <- misc_cols[misc_cols %in% names(data)]
  # data <- data[, cols]
  # data <- clean_leoka_cols(data, cols)
  # data <- data.table(data)
  # leoka <- rbind(leoka, data, fill = TRUE)

  months <- paste(toupper(month.abb), collapse = "|")
  num_cols <- names(data)[grepl(months, names(data))]
  num_cols <- c(num_cols, "POPULATION")
  num_cols <- num_cols[!grepl("^..._ASSLT_NO_INJURY$|^..._ASSLT_INJURY$|indicator",
                              num_cols, ignore.case = TRUE)]

  data[, num_cols] <- data.frame(sapply(data[, num_cols], tolower))
  data[, num_cols] <- data.frame(sapply(data[, num_cols], str_replace_all,
                                        words_in_num_cols),
                                 stringsAsFactors = FALSE)
  for (i in 1:ncol(data)) {
    if (names(data)[i] %in% num_cols) {
      data[, i] <- as.numeric(data[, i])
    }
  }
  gc(); Sys.sleep(1)

}
unique(leoka$SUB_GROUP)
unique(leoka$GROUP)



# Test to make sure all the columns needed to make the yearly data
# are in each year's data
#
# All values should be 12!!!
leoka_yearly_check()
leoka_yearly_check <- function() {
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/leoka_utils.R')
  setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/LEOKA")
  for (year in 1975:2015) {
    load(paste0("LEOKA_monthly_", year, ".rda"))
    do.call(assign, list("data", as.name(paste0("LEOKA_monthly_", year))))
    do.call(rm, list(paste0("LEOKA_monthly_", year)))
    message(year); gc()

    col_check <- c()
    for (column in yearly_cols) {
      cols <- grep(column, names(data))
      col_check <- c(col_check, length(cols))
    }
    print(summary(col_check))
  }
}
