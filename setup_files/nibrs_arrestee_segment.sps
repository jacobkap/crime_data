nibrs_arrestee_segment

This setup file was created using the R package asciiSetupReader(version 2.3.1) on 2020-03-17 11:18:56. For any feedback or problems (or if the file looks odd), please make a report on https://github.com/jacobkap/asciiSetupReader/issues. For more information on this package see here: https://jacobkap.github.io/asciiSetupReader/.


data list
V1       1-2
V2       3-4
V3       5-13
V4       14-25
V5       26-33
V6       34-35
V7       36-47
V8       48-55
V9       56
V10      57
V11      58-60
V12      61-62
V13      63
V14      64-65
V15      66
V16      67-68
V17      69
V18      70
V19      71
V20      72
V21      73
.

variable labels
V1       "segment_level"
V2       "state"
V3       "ori"
V4       "incident_number"
V5       "incident_date"
V6       "arrestee_sequence_number"
V7       "arrest_transaction_number"
V8       "arrest_date"
V9       "type_of_arrest"
V10      "multiple_arrestee_indicator"
V11      "ucr_arrest_offense_code"
V12      "arrestee_weapon_1"
V13      "automatic_weapon_indicator_1"
V14      "arrestee_weapon_2"
V15      "automatic_weapon_indicator_2"
V16      "age_of_arrestee"
V17      "sex_of_arrestee"
V18      "race_of_arrestee"
V19      "ethnicity_of_arrestee"
V20      "resident_status_of_arrestee"
V21      "disposition_of_arrestee_under_18"
.

value labels
V2         
'50'       "Alaska"
'01'       "Alabama"
'03'       "Arkansas"
'54'       "American Samoa"
'02'       "Arizona"
'04'       "California"
'05'       "Colorado"
'06'       "Connecticut"
'52'       "Canal Zone"
'08'       "District of Columbia"
'07'       "Delaware"
'09'       "Florida"
'10'       "Georgia"
'55'       "Guam"
'51'       "Hawaii"
'14'       "Iowa"
'11'       "Idaho"
'12'       "Illinois"
'13'       "Indiana"
'15'       "Kansas"
'16'       "Kentucky"
'17'       "Louisiana"
'20'       "Massachusetts"
'19'       "Maryland"
'18'       "Maine"
'21'       "Michigan"
'22'       "Minnesota"
'24'       "Missouri"
'23'       "Mississippi"
'25'       "Montana"
'26'       "Nebraska"
'32'       "North Carolina"
'33'       "North Dakota"
'28'       "New Hampshire"
'29'       "New Jersey"
'30'       "New Mexico"
'27'       "Nevada"
'31'       "New York"
'34'       "Ohio"
'35'       "Oklahoma"
'36'       "Oregon"
'37'       "Pennsylvania"
'53'       "Puerto Rico"
'38'       "Rhode Island"
'39'       "South Carolina"
'40'       "South Dakota"
'41'       "Tennessee"
'42'       "Texas"
'43'       "Utah"
'62'       "Virgin Islands"
'45'       "Virginia"
'44'       "Vermont"
'46'       "Washington"
'48'       "Wisconsin"
'47'       "West Virginia"
'49'       "Wyoming"
V9         
'O'        "on-view arrest (taken into custody without a warrant or previous incident report)"
'S'        "summoned/cited (not taken into custody)"
'T'        "taken into custody (based on warrant and/or previous incident report)"
V11        
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
'11A'      "rape"
'11B'      "sodomy"
'11C'      "sexual assault with an object"
'11D'      "fondling (incident liberties/child molest)"
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
'26F'      "identity theft"
'26G'      "hacking/computer invasion"
'40C'      "purchasing prostitution"
'64A'      "human trafficking - commercial sex acts"
'64B'      "human trafficking - involuntary servitude"
'720'      "animal cruelty"
V12        
'01'       "unarmed"
'11'       "firearm (type not stated)"
'12'       "handgun"
'13'       "rifle"
'14'       "shotgun"
'15'       "other firearm"
'16'       "lethal cutting instrument (e.g. switchblade knife, etc.)"
'17'       "club/blackjack/brass knuckles"
V13        
'A'        "automatic weapon"
V14        
'01'       "unarmed"
'11'       "firearm (type not stated)"
'12'       "handgun"
'13'       "rifle"
'14'       "shotgun"
'15'       "other firearm"
'16'       "lethal cutting instrument (e.g. switchblade knife, etc.)"
'17'       "club/blackjack/brass knuckles"
V15        
'A'        "automatic weapon"
V16        
'00'       "unknown"
'99'       "over 98 years old"
'NN'       "under 24 hours (neonate)"
'NB'       "1-6 days old"
'BB'       "7-364 days old"
V17        
'M'        "male"
'F'        "female"
'U'        "unknown"
V18        
'W'        "white"
'B'        "black"
'I'        "american indian/alaskan native"
'A'        "asian/pacific islander"
'U'        "unknown"
'P'        "native hawaiian or other pacific islander"
'M'        "unknown"
V19        
'H'        "hispanic origin"
'N'        "not of hispanic origin"
'U'        "unknown"
V20        
'R'        "resident"
'r'        "resident"
'N'        "nonresident"
'U'        "unknown"
V21        
'H'        "handled within department (released to parents, released with warning, etc.)"
'R'        "referred to other authorities (turned over to juvenile court, probation department, welfare agency, other police agency, criminal or adult court, etc.)"
V10        
'M'        "multiple"
'C'        "count arrestee"
'c'        "count arrestee"
'N'        "not applicable"
.



execute
