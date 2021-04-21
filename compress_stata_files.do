// local wd = "D:\ucr_data_storage\clean_data"
local wd = "C:\Users\user\Dropbox\R_project\crime_data\clean_data"

cd `wd'
local subdirs : dir "." dirs "*"
foreach folder of local subdirs {
    cd `folder'
	pwd
	local filelist: dir . files "*.dta"
	di `filelist'
	foreach file of local filelist {
		use "`file'", clear
		compress
		save, replace
	}
	cd `wd'
}


// For manually selected folder
/*
local filelist: dir . files "*.dta"
	di `filelist'
	foreach file of local filelist {
		use "`file'", clear
		compress
		save, replace
	}
*/