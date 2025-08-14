#' Create organized zip files from a folder with intelligent month/year splitting
#'
#' This function creates zip files from a specified folder, organizing files by type
#' (.rds, .csv, .dta) and intelligently splitting them into month and year categories
#' when "month" keywords are detected in filenames.
#'
#' @param path Character string. Path to the folder containing files to zip.
#'   The function will process all files in this folder (non-recursive).
#'
#' @details
#' The function performs the following operations:
#' \itemize{
#'   \item Scans the specified folder for .rds, .csv, and .dta files
#'   \item Checks if any files contain the "month" keyword (case-insensitive)
#'   \item If "month" keyword is found:
#'     \itemize{
#'       \item Creates separate zip files for month and year files
#'       \item Files with "month" in name → {folder}_{type}_month.zip
#'       \item Files with "year" in name → {folder}_{type}_year.zip
#'     }
#'   \item If no "month" keyword is found:
#'     \itemize{
#'       \item Creates single zip files for each file type
#'       \item Format: {folder}_{type}.zip
#'     }
#' }
#'
#' @section File Naming Convention:
#' The function automatically generates zip file names based on the input path:
#' \itemize{
#'   \item Removes "E:/ucr_data_storage/clean_data/" and "nibrs/" from path
#'   \item Appends file type (rds, csv, dta) without the leading dot
#'   \item Adds "_month" or "_year" suffix when splitting by time categories
#' }
#'
#' @section Output Location:
#' All zip files are saved to: "E:/ucr_data_storage/clean_data/zips/"
#'
#' @section Examples:
#' \code{
#' # Basic usage - zip files from hate_crimes folder
#' make_zip_folder("E:/ucr_data_storage/clean_data/hate_crimes")
#'
#' # This will create files like:
#' # - hate_crimes_rds_month.zip (if month files exist)
#' # - hate_crimes_rds_year.zip (if year files exist)
#' # - hate_crimes_csv_month.zip (if month files exist)
#' # - hate_crimes_csv_year.zip (if year files exist)
#' # - hate_crimes_dta_month.zip (if month files exist)
#' # - hate_crimes_dta_year.zip (if year files exist)
#' }
#'
#' @section Requirements:
#' \itemize{
#'   \item Requires the \code{zip} package to be installed and loaded
#'   \item Input folder must exist and contain files
#'   \item Output directory "E:/ucr_data_storage/clean_data/zips/" will be created if it doesn't exist
#' }
#'
#' @return Invisibly returns NULL. The function creates zip files and prints messages
#'   indicating which zip files were created.
#'
#' @seealso \code{\link{zip}} for the underlying zip functionality
#'
#' @examples
#' # Zip files from hate_crimes folder
#' make_zip_folder("E:/ucr_data_storage/clean_data/hate_crimes/")
#'
#' # Zip files from nibrs/arrestee_segment/ folder
#' make_zip_folder("E:/ucr_data_storage/clean_data/nibrs/arrestee_segment/")
make_zip_folder <- function(path) {
  current_dir <- getwd()
  setwd(path)

  zip_files <- list.files(pattern = ".zip$")
  file.remove(zip_files)

  # Define the output directory for all zip files
  zip_folder_path <- "E:/ucr_data_storage/clean_data/zips/"

  # Get all files in the specified path (non-recursive)
  files <- list.files()

  # Process each file type separately
  for (type in c(".rds", ".csv", ".dta")) {
    # Filter files by current type
    files_type <- files[grepl(type, files)]

    years <- stri_extract_all_regex(files_type, "\\d+\\.?\\d*")
    years <- unique(unlist(years))
    years <- parse_number(years)

    # Skip if no files of this type found
    if (length(files_type) == 0) {
      message("No ", type, " files found in ", path)
      next
    }

    # Check if any files contain "month" keyword to determine splitting strategy
    has_month <- any(grepl("month", tolower(files_type), ignore.case = TRUE))

    if (has_month) {
      # Split files into month and year categories when month keyword is detected
      month_files <- files_type[grepl("month", tolower(files_type), ignore.case = TRUE)]
      year_files <- files_type[grepl("year", tolower(files_type), ignore.case = TRUE)]

      # Create zip for month files (if any exist)
      if (length(month_files) > 0) {
        zip_name_month <- gsub("E:/ucr_data_storage/clean_data/|nibrs/", "", path)
        zip_name_month <- gsub("/", "", zip_name_month)
        zip_name_month <- paste0(zip_name_month,
                                 "_",
                                 gsub("\\.", "", type),  # Remove leading dot from type
                                 "_",
                                 min(years),
                                 "_",
                                 max(years),
                                 "_month.zip")
        zip(zipfile = zip_name_month, files = month_files)
        message("Created month zip: ", zip_name_month)
      }

      # Create zip for year files (if any exist)
      if (length(year_files) > 0) {
        zip_name_year <- gsub("E:/ucr_data_storage/clean_data/|nibrs/", "", path)
        zip_name_year <- gsub("/", "", zip_name_year)
        zip_name_year <- paste0(zip_name_year,
                                "_",
                                gsub("\\.", "", type),  # Remove leading dot from type
                                "_",
                                min(years),
                                "_",
                                max(years),
                                "_year.zip")
        zip(zipfile = zip_name_year, files = year_files)
        message("Created year zip: ", zip_name_year)
      }
    } else {
      # No month keyword found - create single zip for all files of this type
      zip_name <- gsub("E:/ucr_data_storage/clean_data/|nibrs/|/", "", path)
      zip_name <- gsub("/", "", zip_name)
      zip_name <- paste0(zip_name,
                         "_",
                         gsub("\\.", "", type),  # Remove leading dot from type
                         "_",
                         min(years),
                         "_",
                         max(years),
                         ".zip")

      utils::zip(zipfile = zip_name, files = files_type)
      message("Created zip: ", zip_name)
    }
  }
  zip_files <- list.files(pattern = ".zip$")
  file.copy(zip_files, zip_folder_path)
  file.remove(zip_files)
  setwd(current_dir)
}


source("R/utils/global_utils.R")
folders <- list.dirs("E:/ucr_data_storage/clean_data/", full.names = TRUE, recursive = TRUE)
folders <- folders[!grepl("crosswalk|zips|compress|clean_data/$|nibrs$", folders)]
folders <- paste0(folders, "/")
folders

for (folder in folders) {
  make_zip_folder(folder)
  message(folder)
}
