

// For manually selected folder

local filelist: dir . files "*.dta"
	di `filelist'
	foreach file of local filelist {
		use "`file'", clear
		compress
		save, replace
	}
 