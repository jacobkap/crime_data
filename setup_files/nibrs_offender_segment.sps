nibrs_offender_segment

This setup file was created using the R package asciiSetupReader(version 2.3.1) on 2020-03-02 20:00:40. For any feedback or problems (or if the file looks odd), please make a report on https://github.com/jacobkap/asciiSetupReader/issues. For more information on this package see here: https://jacobkap.github.io/asciiSetupReader/.


data list
V1      1-2
V2      3-4
V3      5-13
V4      14-25
V5      26-33
V6      34-35
V7      36-37
V8      38
V9      39
.

variable labels
V1      "segment_level"
V2      "state"
V3      "ori"
V4      "incident_number"
V5      "incident_date"
V6      "offender_sequence_number"
V7      "age_of_offender"
V8      "sex_of_offender"
V9      "race_of_offender"
.

value labels
V6        
'00'      "unknown"
V7        
'00'      "unknown"
'99'      "over 98 years old"
V8        
'M'       "male"
'F'       "female"
'U'       "unknown"
V9        
'W'       "white"
'B'       "black"
'I'       "american indian/alaskan native"
'A'       "asian/pacific islander"
'U'       "unknown"
.



execute
