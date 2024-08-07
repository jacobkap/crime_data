nibrs_offense_segment

This setup file was created using the R package asciiSetupReader(version 2.5.0) on 2022-10-05 19:00:31. For any feedback or problems (or if the file looks odd), please make a report on https://github.com/jacobkap/asciiSetupReader/issues. For more information on this package see here: https://jacobkap.github.io/asciiSetupReader/.


data list
V1       1-2
V2       3-4
V3       5-13
V4       14-25
V5       26-33
V6       34-36
V7       37
V8       38
V9       39
V10      40
V11      41-42
V12      43-44
V13      45
V14      46
V15      47
V16      48
V17      49-50
V18      51
V19      52-53
V20      54
V21      55-56
V22      57
V23      58-59
.

variable labels
V1       "segment_level"
V2       "state"
V3       "ori"
V4       "incident_number"
V5       "incident_date"
V6       "ucr_offense_code"
V7       "offense_attempted_or_completed"
V8       "offender_suspected_of_using_1"
V9       "offender_suspected_of_using_2"
V10      "offender_suspected_of_using_3"
V11      "location_type"
V12      "number_of_premises_entered"
V13      "method_of_entry"
V14      "type_criminal_activity_1"
V15      "type_criminal_activity_2"
V16      "type_criminal_activity_3"
V17      "type_weapon_force_involved_1"
V18      "automatic_weapon_indicator_1"
V19      "type_weapon_force_involved_2"
V20      "automatic_weapon_indicator_2"
V21      "type_weapon_force_involved_3"
V22      "automatic_weapon_indicator_3"
V23      "bias_motivation"
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
V7         
'A'        "attempted"
'C'        "completed"
V23        
'11'       "anti-white"
'12'       "anti-black"
'13'       "anti-american indian or alaskan native"
'14'       "anti-asian"
'15'       "anti-multi-racial group"
'21'       "anti-jewish"
'22'       "anti-catholic"
'23'       "anti-protestant"
'24'       "anti-islamic (muslim)"
'25'       "anti-other religion"
'26'       "anti-multi-religious group"
'27'       "anti-atheism/agnosticism"
'31'       "anti-arab"
'32'       "anti-hispanic"
'33'       "anti-other race/ethnicity/national origin"
'41'       "anti-gay (male)"
'42'       "anti-lesbian (female)"
'43'       "anti-lesbian, gay, bisexual, or transgender (mixed group)"
'44'       "anti-heterosexual"
'45'       "anti-bisexual"
'88'       "no bias motivation"
'99'       "unknown bias motivation"
'16'       "anti-native hawaiian or other pacific islander"
'28'       "anti-mormon"
'29'       "anti-jehovahs witness"
'51'       "anti-physical disability"
'52'       "anti-mental disability"
'61'       "anti-male"
'62'       "anti-female"
'71'       "anti-transgender"
'72'       "anti-gender non-conforming"
'81'       "anti-eastern orthodox (greek, russian, etc.)"
'82'       "anti-other christian"
'83'       "anti-buddhist"
'84'       "anti-hindu"
'85'       "anti-sikh"
V13        
'F'        "force"
'N'        "no force"
V11        
'01'       "air/bus/train terminal"
'02'       "bank/savings and loan"
'03'       "bar/nightclub"
'04'       "church/synagogue/temple"
'05'       "commercial/office building"
'06'       "construction site"
'07'       "convenience store"
'08'       "department/discount store"
'09'       "drug store/doctors office/hospital"
'10'       "field/woods"
'11'       "government/public building"
'12'       "grocery/supermarket"
'13'       "highway/road/alley"
'14'       "hotel/motel/etc."
'15'       "jail/prison"
'16'       "lake/waterway"
'17'       "liquor store"
'18'       "parking lot/garage"
'19'       "rental storage facility"
'20'       "residence/home"
'21'       "restaurant"
'22'       "school/college"
'23'       "service/gas station"
'24'       "specialty store (tv, fur, etc.)"
'25'       "other/unknown"
'37'       "abandoned/condemned structure"
'38'       "amusement park"
'39'       "arena/stadium/fairgrounds/coliseum"
'40'       "ATM separate from bank"
'41'       "auto dealership new/used"
'42'       "camp/campground"
'44'       "daycare facility"
'45'       "dock/wharf/freight/model terminal"
'46'       "farm facility"
'47'       "gambling facility/casino/race track"
'48'       "industrial site"
'49'       "military installation"
'50'       "park/playground"
'51'       "rest area"
'52'       "school - college/university"
'53'       "school - elementary/secondary"
'54'       "shelter - mission/homeless"
'55'       "shopping mall"
'56'       "tribal lands"
'57'       "community center"
'58'       "cyberspace"
V6         
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
'26F'      "identity theft"
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
V8         
'A'        "alcohol"
'C'        "computer equipment"
'D'        "drugs/narcotics"
'N'        "not applicable"
V14        
'A'        "simple/gross neglect (unintentionally, intentionally, or knowingly failing to provide food, water, shelter, veterinary care, hoarding, etc.)"
'B'        "buying/receiving"
'C'        "cultivating/manufacturing/publishing"
'D'        "distributing/selling"
'E'        "exploiting children"
'O'        "operating/promoting/assisting"
'P'        "possessing/concealing"
'T'        "transporting/transmitting/importing"
'U'        "using/consuming"
'I'        "intentional abuse and torture (tormenting, mutilating, poisoning, or abandonment)"
'S'        "animal sexual abuse (bestiality)"
'F'        "organized abuse (dog fighting and cock fighting)"
'N'        "none/unknown gang involvement (mutually exclusive)"
'G'        "other gang"
'J'        "juvenile gang involvement"
V17        
'11'       "firearm (type not stated)"
'12'       "handgun"
'13'       "rifle"
'14'       "shotgun"
'15'       "other firearm"
'20'       "knife/cutting instrument (ice pick, screwdriver, ax, etc.)"
'30'       "blunt object (club, hammer, etc.)"
'35'       "motor vehicle"
'40'       "personal weapons (hands, feet, teeth, etc.)"
'50'       "poison (include gas)"
'60'       "explosives"
'65'       "fire/incendiary device"
'70'       "drugs/narcotics/sleeping pills"
'85'       "asphyxiation (by drowning, strangulation, suffocation, gas, etc.)"
'90'       "other"
'95'       "unknown"
'99'       "none"
V18        
'A'        "automatic weapon"
V9         
'A'        "alcohol"
'C'        "computer equipment"
'D'        "drugs/narcotics"
'N'        "not applicable"
V15        
'A'        "simple/gross neglect (unintentionally, intentionally, or knowingly failing to provide food, water, shelter, veterinary care, hoarding, etc.)"
'B'        "buying/receiving"
'C'        "cultivating/manufacturing/publishing"
'D'        "distributing/selling"
'E'        "exploiting children"
'O'        "operating/promoting/assisting"
'P'        "possessing/concealing"
'T'        "transporting/transmitting/importing"
'U'        "using/consuming"
'I'        "intentional abuse and torture (tormenting, mutilating, poisoning, or abandonment)"
'S'        "animal sexual abuse (bestiality)"
'F'        "organized abuse (dog fighting and cock fighting)"
'N'        "none/unknown gang involvement (mutually exclusive)"
'G'        "other gang"
'J'        "juvenile gang involvement"
V19        
'11'       "firearm (type not stated)"
'12'       "handgun"
'13'       "rifle"
'14'       "shotgun"
'15'       "other firearm"
'20'       "knife/cutting instrument (ice pick, screwdriver, ax, etc.)"
'30'       "blunt object (club, hammer, etc.)"
'35'       "motor vehicle"
'40'       "personal weapons (hands, feet, teeth, etc.)"
'50'       "poison (include gas)"
'60'       "explosives"
'65'       "fire/incendiary device"
'70'       "drugs/narcotics/sleeping pills"
'85'       "asphyxiation (by drowning, strangulation, suffocation, gas, etc.)"
'90'       "other"
'95'       "unknown"
'99'       "none"
V20        
'A'        "automatic weapon"
V10        
'A'        "alcohol"
'C'        "computer equipment"
'D'        "drugs/narcotics"
'N'        "not applicable"
V16        
'A'        "simple/gross neglect (unintentionally, intentionally, or knowingly failing to provide food, water, shelter, veterinary care, hoarding, etc.)"
'B'        "buying/receiving"
'C'        "cultivating/manufacturing/publishing"
'D'        "distributing/selling"
'E'        "exploiting children"
'O'        "operating/promoting/assisting"
'P'        "possessing/concealing"
'T'        "transporting/transmitting/importing"
'U'        "using/consuming"
'I'        "intentional abuse and torture (tormenting, mutilating, poisoning, or abandonment)"
'S'        "animal sexual abuse (bestiality)"
'F'        "organized abuse (dog fighting and cock fighting)"
'N'        "none/unknown gang involvement (mutually exclusive)"
'G'        "other gang"
'J'        "juvenile gang involvement"
V21        
'11'       "firearm (type not stated)"
'12'       "handgun"
'13'       "rifle"
'14'       "shotgun"
'15'       "other firearm"
'20'       "knife/cutting instrument (ice pick, screwdriver, ax, etc.)"
'30'       "blunt object (club, hammer, etc.)"
'35'       "motor vehicle"
'40'       "personal weapons (hands, feet, teeth, etc.)"
'50'       "poison (include gas)"
'60'       "explosives"
'65'       "fire/incendiary device"
'70'       "drugs/narcotics/sleeping pills"
'85'       "asphyxiation (by drowning, strangulation, suffocation, gas, etc.)"
'90'       "other"
'95'       "unknown"
'99'       "none"
V22        
'A'        "automatic weapon"
.



execute
