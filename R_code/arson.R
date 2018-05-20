devtools::install_github("jacobkap/asciisetupreader")
library(asciiSetupReader)
library(tidyverse)
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/arson_utils.R')
source('C:/Users/user/Dropbox/R_project/crime_data/R_code/global_utils.R')


arson <- get_arson()
setwd("C:/Users/user/Dropbox/R_project/crime_data/clean_data/arson")
save_files(data = arson,
           year = "2001_2015",
           file_name = "ucr_arson_",
           save_name = "ucr_arson_")
zip::zip(zipfile = "ucr_arson_2001_2015.zip",
         files = list.files())

get_arson <- function() {
  arson <- data.frame()
  for (year in c(2001:2005, 2007:2015)) {
    setwd("C:/Users/user/Dropbox/R_project/crime_data/raw_data/arson")
    message(year)
    data <- spss_ascii_reader(paste0("ucr_arson_", year, ".txt"),
                              paste0("ucr_arson_", year, ".sps"))
    data$ORI_CODE <- NULL

    ori <- spss_ascii_reader(paste0("ucr_arson_", year, ".txt"),
                             paste0("ucr_arson_", year, ".sps"),
                             keep_columns = "ORI_CODE",
                             value_label_fix = FALSE)
    data <- dplyr::bind_cols(ori, data)


    data <-
      data %>%
      dplyr::rename_all(str_replace_all, arson_col_name_fix) %>%
      dplyr::rename_all(tolower) %>%
      dplyr::mutate_if(is.character, tolower) %>%
      dplyr::mutate(year                   = str_replace_all(year,
                                                             arson_year_fix),
                    year                   = as.numeric(year),
                    state_abb              = make_state_abb(state),
                    ori                    = toupper(ori),
                    group_number           = str_replace_all(group_number,
                                                             group_number_fix),
                    months_reported        = str_replace_all(months_reported,
                                                              months_reported_fix)
                    ) %>%
      dplyr::select(-matches("column|date_of|month_included"),
                    -state_name,
                    -id_code,
                    -covered_by_group) %>%
      dplyr::filter(months_reported != "no months reported",
                    ori             != "NY03200")
    names(data) <- gsub("reported_known_", "reported_", names(data))
    names(data) <- gsub("industrial_manufacturing", "industry_manufacture",
                        names(data))
    data  <- make_arson_yearly(data, arson_monthly_columns)
    arson <- bind_rows(arson, data)

  }
  source('C:/Users/user/Dropbox/R_project/crime_data/R_code/crosswalk.R')
  crosswalk <- read_merge_crosswalks()
  crosswalk_cols <- names(crosswalk)
  crosswalk_cols <- crosswalk_cols[!crosswalk_cols %in% c("ori", "ori9")]
  arson <-
    arson %>%
    dplyr::left_join(crosswalk, by = "ori") %>%
    dplyr::select(ori,
           ori9,
           state,
           state_abb,
           year,
           agency_name,
           crosswalk_cols,
           dplyr::everything())

  return(arson)
}

names(arson)
summary(arson)

