arrests_agency_header_post_2020

This setup file was created using the R package asciiSetupReader(version 2.4.0) on 2023-04-04 10:27:58. For any feedback or problems (or if the file looks odd), please make a report on https://github.com/jacobkap/asciiSetupReader/issues. For more information on this package see here: https://jacobkap.github.io/asciiSetupReader/.


data list
V1       1
V2       2-3
V3       4-10
V4       11-12
V5       13
V6       14-15
V7       16-18
V8       19
V9       20
V10      21
V11      22
V12      23-25
V13      26-27
V14      28-32
V15      33-35
V16      36-39
V17      40
V18      41-50
V19      51-109
V20      110
V21      111-135
.

variable labels
V1       "identifier_code"
V2       "state"
V3       "ori"
V4       "population_group"
V5       "country_division"
V6       "year"
V7       "msa"
V8       "suburban"
V9       "not_used1"
V10      "report_indication"
V11      "adjustment"
V12      "offense"
V13      "not_used2"
V14      "sequence_number"
V15      "county"
V16      "not_used3"
V17      "core_city"
V18      "population"
V19      "not_used4"
V20      "agency_count"
V21      "agency_name"
.

value labels
V2        
'50'      "Alaska"
'01'      "Alabama"
'03'      "Arkansas"
'54'      "American Samoa"
'02'      "Arizona"
'04'      "California"
'05'      "Colorado"
'06'      "Connecticut"
'52'      "Canal Zone"
'08'      "District of Columbia"
'07'      "Delaware"
'09'      "Florida"
'10'      "Georgia"
'55'      "Guam"
'51'      "Hawaii"
'14'      "Iowa"
'11'      "Idaho"
'12'      "Illinois"
'13'      "Indiana"
'15'      "Kansas"
'16'      "Kentucky"
'17'      "Louisiana"
'20'      "Massachusetts"
'19'      "Maryland"
'18'      "Maine"
'21'      "Michigan"
'22'      "Minnesota"
'24'      "Missouri"
'23'      "Mississippi"
'25'      "Montana"
'26'      "Nebraska"
'32'      "North Carolina"
'33'      "North Dakota"
'28'      "New Hampshire"
'29'      "New Jersey"
'30'      "New Mexico"
'27'      "Nevada"
'31'      "New York"
'34'      "Ohio"
'35'      "Oklahoma"
'36'      "Oregon"
'37'      "Pennsylvania"
'53'      "Puerto Rico"
'38'      "Rhode Island"
'39'      "South Carolina"
'40'      "South Dakota"
'41'      "Tennessee"
'42'      "Texas"
'43'      "Utah"
'62'      "Virgin Islands"
'45'      "Virginia"
'44'      "Vermont"
'46'      "Washington"
'48'      "Wisconsin"
'47'      "West Virginia"
'49'      "Wyoming"
V4        
'0 '      "possessions"
'1 '      "city 250,000+"
'1A'      "city 1,000,000+"
'1B'      "city 500,000 thru 999,999"
'1C'      "city 250,000 thru 499,999"
'2 '      "city 100,000 thru 249,999"
'3 '      "city 50,000 thru 99,999"
'4 '      "city 25,000 thru 49,999"
'5 '      "city 10,000 thru 24,999"
'6 '      "city 2,500 thru 9,999"
'7 '      "city under 2,500"
'8 '      "non-msa county"
'8A'      "non-msa county 100,000+"
'8B'      "non-msa county 25,000 thru 99,999"
'8C'      "non-msa county 10,000 thru 24,999"
'8D'      "non-msa county under 10,000"
'8E'      "non-msa state police"
'9 '      "msa-county"
'9A'      "msa-county 100,000+"
'9B'      "msa-county 25,000 thru 99,999"
'9C'      "msa-county 10,000 thru 24,999"
'9D'      "msa-county under 10,000"
'9E'      "msa state police"
V5        
'0'       "Possessions"
'1'       "New England"
'2'       "Middle Atlantic"
'3'       "East North Central"
'4'       "West North Central"
'5'       "South Atlantic"
'6'       "East South Central"
'7'       "West South Central"
'8'       "Mountain"
'9'       "Pacific"
'A'       "New England"
'B'       "Middle Atlantic"
'C'       "East North Central"
'D'       "West North Central"
'E'       "South Atlantic"
'F'       "East South Central"
'G'       "West South Central"
'H'       "Mountain"
'I'       "Pacific"
V1        
'3'       "ASR master file"
V8        
'1'       "suburban"
'0'       "non-suburban"
V10       
'0'       "juvenile and adult reported"
'1'       "juvenile only reported"
'2'       "adult only reported"
'3'       "not reported"
V11       
'0'       "age, race, and ethnic origin reported"
'1'       "no age reported"
'2'       "no race reported"
'3'       "no ethnic origin reported"
'4'       "no race or ethnic origin reported"
'5'       "no age or ethnic origin reported"
'6'       "no age or race reported"
V17       
'Y'       "agency is core city of an MSA"
'N'       "agency is not a core city of an MSA"
.



execute
