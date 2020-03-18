library(haven)
convert_codebook_to_pdf <- function(file_name) {
  temp      <- readLines(file_name)
  old_name  <- file_name
  file_name <- gsub(".txt", ".Rmd", file_name)
  cat(temp, sep = "  \n", file = file_name)
  suppressMessages(rmarkdown::render(file_name,
                                     rmarkdown::pdf_document(), quiet = TRUE))
  file.remove(old_name)
  file.remove(file_name)
}

save_files <- function(data,
                       year,
                       file_name,
                       save_name,
                       rda_only = FALSE,
                       stata_only = FALSE,
                       rda_and_stata_only = TRUE,
                       codebook = FALSE) {
  data <-
    data %>%
    dplyr::mutate_if(is.Date, as.character)
  data <- ungroup(data)
  data <- as.data.frame(data)

  if (any(nchar(names(data)) > 32)) {
    print(names(data)[nchar(names(data)) > 32])
  }
  if (stata_only == FALSE) {
    assign(paste0(file_name, year), data) # Change name
    save( list = paste0(file_name, year),
          file = paste0(save_name, year, ".rda"))

  }

  if (rda_only == FALSE) {
    if (codebook) {
      codebook_name <- paste0(file_name, "_codebook_", year, ".txt")
      codebook_name <- gsub("__", "_", codebook_name)
      codebook_name <- gsub("_\\.", "\\.", codebook_name)
      memisc::Write(memisc::codebook(data),
                    file = codebook_name)
      convert_codebook_to_pdf(codebook_name)
    }


    do.call("write_dta", list(as.name(paste0(file_name, year)),
                              path = paste0(save_name,
                                            year, ".dta")))

    if (rda_and_stata_only == FALSE) {

      do.call("write_csv", list(as.name(paste0(file_name, year)),
                                path = paste0(save_name,
                                              year, ".csv")))
      do.call("write_sav", list(as.name(paste0(file_name, year)),
                                path = paste0(save_name,
                                              year, ".sav")))

    }

    do.call("rm", list(as.name(paste0(file_name, year))))
  }
}

save_as_zip <- function(file_name, pattern = NULL) {
  file_ext  <- c("rda", "dta", "csv", "sav")
  all_files <- list.files()


  all_file_extentions <- gsub(".*\\.", "", all_files)
  file_ext <- file_ext[file_ext %in% unique(all_file_extentions)]
  if (!is.null(pattern)) {
    sps_files <- all_files[grep("maltz|manual|sps$|record description",
                                all_files, ignore.case = TRUE)]
    all_files <- list.files(pattern = pattern)
    all_files <- c(sps_files, all_files)
  }

  if (any(grepl(".zip$", all_files))) {
    all_files <- all_files[-grep(".zip$", all_files)]
  }

  codebooks <- list.files(pattern = "maltz|manual|codebook|pdf$|sps$")
  # codebooks <- all_files[grep("maltz|manual|codebook|pdf$|sps$",
  #                             all_files,
  #                             ignore.case = TRUE)]
  for (i in seq_along(file_ext)) {
    zip_files <- all_files[grep(file_ext[i], all_files)]
    zip_files <- c(zip_files, codebooks)
    zip_files <- sort(zip_files)

    zip::zipr(zipfile = paste0(file_name,
                               file_ext[i], ".zip"),
              files = zip_files)
  }
}

save_raw_as_zip <- function(file_name) {
  all_files <- list.files()
  zip::zip(zipfile = paste0(file_name, ".zip"),
           files = all_files)
}
