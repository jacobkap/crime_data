# Combine files into master file

load("crosswalk.rda")
load("leoka.rda")
load("supplementary_homicide.rda")
load("ucr_offenses.rda")


master_ucr <- dplyr::left_join(ucr_offenses, crosswalk)
master_ucr <- dplyr::left_join(master_ucr, leoka)
master_ucr <- dplyr::left_join(master_ucr, supplementary_homicide)
master_ucr <- master_ucr[-grep("99999", master_ucr$ORI),]
rownames(master_ucr) <- 1:nrow(master_ucr)
master_ucr <- master_ucr[, c(1:3, 66:103, 64:65, 4:63, 104:147)]
master_ucr <- dplyr::arrange(master_ucr, year, ORI)
save(master_ucr, file = "master_ucr.rda", compress = "xz")