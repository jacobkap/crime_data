source(here::here('R/crosswalk.R'))
source(here::here('R/utils/global_utils.R'))
source(here::here('R/make_sps/make_human_trafficking_sps.R'))
crosswalk <- read_merge_crosswalks()

human_trafficking_monthly <- get_human_trafficking_monthly()
human_trafficking_yearly  <- get_data_yearly("human_trafficking",
                                            "2013_2018",
                                            "human_trafficking_yearly_",
                                            crosswalk)
setwd(here::here("clean_data/human_trafficking"))
save_as_zip("human_trafficking_2013_2018_")

get_human_trafficking_monthly <- function() {
  setwd(here::here("raw_data/human_trafficking"))
  files <- list.files()
  final <- data.frame()
  for (file in files) {
    data <- read_ascii_setup(file, here::here("setup_files/human_trafficking.sps")) %>%
      mutate_if(is.character, tolower) %>%
      mutate(year           = fix_years(year),
             ori            = toupper(ori),
             state_abb      = make_state_abb(state),
             covered_by_ori = as.character(covered_by_ori),
             covered_by_ori = toupper(covered_by_ori)) %>%
      select(-agency_state_name,
             -identifier_code,
             -sequence_number,
             -number_of_months_reported,
             -covered_by_population_group) %>%
      mutate_at(vars(tidyselect::ends_with("report_code")), str_replace_all,
                months_reported_fix) %>%
      mutate_at(vars(tidyselect::ends_with("report_code")), as.numeric) %>%
      mutate(number_of_months_reported = select(.,
                                                contains("report_code")) %>% rowSums()) %>%
      mutate_at(vars(tidyselect::matches("reported|unfound|actual|clr|tot")),
                replace_na, 0)

    data$state[data$state %in% c("69", "98", "99")] <- NA
    data <- month_wide_to_long(data)
    names(data) <- gsub("report_code", "month_reported_indicator",
                        names(data))


    final <- bind_rows(final, data)

  }

  final <- left_join(final, crosswalk, by = "ori")
  final <- reorder_columns(final, crosswalk)
  final <-
    final %>%
    arrange(ori,
            desc(date))

  setwd(here::here("clean_data/human_trafficking"))
  save_files(data      = final,
             year      = paste0(min(final$year), "_", max(final$year)),
             file_name = "human_trafficking_monthly_",
             save_name = "human_trafficking_monthly_",
             rda_and_stata_only = FALSE,
             codebook  = FALSE)

  return(final)
}

months_reported_fix <- c("data received"                             = "1",
                         "no human trafficking information reported" = "0",
                         "type 14, no report"                        = "0")
