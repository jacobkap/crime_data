source(here::here('R/make_sps/make_sps_utils.R'))
source(here::here('R/make_sps/nibrs_sps_utils.R'))
# Page 20-32

setwd(here::here("setup_files"))
make_sps_setup(file_name = "nibrs_batch_header_1_segment",
               col_positions = col_positions,
               col_labels    = col_labels,
               value_labels = c(nibrs_batch_header_1_value_labels))