cd "D:\ucr_data_storage\clean_data\nibrs"


local filelist: dir . files "*.dta"
foreach file of local filelist {
  use "`file'", clear
  compress
  save, replace
}
