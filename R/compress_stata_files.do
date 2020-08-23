// cd "D:\ucr_data_storage\clean_data\offenses_known"
cd "C:\Users\user\Dropbox\R_project\crime_data\clean_data\offenses_known"

local filelist: dir . files "*.dta"
foreach file of local filelist {
  use "`file'", clear
  compress
  save, replace
}
