nibrs_window_exceptional_clearance_segment

This setup file was created using the R package asciiSetupReader(version 2.3.1) on 2020-03-02 18:57:44. For any feedback or problems (or if the file looks odd), please make a report on https://github.com/jacobkap/asciiSetupReader/issues. For more information on this package see here: https://jacobkap.github.io/asciiSetupReader/.


data list
V1       1-2
V2       3-4
V3       5-13
V4       14-25
V5       26-33
V6       34
V7       35-36
V8       37-38
V9       39-41
V10      42-43
V11      44-45
V12      46-49
V13      50
V14      51-58
V15      59-61
V16      62-64
V17      65-67
V18      68-70
V19      71-73
V20      74-76
V21      77-79
V22      80-82
V23      83-85
V24      86-88
.

variable labels
V1       "segment_level"
V2       "state"
V3       "ori"
V4       "incident_number"
V5       "incident_date"
V6       "report_date_indicator"
V7       "incident_date_hour"
V8       "total_offense_segments"
V9       "total_victim_segments"
V10      "total_offender_segments"
V11      "total_arrestee_segments"
V12      "city_submissions"
V13      "cleared_exceptionally"
V14      "exceptional_clearance_date"
V15      "ucr_offense_code_1"
V16      "ucr_offense_code_2"
V17      "ucr_offense_code_3"
V18      "ucr_offense_code_4"
V19      "ucr_offense_code_5"
V20      "ucr_offense_code_6"
V21      "ucr_offense_code_7"
V22      "ucr_offense_code_8"
V23      "ucr_offense_code_9"
V24      "ucr_offense_code_10"
.

value labels
V6         
'R'        "report date"
''         "incident date"
V7         
'00'       "on or between midnight and 00:59"
'01'       "on or between 01:00 and 01:59"
'02'       "on or between 02:00 and 02:59"
'03'       "on or between 03:00 and 03:59"
'04'       "on or between 04:00 and 04:59"
'05'       "on or between 05:00 and 05:59"
'06'       "on or between 06:00 and 06:59"
'07'       "on or between 07:00 and 07:59"
'08'       "on or between 08:00 and 08:59"
'09'       "on or between 09:00 and 09:59"
'10'       "on or between 10:00 and 10:59"
'11'       "on or between 11:00 and 11:59"
'12'       "on or between 12:00 and 12:59"
'13'       "on or between 13:00 and 13:59"
'14'       "on or between 14:00 and 14:59"
'15'       "on or between 15:00 and 15:59"
'16'       "on or between 16:00 and 16:59"
'17'       "on or between 17:00 and 17:59"
'18'       "on or between 18:00 and 18:59"
'19'       "on or between 19:00 and 19:59"
'20'       "on or between 20:00 and 20:59"
'21'       "on or between 21:00 and 21:59"
'22'       "on or between 22:00 and 22:59"
'23'       "on or between 23:00 and 23:59"
V13        
'A'        "death of offender"
'B'        "prosecution declined (for other than lack of probable cause)"
'C'        "extradition denied"
'D'        "victim refused to cooperate"
'E'        "juvenile/no custody"
'N'        "not applicable"
V15        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V16        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V17        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V18        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V19        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V20        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V21        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V22        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V23        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
V24        
'200'      "arson"
'13A'      "aggravated assault"
'13B'      "simple assault"
'13C'      "intimidation"
'510'      "bribery"
'220'      "burglary/breaking and entering"
'250'      "counterfeiting/forgery"
'290'      "destruction/damage/vandalism of property"
'35A'      "drug/narcotic violations"
'35B'      "drug equipment violations"
'270'      "embezzlement"
'210'      "extortion/blackmail"
'26A'      "false pretenses/swindle/confidence game"
'26B'      "credit card/atm fraud"
'26C'      "impersonation"
'26D'      "welfare fraud"
'26E'      "wire fraud"
'39A'      "betting/wagering"
'39B'      "operating/promoting/assisting gambling"
'39C'      "gambling equipment violations"
'39D'      "sports tampering"
'09A'      "murder/nonnegligent manslaughter"
'09B'      "negligent manslaughter"
'09C'      "justifiable homicide"
'100'      "kidnapping/abduction"
'23A'      "pocket-picking"
'23B'      "purse-snatching"
'23C'      "shoplifting"
'23D'      "theft from building"
'23E'      "theft from coin-operated machine or device"
'23F'      "theft from motor vehicle"
'23G'      "theft of motor vehicle parts/accessories"
'23H'      "all other larceny"
'240'      "motor vehicle theft"
'370'      "pornography/obscene material"
'40A'      "prostitution"
'40B'      "assisting or promoting prostitution"
'120'      "robbery"
'11A'      "forcible rape"
'11B'      "forcible sodomy"
'11C'      "sexual assault with an object"
'11D'      "forcible fondling (incident liberties/child molest)"
'36A'      "incest"
'36B'      "statutory rape"
'280'      "stolen property offenses (receiving, selling, etc.)"
'520'      "weapon law violations"
'90A'      "bad checks"
'90B'      "curfew/loitering/vagrancy violations"
'90C'      "disorderly conduct"
'90D'      "driving under the influence"
'90E'      "drunkenness"
'90F'      "family offenses, nonviolent"
'90G'      "liquor law violations"
'90H'      "peeping tom"
'90I'      "runaway"
'90J'      "trespass of real property"
'90Z'      "all other offenses"
.



execute
