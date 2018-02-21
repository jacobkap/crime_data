*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 34603
*         NATIONAL INCIDENT-BASED REPORTING SYSTEM, 2011: EXTRACT
*                                  FILES
*                    (DATASET 0002: VICTIM-LEVEL FILE)
* 
*
*  SPSS setup sections are provided for the ASCII version of this data
*  collection.  These sections are listed below:
*
*  DATA LIST:  assigns the name, type, decimal specification (if any),
*  and specifies the beginning and ending column locations for each
*  variable in the data file. Users must replace the "data-filename"
*  in the DATA LIST statement with a filename specifying the directory
*  on the user's computer system in which the downloaded and unzipped
*  data file is physically located (e.g., "c:\temp\34603-0002-data.txt").
*
*  VARIABLE LABELS:  assigns descriptive labels to all variables.
*  Labels and variable names may be identical for some data files.
*
*  MISSING VALUES: declares user-defined missing values. Not all
*  variables in this data set necessarily have user-defined missing
*  values. These values can be treated specially in data transformations,
*  statistical calculations, and case selection.
*
*  VALUE LABELS: assigns descriptive labels to codes found in the data
*  file.  Not all codes necessarily have assigned value labels.
*
*  VARIABLE LEVEL: assigns measurement level to each variable (scale,
*  nominal, or ordinal).
*
*  NOTE:  Users should modify this setup file to suit their specific
*  needs. The MISSING VALUES section has been commented out (i.e., '*').
*  To include the MISSING VALUES section in the final SPSS setup, remove
*  the comment indicators from the desired section.
*
*  CREATING A PERMANENT SPSS DATA FILE: If users wish to create and save
*  an SPSS data file for further analysis using SPSS for Windows, the
*  necessary "SAVE OUTFILE" command is provided in the last line of
*  this file.  To activate the command, users must delete the leading
*  asterisk (*) and replace "spss-filename" with a filename specifying
*  the location on the user's computer system to which the new data file
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da34603-0002.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=995.
DATA LIST FILE=DATA /
             SEGMENT 1-2 (A)               STATE 3-4
            ORI 5-13 (A)        INCNUM 14-25 (A)           INCDATE 26-33
           RECSBH1 34-36           RECSBH2 37-39           RECSBH3 40-42
           RECSADM 43-45           RECSOFS 46-48           RECSPRP 49-51
           RECSVIC 52-54           RECSOFR 55-57           RECSARR 58-60
             B1005 61-68             B1006 69-76        B1007 77-106 (A)
       B1008 107-108 (A)           B1009 109-110           B1010 111-112
           B1011 113-114           B1012 115-116           B1013 117-118
       B1014 119-127 (A)           B1015 128-131       B1016 132-135 (A)
           B1017 136-137           B1018 138-145           B2005 146-154
           B2006 155-157           B2007 158-160           B2008 161-169
           B2009 170-178           B2010 179-181           B2011 182-184
           B2012 185-193           B2013 194-202           B2014 203-205
           B2015 206-208           B2016 209-217           B2017 218-226
           B2018 227-229           B2019 230-232           B2020 233-241
           B3005 242-250           B3006 251-253           B3007 254-256
           B3008 257-265           B3009 266-267           B3010 268-269
           B3011 270-273           B3012 274-276           B3013 277-279
           B3014 280-282           B3015 283-285           B3016 286-288
           B3017 289-291           B3018 292-294           B3019 295-297
           B3020 298-300           B3021 301-303           B3022 304-306
           B3023 307-309           B3024 310-312           B3025 313-315
           B3026 316-318           B3027 319-321           B3028 322-324
           V1006 325-326           V1007 327-328           V1008 329-330
           V1009 331-333           V1010 334-335           V1011 336-337
       V1012 338-341 (A)           V1013 342-343           V1014 344-351
           V1016 352-353           V4006 354-356           V4007 357-359
           V4008 360-362           V4009 363-365           V4010 366-368
           V4011 369-371           V4012 372-374           V4013 375-377
           V4014 378-380           V4015 381-383           V4016 384-386
           V4017 387-388          V4017A 389-390          V4017B 391-392
      V4017C 393-401 (A)       V4018 402-405 (1)           V4019 406-407
           V4020 408-409           V4021 410-411           V4022 412-413
           V4023 414-415           V4024 416-417           V4025 418-419
           V4026 420-421           V4027 422-423           V4028 424-425
           V4029 426-427           V4030 428-429           V4031 430-431
           V4032 432-433           V4033 434-435           V4034 436-437
           V4035 438-439           V4036 440-441           V4037 442-443
           V4038 444-445           V4039 446-447           V4040 448-449
           V4041 450-451           V4042 452-453           V4043 454-455
           V4044 456-457           V4045 458-459           V4046 460-461
           V4047 462-463           V4048 464-465           V4049 466-467
           V4050 468-469          V20061 470-472          V20062 473-475
          V20063 476-478          V20071 479-480          V20072 481-482
          V20073 483-484          V20081 485-486          V20082 487-488
          V20083 489-490          V20091 491-492          V20092 493-494
          V20093 495-496          V20101 497-498          V20102 499-500
          V20103 501-502          V20111 503-504          V20112 505-506
          V20113 507-508          V20121 509-510          V20122 511-512
          V20123 513-514          V20131 515-516          V20132 517-518
          V20133 519-520          V20141 521-522          V20142 523-524
          V20143 525-526          V20151 527-528          V20152 529-530
          V20153 531-532          V20161 533-534          V20162 535-536
          V20163 537-538          V20171 539-541          V20172 542-544
          V20173 545-547          V20181 548-550          V20182 551-553
          V20183 554-556          V20191 557-559          V20192 560-562
          V20193 563-565          V20201 566-567          V20202 568-569
          V20203 570-571          V30061 572-573          V30062 574-575
          V30063 576-577          V30071 578-579          V30072 580-581
          V30073 582-583          V30081 584-592          V30082 593-601
          V30083 602-610          V30091 611-618          V30092 619-626
          V30093 627-634          V30101 635-636          V30102 637-638
          V30103 639-640          V30111 641-642          V30112 643-644
          V30113 645-646          V30121 647-648          V30122 649-650
          V30123 651-652          V30131 653-661          V30132 662-670
          V30133 671-679          V30141 680-682          V30142 683-685
          V30143 686-688          V30151 689-690          V30152 691-692
          V30153 693-694          V30161 695-696          V30162 697-698
          V30163 699-700          V30171 701-709          V30172 710-718
          V30173 719-727          V30181 728-730          V30182 731-733
          V30183 734-736          V30191 737-738          V30192 739-740
          V30193 741-742          V30201 743-744          V30202 745-746
          V30203 747-748          V30211 749-757          V30212 758-766
          V30213 767-775          V30221 776-778          V30222 779-781
          V30223 782-784          V30231 785-786          V30232 787-788
          V30233 789-790          V50061 791-792          V50062 793-794
          V50063 795-796          V50071 797-798          V50072 799-800
          V50073 801-802          V50081 803-804          V50082 805-806
          V50083 807-808          V50091 809-810          V50092 811-812
          V50093 813-814          V60061 815-816          V60062 817-818
          V60063 819-820      V60071 821-832 (A)      V60072 833-844 (A)
      V60073 845-856 (A)          V60081 857-864          V60082 865-872
          V60083 873-880          V60091 881-882          V60092 883-884
          V60093 885-886          V60101 887-888          V60102 889-890
          V60103 891-892          V60111 893-895          V60112 896-898
          V60113 899-901          V60121 902-904          V60122 905-907
          V60123 908-910          V60131 911-913          V60132 914-916
          V60133 917-919          V60141 920-921          V60142 922-923
          V60143 924-925          V60151 926-927          V60152 928-929
          V60153 930-931          V60161 932-933          V60162 934-935
          V60163 936-937          V60171 938-939          V60172 940-941
          V60173 942-943          V60181 944-945          V60182 946-947
          V60183 948-949          V60191 950-951          V60192 952-953
          V60193 954-955     ALLOFNS 956-995 (A)
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   SEGMENT   'SEGMENT LEVEL' /
   STATE     'NUMERIC STATE CODE' /
   ORI       'ORIGINATING AGENCY IDENTIFIER' /
   INCNUM    'INCIDENT NUMBER' /
   INCDATE   'INCIDENT DATE' /
   RECSBH1   'N BATCH HEADER 1 RECORDS PER ORI-INCIDENT NUMBER' /
   RECSBH2   'N BATCH HEADER 2 RECORDS PER ORI-INCIDENT NUMBER' /
   RECSBH3   'N BATCH HEADER 3 RECORDS PER ORI-INCIDENT NUMBER' /
   RECSADM   'N ADMINISTRATIVE (01) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSOFS   'N OFFENSE (02) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSPRP   'N PROPERTY (03) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSVIC   'N VICTIM (04) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSOFR   'N OFFENDER (05) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSARR   'N ARRESTEE (06) RECORDS PER ORI-INCIDENT NUMBER' /
   B1005     'DATE ORI WAS ADDED' /
   B1006     'DATE ORI WENT NIBRS' /
   B1007     'CITY NAME' /
   B1008     'STATE ABBREVIATION' /
   B1009     'POPULATION GROUP' /
   B1010     'COUNTRY DIVISION' /
   B1011     'COUNTRY REGION' /
   B1012     'AGENCY INDICATOR' /
   B1013     'CORE CITY' /
   B1014     'COVERED BY ORI' /
   B1015     'FBI FIELD OFFICE' /
   B1016     'JUDICIAL DISTRICT' /
   B1017     'AGENCY NIBRS FLAG' /
   B1018     'AGENCY INACTIVE DATE' /
   B2005     'CURRENT POPULATION 1' /
   B2006     'UCR COUNTY CODE 1' /
   B2007     'MSA CODE 1' /
   B2008     'LAST POPULATION 1' /
   B2009     'CURRENT POPULATION 2' /
   B2010     'UCR COUNTY CODE 2' /
   B2011     'MSA CODE 2' /
   B2012     'LAST POPULATION 2' /
   B2013     'CURRENT POPULATION 3' /
   B2014     'UCR COUNTY CODE 3' /
   B2015     'MSA CODE 3' /
   B2016     'LAST POPULATION 3' /
   B2017     'CURRENT POPULATION 4' /
   B2018     'UCR COUNTY CODE 4' /
   B2019     'MSA CODE 4' /
   B2020     'LAST POPULATION 4' /
   B3005     'CURRENT POPULATION 5' /
   B3006     'UCR COUNTY CODE 5' /
   B3007     'MSA CODE 5' /
   B3008     'LAST POPULATION 5' /
   B3009     '01-06-12 INDICATOR' /
   B3010     'NUMBER OF MONTHS REPORTED' /
   B3011     'MASTER FILE YEAR' /
   B3012     'AGENCY ACTIVITY INDICATORS JANUARY (See Codebook)' /
   B3013     'AGENCY ACTIVITY INDICATORS FEBRUARY (See Codebook)' /
   B3014     'AGENCY ACTIVITY INDICATORS MARCH (See Codebook)' /
   B3015     'AGENCY ACTIVITY INDICATORS APRIL (See Codebook)' /
   B3016     'AGENCY ACTIVITY INDICATORS MAY (See Codebook)' /
   B3017     'AGENCY ACTIVITY INDICATORS JUNE (See Codebook)' /
   B3018     'AGENCY ACTIVITY INDICATORS JULY (See Codebook)' /
   B3019     'AGENCY ACTIVITY INDICATORS AUGUST (See Codebook)' /
   B3020     'AGENCY ACTIVITY INDICATORS SEPTEMBER (See Codebook)' /
   B3021     'AGENCY ACTIVITY INDICATORS OCTOBER (See Codebook)' /
   B3022     'AGENCY ACTIVITY INDICATORS NOVEMBER (See Codebook)' /
   B3023     'AGENCY ACTIVITY INDICATORS DECEMBER (See Codebook)' /
   B3024     'FIPS COUNTY 1' /
   B3025     'FIPS COUNTY 2' /
   B3026     'FIPS COUNTY 3' /
   B3027     'FIPS COUNTY 4' /
   B3028     'FIPS COUNTY 5' /
   V1006     'REPORT DATE INDICATOR' /
   V1007     'INCIDENT DATE HOUR' /
   V1008     'TOTAL OFFENSE SEGMENTS' /
   V1009     'TOTAL VICTIM SEGMENTS' /
   V1010     'TOTAL OFFENDER SEGMENTS' /
   V1011     'TOTAL ARRESTEE SEGMENTS' /
   V1012     'CITY SUBMISSION' /
   V1013     'CLEARED EXCEPTIONALLY' /
   V1014     'EXCEPTIONAL CLEARANCE DATE' /
   V1016     'CARGO THEFT' /
   V4006     'VICTIM SEQUENCE NUMBER' /
   V4007     'UCR OFFENSE CODE 1' /
   V4008     'UCR OFFENSE CODE 2' /
   V4009     'UCR OFFENSE CODE 3' /
   V4010     'UCR OFFENSE CODE 4' /
   V4011     'UCR OFFENSE CODE 5' /
   V4012     'UCR OFFENSE CODE 6' /
   V4013     'UCR OFFENSE CODE 7' /
   V4014     'UCR OFFENSE CODE 8' /
   V4015     'UCR OFFENSE CODE 9' /
   V4016     'UCR OFFENSE CODE 10' /
   V4017     'TYPE OF VICTIM' /
   V4017A    'TYPE OF ACTIVITY (OFFICER' /
   V4017B    'ASSIGNMENT TYPE (OFFICER)' /
   V4017C    'ORI OTHER JURISDICTION (OFFICER)' /
   V4018     'AGE OF VICTIM' /
   V4019     'SEX OF VICTIM' /
   V4020     'RACE OF VICTIM' /
   V4021     'ETHNICITY OF VICTIM' /
   V4022     'RESIDENT STATUS OF VICTIM' /
   V4023     'AGG ASLT/HOMICIDE CIRCUMSTANCE 1' /
   V4024     'AGG ASLT/HOMICIDE CIRCUMSTANCE 2' /
   V4025     'ADDITIONAL JUSTIFIABLE HOMICIDE CIRCUMSTANCES' /
   V4026     'INJURY 1' /
   V4027     'INJURY 2' /
   V4028     'INJURY 3' /
   V4029     'INJURY 4' /
   V4030     'INJURY 5' /
   V4031     'OFFENDER NUMBER 1' /
   V4032     'RELATIONSHIP VIC TO OFF 1' /
   V4033     'OFFENDER NUMBER 2' /
   V4034     'RELATIONSHIP VIC TO OFF 2' /
   V4035     'OFFENDER NUMBER 3' /
   V4036     'RELATIONSHIP VIC TO OFF 3' /
   V4037     'OFFENDER NUMBER 4' /
   V4038     'RELATIONSHIP VIC TO OFF 4' /
   V4039     'OFFENDER NUMBER 5' /
   V4040     'RELATIONSHIP VIC TO OFF 5' /
   V4041     'OFFENDER NUMBER 6' /
   V4042     'RELATIONSHIP VIC TO OFF 6' /
   V4043     'OFFENDER NUMBER 7' /
   V4044     'RELATIONSHIP VIC TO OFF 7' /
   V4045     'OFFENDER NUMBER 8' /
   V4046     'RELATIONSHIP VIC TO OFF 8' /
   V4047     'OFFENDER NUMBER 9' /
   V4048     'RELATIONSHIP VIC TO OFF 9' /
   V4049     'OFFENDER NUMBER 10' /
   V4050     'RELATIONSHIP VIC TO OFF 10' /
   V20061    'UCR OFFENSE CODE - 1' /
   V20062    'UCR OFFENSE CODE - 2' /
   V20063    'UCR OFFENSE CODE - 3' /
   V20071    'OFFENSE ATTEMPTED / COMPLETED - 1' /
   V20072    'OFFENSE ATTEMPTED / COMPLETED - 2' /
   V20073    'OFFENSE ATTEMPTED / COMPLETED - 3' /
   V20081    'OFFENDER(S) SUSPECTED OF USING 1 - 1' /
   V20082    'OFFENDER(S) SUSPECTED OF USING 1 - 2' /
   V20083    'OFFENDER(S) SUSPECTED OF USING 1 - 3' /
   V20091    'OFFENDER(S) SUSPECTED OF USING 2 - 1' /
   V20092    'OFFENDER(S) SUSPECTED OF USING 2 - 2' /
   V20093    'OFFENDER(S) SUSPECTED OF USING 2 - 3' /
   V20101    'OFFENDER(S) SUSPECTED OF USING 3 - 1' /
   V20102    'OFFENDER(S) SUSPECTED OF USING 3 - 2' /
   V20103    'OFFENDER(S) SUSPECTED OF USING 3 - 3' /
   V20111    'LOCATION TYPE - 1' /
   V20112    'LOCATION TYPE - 2' /
   V20113    'LOCATION TYPE - 3' /
   V20121    'NUMBER OF PREMISES ENTERED - 1' /
   V20122    'NUMBER OF PREMISES ENTERED - 2' /
   V20123    'NUMBER OF PREMISES ENTERED - 3' /
   V20131    'METHOD OF ENTRY - 1' /
   V20132    'METHOD OF ENTRY - 2' /
   V20133    'METHOD OF ENTRY - 3' /
   V20141    'TYPE CRIMINAL ACTIVITY/GANG INFO 1 - 1' /
   V20142    'TYPE CRIMINAL ACTIVITY/GANG INFO 1 - 2' /
   V20143    'TYPE CRIMINAL ACTIVITY/GANG INFO 1 - 3' /
   V20151    'TYPE CRIMINAL ACTIVITY/GANG INFO 2 - 1' /
   V20152    'TYPE CRIMINAL ACTIVITY/GANG INFO 2 - 2' /
   V20153    'TYPE CRIMINAL ACTIVITY/GANG INFO 2 - 3' /
   V20161    'TYPE CRIMINAL ACTIVITY/GANG INFO 3 - 1' /
   V20162    'TYPE CRIMINAL ACTIVITY/GANG INFO 3 - 2' /
   V20163    'TYPE CRIMINAL ACTIVITY/GANG INFO 3 - 3' /
   V20171    'WEAPON / FORCE 1 - 1' /
   V20172    'WEAPON / FORCE 1 - 2' /
   V20173    'WEAPON / FORCE 1 - 3' /
   V20181    'WEAPON / FORCE 2 - 1' /
   V20182    'WEAPON / FORCE 2 - 2' /
   V20183    'WEAPON / FORCE 2 - 3' /
   V20191    'WEAPON / FORCE 3 - 1' /
   V20192    'WEAPON / FORCE 3 - 2' /
   V20193    'WEAPON / FORCE 3 - 3' /
   V20201    'BIAS MOTIVATION - 1' /
   V20202    'BIAS MOTIVATION - 2' /
   V20203    'BIAS MOTIVATION - 3' /
   V30061    'TYPE PROPERTY LOSS - 1' /
   V30062    'TYPE PROPERTY LOSS - 2' /
   V30063    'TYPE PROPERTY LOSS - 3' /
   V30071    'PROPERTY DESCRIPTION - 1' /
   V30072    'PROPERTY DESCRIPTION - 2' /
   V30073    'PROPERTY DESCRIPTION - 3' /
   V30081    'VALUE OF PROPERTY - 1' /
   V30082    'VALUE OF PROPERTY - 2' /
   V30083    'VALUE OF PROPERTY - 3' /
   V30091    'DATE RECOVERED - 1' /
   V30092    'DATE RECOVERED - 2' /
   V30093    'DATE RECOVERED - 3' /
   V30101    'NUMBER OF STOLEN MOTOR VEHICLES - 1' /
   V30102    'NUMBER OF STOLEN MOTOR VEHICLES - 2' /
   V30103    'NUMBER OF STOLEN MOTOR VEHICLES - 3' /
   V30111    'NUMBER OF RECOVERED MOTOR VEHICLES - 1' /
   V30112    'NUMBER OF RECOVERED MOTOR VEHICLES - 2' /
   V30113    'NUMBER OF RECOVERED MOTOR VEHICLES - 3' /
   V30121    'SUSPECTED DRUG TYPE 1 - 1' /
   V30122    'SUSPECTED DRUG TYPE 1 - 2' /
   V30123    'SUSPECTED DRUG TYPE 1 - 3' /
   V30131    'ESTIMATED QUANTITY 1 - 1' /
   V30132    'ESTIMATED QUANTITY 1 - 2' /
   V30133    'ESTIMATED QUANTITY 1 - 3' /
   V30141    'ESTIMATED QTY 1 1/1000TH - 1' /
   V30142    'ESTIMATED QTY 1 1/1000TH - 2' /
   V30143    'ESTIMATED QTY 1 1/1000TH - 3' /
   V30151    'TYPE MEASUREMENT 1 - 1' /
   V30152    'TYPE MEASUREMENT 1 - 2' /
   V30153    'TYPE MEASUREMENT 1 - 3' /
   V30161    'SUSPECTED DRUG TYPE 2 - 1' /
   V30162    'SUSPECTED DRUG TYPE 2 - 2' /
   V30163    'SUSPECTED DRUG TYPE 2 - 3' /
   V30171    'ESTIMATED QUANTITY 2 - 1' /
   V30172    'ESTIMATED QUANTITY 2 - 2' /
   V30173    'ESTIMATED QUANTITY 2 - 3' /
   V30181    'ESTIMATED QTY 2 1/1000TH - 1' /
   V30182    'ESTIMATED QTY 2 1/1000TH - 2' /
   V30183    'ESTIMATED QTY 2 1/1000TH - 3' /
   V30191    'TYPE MEASUREMENT 2 - 1' /
   V30192    'TYPE MEASUREMENT 2 - 2' /
   V30193    'TYPE MEASUREMENT 2 - 3' /
   V30201    'SUSPECTED DRUG TYPE 3 - 1' /
   V30202    'SUSPECTED DRUG TYPE 3 - 2' /
   V30203    'SUSPECTED DRUG TYPE 3 - 3' /
   V30211    'ESTIMATED QUANTITY 3 - 1' /
   V30212    'ESTIMATED QUANTITY 3 - 2' /
   V30213    'ESTIMATED QUANTITY 3 - 3' /
   V30221    'ESTIMATED QTY 3 1/1000TH - 1' /
   V30222    'ESTIMATED QTY 3 1/1000TH - 2' /
   V30223    'ESTIMATED QTY 3 1/1000TH - 3' /
   V30231    'TYPE MEASUREMENT 3 - 1' /
   V30232    'TYPE MEASUREMENT 3 - 2' /
   V30233    'TYPE MEASUREMENT 3 - 3' /
   V50061    'OFFENDER SEQUENCE NUMBER - 1' /
   V50062    'OFFENDER SEQUENCE NUMBER - 2' /
   V50063    'OFFENDER SEQUENCE NUMBER - 3' /
   V50071    'AGE OF OFFENDER - 1' /
   V50072    'AGE OF OFFENDER - 2' /
   V50073    'AGE OF OFFENDER - 3' /
   V50081    'SEX OF OFFENDER - 1' /
   V50082    'SEX OF OFFENDER - 2' /
   V50083    'SEX OF OFFENDER - 3' /
   V50091    'RACE OF OFFENDER - 1' /
   V50092    'RACE OF OFFENDER - 2' /
   V50093    'RACE OF OFFENDER - 3' /
   V60061    'ARRESTEE SEQUENCE NUMBER - 1' /
   V60062    'ARRESTEE SEQUENCE NUMBER - 2' /
   V60063    'ARRESTEE SEQUENCE NUMBER - 3' /
   V60071    'ARREST TRANSACTION NUMBER - 1' /
   V60072    'ARREST TRANSACTION NUMBER - 2' /
   V60073    'ARREST TRANSACTION NUMBER - 3' /
   V60081    'ARREST DATE - 1' /
   V60082    'ARREST DATE - 2' /
   V60083    'ARREST DATE - 3' /
   V60091    'TYPE OF ARREST - 1' /
   V60092    'TYPE OF ARREST - 2' /
   V60093    'TYPE OF ARREST - 3' /
   V60101    'MULTIPLE ARRESTEE SEGMENTS INDICATOR - 1' /
   V60102    'MULTIPLE ARRESTEE SEGMENTS INDICATOR - 2' /
   V60103    'MULTIPLE ARRESTEE SEGMENTS INDICATOR - 3' /
   V60111    'UCR ARREST OFFENSE CODE - 1' /
   V60112    'UCR ARREST OFFENSE CODE - 2' /
   V60113    'UCR ARREST OFFENSE CODE - 3' /
   V60121    'ARRESTEE ARMED WITH 1 - 1' /
   V60122    'ARRESTEE ARMED WITH 1 - 2' /
   V60123    'ARRESTEE ARMED WITH 1 - 3' /
   V60131    'ARRESTEE ARMED WITH 2 - 1' /
   V60132    'ARRESTEE ARMED WITH 2 - 2' /
   V60133    'ARRESTEE ARMED WITH 2 - 3' /
   V60141    'AGE OF ARRESTEE - 1' /
   V60142    'AGE OF ARRESTEE - 2' /
   V60143    'AGE OF ARRESTEE - 3' /
   V60151    'SEX OF ARRESTEE - 1' /
   V60152    'SEX OF ARRESTEE - 2' /
   V60153    'SEX OF ARRESTEE - 3' /
   V60161    'RACE OF ARRESTEE - 1' /
   V60162    'RACE OF ARRESTEE - 2' /
   V60163    'RACE OF ARRESTEE - 3' /
   V60171    'ETHNICITY OF ARRESTEE - 1' /
   V60172    'ETHNICITY OF ARRESTEE - 2' /
   V60173    'ETHNICITY OF ARRESTEE - 3' /
   V60181    'RESIDENT STATUS OF ARRESTEE - 1' /
   V60182    'RESIDENT STATUS OF ARRESTEE - 2' /
   V60183    'RESIDENT STATUS OF ARRESTEE - 3' /
   V60191    'DISPOSITION OF ARRESTEE UNDER 18 - 1' /
   V60192    'DISPOSITION OF ARRESTEE UNDER 18 - 2' /
   V60193    'DISPOSITION OF ARRESTEE UNDER 18 - 3' /
   ALLOFNS   'ALL OFFENSE CODES FOR THE INCIDENT' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   SEGMENT   '01' 'Admin segment' '04' 'Victim segment'
             '05' 'Offender segment' '06' 'Arrestee segment'
             '07' 'Group B arrest segment'
             'W1' 'Window exceptional clearance segment'
             'W6' 'Window arrest segment' /
   STATE     1 'AL' 2 'AZ' 3 'AR' 4 'CA' 5 'CO' 6 'CT' 7 'DE' 8 'DC' 9 'FL'
             10 'GA' 11 'ID' 12 'IL' 13 'IN' 14 'IA' 15 'KS' 16 'KY' 17 'LA'
             18 'ME' 19 'MD' 20 'MA' 21 'MI' 22 'MN' 23 'MS' 24 'MO' 25 'MT'
             26 'NB' 27 'NV' 28 'NH' 29 'NJ' 30 'NM' 31 'NY' 32 'NC' 33 'ND'
             34 'OH' 35 'OK' 36 'OR' 37 'PA' 38 'RI' 39 'SC' 40 'SD' 41 'TN'
             42 'TX' 43 'UT' 44 'VT' 45 'VA' 46 'WA' 47 'WV' 48 'WI' 49 'WY'
             50 'AK' 51 'HI' 52 'CZ' 53 'PR' 54 'AS' 55 'GM' 62 'VI' /
   INCDATE   -5 'NA Window/Grp B Record' /
   RECSADM   -5 'NA Window/Grp B Record' /
   RECSOFS   -5 'NA Window/Grp B Record' /
   RECSPRP   -5 'NA Window/Grp B Record' /
   RECSVIC   -5 'NA Window/Grp B Record' /
   RECSOFR   -5 'NA Window/Grp B Record' /
   RECSARR   -5 'NA Window/Grp B Record' /
   B1006     -6 'Not applicable' /
   B1009     0 'Possessions' 10 'Cities 250,000+' 11 'Cities 1,000,000+'
             12 'Cities 500,000-999,999' 13 'Cities 250,000-499,999'
             20 'Cities 100,000-249,999' 30 'Cities 50,000-99,999'
             40 'Cities 25,000-49,999' 50 'Cities 10,000-24,999'
             60 'Cities 2,500-9,999' 70 'Cities < 2,500'
             80 'Non-MSA Counties' 81 'Non-MSA Counties 100,000+'
             82 'Non-MSA Counties 25,000-99,999'
             83 'Non-MSA Counties 10,000-24,999'
             84 'Non-MSA Counties < 10,000' 85 'Non-MSA State Police'
             90 'MSA Counties' 91 'MSA Counties 100,000+'
             92 'MSA Counties 25,000-99,999' 93 'MSA Counties 10,000-24,999'
             94 'MSA Counties < 10,000' 95 'MSA State Police' /
   B1010     0 'Possessions' 1 'New England' 2 'Middle Atlantic'
             3 'East North Central' 4 'West North Central' 5 'South Atlantic'
             6 'East South Central' 7 'West South Central' 8 'Mountain'
             9 'Pacific' /
   B1011     1 'North East' 2 'North Central' 3 'South' 4 'West' /
   B1012     0 'Covered by another agency' 1 'City' 2 'County'
             3 'University or college' 4 'State Police' 5 'Special Agency'
             6 'Other state agencies' 7 'Tribal agencies'
             8 'Federal agencies' /
   B1013     0 'No' 1 'Yes' /
   B1014     '-6' 'Not applicable' /
   B1015     9999 'Blanked' /
   B1016     '-6' 'Not applicable' /
   B1017     0 'Does not yet participate' 1 'Active' /
   B1018     -6 'Not applicable' /
   B2006     -6 'Not applicable' /
   B2007     -6 'Not applicable' /
   B2010     -6 'Not applicable' /
   B2011     -6 'Not applicable' /
   B2014     -6 'Not applicable' /
   B2015     -6 'Not applicable' /
   B2018     -6 'Not applicable' /
   B2019     -6 'Not applicable' /
   B3006     -6 'Not applicable' /
   B3007     -6 'Not applicable' /
   B3009     -6 'Not applicable' /
   B3012     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3013     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3014     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3015     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3016     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3017     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3018     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3019     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3020     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3021     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3022     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3023     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   B3024     -9 'Undetermined' 900 'UCR' /
   B3025     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   B3026     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   B3027     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   B3028     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   V1006     -5 'NA Window/Grp B Record' 0 'Incident date' 1 'Report date' /
   V1007     -7 'Unknown/Missing/DNR' -5 'NA Window/Grp B Record' /
   V1008     -5 'NA Window/Grp B Record' /
   V1009     -5 'NA Window/Grp B Record' /
   V1010     -5 'NA Window/Grp B Record' /
   V1011     -5 'NA Window/Grp B Record' /
   V1012     '-6' 'Not applicable' '-5' 'NA Window/Grp B Record' /
   V1013     -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Death of offender' 2 'Prosecution declined'
             3 'Extradition denied' 4 'Victim refused coop'
             5 'Juvenile/no custody' /
   V1014     -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V1016     -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'No' 2 'Yes' /
   V4007     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4008     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4009     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4010     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4011     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4012     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4013     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4014     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4015     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4016     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V4017     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'Individual' 2 'Business' 3 'Financial Institution'
             4 'Government' 5 'Law Enforcement Officer'
             6 'Religious Organization' 7 'Society/Public' 8 'Other' /
   V4017A    -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'Respond disturbance' 2 'Burglary in process'
             3 'Robbery in process' 4 'Attempt oth arrest' 5 'Civil disorder'
             6 'Custody prisoners' 7 'Investigating' 8 'Ambush-no warning'
             9 'Deranged assailant' 10 'Traffic pursuits' 11 'All other' /
   V4017B    -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'Two-officer vehicle' 2 '1 officer veh (alone)'
             3 '1 officer veh (assist)' 4 'Spec assign (alone)'
             5 'Spec assign (assist)' 6 'Other (alone)' 7 'Other (assisted)'
             /
   V4018     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0.1 'Under 24 hours (neonate)' 0.2 '1-6 days old'
             0.5 '7-364 days old' 99 'Over 98 years old' /
   V4019     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'Female' 1 'Male' /
   V4020     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'White' 2 'Black' 3 'American Indian/Alaskan Native'
             4 'Asian/Pacific Islander' /
   V4021     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V4022     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'Nonresident' 1 'Resident' /
   V4023     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'Argument' 2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing'
             4 'Gangland' 5 'Juvenile Gang' 6 'Lovers Quarrel'
             7 'Mercy Killing' 8 'Other Felony Involved'
             9 'Other Circumstances' 20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V4024     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'Argument' 2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing'
             4 'Gangland' 5 'Juvenile Gang' 6 'Lovers Quarrel'
             7 'Mercy Killing' 8 'Other Felony Involved'
             9 'Other Circumstances' 20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V4025     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'Crim attacked police officer, that officer killed crim'
             2 'Crim attacked fellow pol ofcr, crim killed by oth pol of'
             3 'Crim attacked a civilian'
             4 'Crim attempted flight from a crime'
             5 'Crim killed in commission of a crime'
             6 'Crim resisted arrest' /
   V4026     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'None' 2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V4027     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'None' 2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V4028     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'None' 2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V4029     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'None' 2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V4030     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             1 'None' 2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V4031     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4032     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4033     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4034     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4035     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4036     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4037     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4038     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4039     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4040     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4041     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4042     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4043     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4044     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4045     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4046     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4047     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4048     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V4049     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' /
   V4050     -9 'Undetermined' -7 'Unknown/Missing/DNR' -6 'Not applicable'
             0 'N offenders unknown' 1 'Victim was Spouse'
             2 'Victim was Common-Law Spouse' 3 'Victim was Parent'
             4 'Victim was Sibling' 5 'Victim was Child'
             6 'Victim was Grandparent' 7 'Victim was Grandchild'
             8 'Victim was In-Law' 9 'Victim was Stepparent'
             10 'Victim was Stepchild' 11 'Victim was Stepsibling'
             12 'Victim was Other Family Member' 13 'Victim was Offender'
             14 'Victim was Acquaintance' 15 'Victim was Friend'
             16 'Victim was Neighbor' 17 'Victim was Babysittee (the baby)'
             18 'Victim was Boyfriend/Girlfriend'
             19 'Victim was Child of Boyfriend/Girlfriend'
             20 'Homosexual Relationship' 21 'Victim was Ex-Spouse'
             22 'Victim was Employee' 23 'Victim was Employer'
             24 'Victim was Otherwise Known' 25 'Victim was Stranger' /
   V20061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V20062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V20063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' /
   V20071    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Attempted'
             1 'Completed' /
   V20072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Attempted'
             1 'Completed' /
   V20073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Attempted'
             1 'Completed' /
   V20081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20101    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20102    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20103    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20111    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Air/Bus/Train Terminal' 2 'Bank/Savings and Loan'
             3 'Bar/Nightclub' 4 'Church/Synagogue/Temple'
             5 'Commercial/Office Building' 6 'Construction Site'
             7 'Convenience Store' 8 'Department/Discount Store'
             9 'Drug Store/Drs Office/Hospital' 10 'Field/Woods'
             11 'Government/Public Building' 12 'Grocery/Supermarket'
             13 'Highway/Road/Alley' 14 'Hotel/Motel/Etc.' 15 'Jail/Prison'
             16 'Lake/Waterway' 17 'Liquor Store' 18 'Parking Lot/Garage'
             19 'Rental Stor. Facil.' 20 'Residence/Home' 21 'Restaurant'
             22 'School/College' 23 'Service/Gas Station'
             24 'Specialty Store (TV, Fur, Etc.)' 25 'Other/unknown'
             37 'Abandoned/condemned structure' 38 'Amusement park'
             39 'Arena/stadium/fairgrounds/coliseum'
             40 'ATM separate from bank' 41 'Auto dealership new/used'
             42 'Camp/campground' 44 'Daycare facility'
             45 'Dock/wharf/freight/modal terminal' 46 'Farm facility'
             47 'Gambling facility/casino/race track' 48 'Industrial site'
             49 'Military installation' 50 'Park/playground' 51 'Rest area'
             52 'School--college/university'
             53 'School--elementary/secondary' 54 'Shelter--mission/homeless'
             55 'Shopping mall' 56 'Tribal lands' /
   V20112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Air/Bus/Train Terminal' 2 'Bank/Savings and Loan'
             3 'Bar/Nightclub' 4 'Church/Synagogue/Temple'
             5 'Commercial/Office Building' 6 'Construction Site'
             7 'Convenience Store' 8 'Department/Discount Store'
             9 'Drug Store/Drs Office/Hospital' 10 'Field/Woods'
             11 'Government/Public Building' 12 'Grocery/Supermarket'
             13 'Highway/Road/Alley' 14 'Hotel/Motel/Etc.' 15 'Jail/Prison'
             16 'Lake/Waterway' 17 'Liquor Store' 18 'Parking Lot/Garage'
             19 'Rental Stor. Facil.' 20 'Residence/Home' 21 'Restaurant'
             22 'School/College' 23 'Service/Gas Station'
             24 'Specialty Store (TV, Fur, Etc.)' 25 'Other/unknown'
             37 'Abandoned/condemned structure' 38 'Amusement park'
             39 'Arena/stadium/fairgrounds/coliseum'
             40 'ATM separate from bank' 41 'Auto dealership new/used'
             42 'Camp/campground' 44 'Daycare facility'
             45 'Dock/wharf/freight/modal terminal' 46 'Farm facility'
             47 'Gambling facility/casino/race track' 48 'Industrial site'
             49 'Military installation' 50 'Park/playground' 51 'Rest area'
             52 'School--college/university'
             53 'School--elementary/secondary' 54 'Shelter--mission/homeless'
             55 'Shopping mall' 56 'Tribal lands' /
   V20113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Air/Bus/Train Terminal' 2 'Bank/Savings and Loan'
             3 'Bar/Nightclub' 4 'Church/Synagogue/Temple'
             5 'Commercial/Office Building' 6 'Construction Site'
             7 'Convenience Store' 8 'Department/Discount Store'
             9 'Drug Store/Drs Office/Hospital' 10 'Field/Woods'
             11 'Government/Public Building' 12 'Grocery/Supermarket'
             13 'Highway/Road/Alley' 14 'Hotel/Motel/Etc.' 15 'Jail/Prison'
             16 'Lake/Waterway' 17 'Liquor Store' 18 'Parking Lot/Garage'
             19 'Rental Stor. Facil.' 20 'Residence/Home' 21 'Restaurant'
             22 'School/College' 23 'Service/Gas Station'
             24 'Specialty Store (TV, Fur, Etc.)' 25 'Other/unknown'
             37 'Abandoned/condemned structure' 38 'Amusement park'
             39 'Arena/stadium/fairgrounds/coliseum'
             40 'ATM separate from bank' 41 'Auto dealership new/used'
             42 'Camp/campground' 44 'Daycare facility'
             45 'Dock/wharf/freight/modal terminal' 46 'Farm facility'
             47 'Gambling facility/casino/race track' 48 'Industrial site'
             49 'Military installation' 50 'Park/playground' 51 'Rest area'
             52 'School--college/university'
             53 'School--elementary/secondary' 54 'Shelter--mission/homeless'
             55 'Shopping mall' 56 'Tribal lands' /
   V20121    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V20122    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V20123    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V20131    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'No force'
             1 'Force' /
   V20132    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'No force'
             1 'Force' /
   V20133    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'No force'
             1 'Force' /
   V20141    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20142    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20143    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20151    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20152    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20153    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20161    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Buying/Receiving' 2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20172    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20173    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20181    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20182    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20183    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20191    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20192    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20193    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             110 'Firearm (type not stated)' 111 'Firearm-automatic'
             120 'Handgun' 121 'Handgun-automatic' 130 'Rifle'
             131 'Rifle-automatic' 140 'Shotgun' 141 'Shotgun-automatic'
             150 'Other Firearm' 151 'Other Firearm-automatic'
             200 'Knife/Cutting Instrument' 300 'Blunt Object'
             350 'Motor Vehicle'
             400 'Personal Weapons (hands, feet, teeth, etc.)'
             500 'Poison (include gas)' 600 'Explosives'
             650 'Fire/Incendiary Device'
             700 'Drugs/Narcotics/Sleeping Pills' 850 'Asphyxiation'
             900 'Other' 990 'None' /
   V20201    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'White'
             12 'Black' 13 'American Indian or Alaskan Native'
             14 'Asian/Pacific Islander' 15 'Multi-Racial Group' 21 'Jewish'
             22 'Catholic' 23 'Protestant' 24 'Islamic (Moslem)'
             25 'Other Religion' 26 'Multi-Religious Group'
             27 'Atheism/Agnosticism' 31 'Arab' 32 'Hispanic'
             33 'Other Ethnicity/Natl. Origin' 41 'Male Homosexual (Gay)'
             42 'Female Homosexual (Lesbian)'
             43 'Homosexual (Gay and Lesbian)' 44 'Heterosexual'
             45 'Bisexual' 51 'Physical Disability' 52 'Mental Disability'
             88 'None' 99 'Unknown' /
   V20202    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'White'
             12 'Black' 13 'American Indian or Alaskan Native'
             14 'Asian/Pacific Islander' 15 'Multi-Racial Group' 21 'Jewish'
             22 'Catholic' 23 'Protestant' 24 'Islamic (Moslem)'
             25 'Other Religion' 26 'Multi-Religious Group'
             27 'Atheism/Agnosticism' 31 'Arab' 32 'Hispanic'
             33 'Other Ethnicity/Natl. Origin' 41 'Male Homosexual (Gay)'
             42 'Female Homosexual (Lesbian)'
             43 'Homosexual (Gay and Lesbian)' 44 'Heterosexual'
             45 'Bisexual' 51 'Physical Disability' 52 'Mental Disability'
             88 'None' 99 'Unknown' /
   V20203    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'White'
             12 'Black' 13 'American Indian or Alaskan Native'
             14 'Asian/Pacific Islander' 15 'Multi-Racial Group' 21 'Jewish'
             22 'Catholic' 23 'Protestant' 24 'Islamic (Moslem)'
             25 'Other Religion' 26 'Multi-Religious Group'
             27 'Atheism/Agnosticism' 31 'Arab' 32 'Hispanic'
             33 'Other Ethnicity/Natl. Origin' 41 'Male Homosexual (Gay)'
             42 'Female Homosexual (Lesbian)'
             43 'Homosexual (Gay and Lesbian)' 44 'Heterosexual'
             45 'Bisexual' 51 'Physical Disability' 52 'Mental Disability'
             88 'None' 99 'Unknown' /
   V30061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Burned' 3 'Counterfeited/Forged'
             4 'Destroyed/Damaged/Vandalized' 5 'Recovered' 6 'Seized'
             7 'Stolen/Etc.' /
   V30062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Burned' 3 'Counterfeited/Forged'
             4 'Destroyed/Damaged/Vandalized' 5 'Recovered' 6 'Seized'
             7 'Stolen/Etc.' /
   V30063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Burned' 3 'Counterfeited/Forged'
             4 'Destroyed/Damaged/Vandalized' 5 'Recovered' 6 'Seized'
             7 'Stolen/Etc.' /
   V30071    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Aircraft'
             2 'Alcohol' 3 'Automobiles' 4 'Bicycles' 5 'Buses'
             6 'Clothes/Furs' 7 'Computer Hardware/software'
             8 'Consumable Goods' 9 'Credit/Debit Cards' 10 'Drugs/Narcotics'
             11 'Drug/Narcotic Equip.' 12 'Farm Equipment' 13 'Firearms'
             14 'Gambling Equipment'
             15 'Heavy Construction/Industrial Equipment'
             16 'Household Goods' 17 'Jewelry/Precious Metals' 18 'Livestock'
             19 'Merchandise' 20 'Money' 21 'Negotiable Instruments'
             22 'Nonnegotiable Instruments' 23 'Office-Type Equipment'
             24 'Other Motor Vehicles' 25 'Purses/Handbags/Wallets'
             26 'Radios/TVs/VCRs' 27 'Recordings-Audio/Visual'
             28 'Recreational Vehicles'
             29 'Structures-Single Occupancy Dwellings'
             30 'Structures-Other Dwellings'
             31 'Structures - Commercial/Business'
             32 'Structures - Industrial/Manufacturing'
             33 'Structures Public/Community' 34 'Structures-Storage'
             35 'Structures-Other' 36 'Tools-Power/Hand' 37 'Trucks'
             38 'Vehicle Parts/Accessories' 39 'Watercraft'
             41 'Aircraft parts/accessories'
             42 'Artistic supplies/accessories' 43 'Building materials'
             44 'Camping/hunting/fishing equipment/supplies' 45 'Chemicals'
             46 'Collections/collectibles' 47 'Crops'
             48 'Decuments/personal or business' 49 'Explosives'
             59 'Firearm accessories' 64 'Fuel' 65 'Identity documents'
             66 'Identity--intangible' 67 'Law enforcement equipment'
             68 'Lawn/yard/garden equipment' 69 'Logging equipment'
             70 'Medical/medical lab equipment' 71 'Metals, non-precious'
             72 'Musical instruments' 73 'Pets'
             74 'Photographic/optical equipment'
             75 'Portable electronic communications'
             76 'Recreational/sports equipment' 77 'Other' 78 'Trailers'
             79 'Watercraft equipment/parts/accessories' 80 'Weapons--other'
             88 'Pending inventory (of property)' 99 'Special category' /
   V30072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Aircraft'
             2 'Alcohol' 3 'Automobiles' 4 'Bicycles' 5 'Buses'
             6 'Clothes/Furs' 7 'Computer Hardware/software'
             8 'Consumable Goods' 9 'Credit/Debit Cards' 10 'Drugs/Narcotics'
             11 'Drug/Narcotic Equip.' 12 'Farm Equipment' 13 'Firearms'
             14 'Gambling Equipment'
             15 'Heavy Construction/Industrial Equipment'
             16 'Household Goods' 17 'Jewelry/Precious Metals' 18 'Livestock'
             19 'Merchandise' 20 'Money' 21 'Negotiable Instruments'
             22 'Nonnegotiable Instruments' 23 'Office-Type Equipment'
             24 'Other Motor Vehicles' 25 'Purses/Handbags/Wallets'
             26 'Radios/TVs/VCRs' 27 'Recordings-Audio/Visual'
             28 'Recreational Vehicles'
             29 'Structures-Single Occupancy Dwellings'
             30 'Structures-Other Dwellings'
             31 'Structures - Commercial/Business'
             32 'Structures - Industrial/Manufacturing'
             33 'Structures Public/Community' 34 'Structures-Storage'
             35 'Structures-Other' 36 'Tools-Power/Hand' 37 'Trucks'
             38 'Vehicle Parts/Accessories' 39 'Watercraft'
             41 'Aircraft parts/accessories'
             42 'Artistic supplies/accessories' 43 'Building materials'
             44 'Camping/hunting/fishing equipment/supplies' 45 'Chemicals'
             46 'Collections/collectibles' 47 'Crops'
             48 'Decuments/personal or business' 49 'Explosives'
             59 'Firearm accessories' 64 'Fuel' 65 'Identity documents'
             66 'Identity--intangible' 67 'Law enforcement equipment'
             68 'Lawn/yard/garden equipment' 69 'Logging equipment'
             70 'Medical/medical lab equipment' 71 'Metals, non-precious'
             72 'Musical instruments' 73 'Pets'
             74 'Photographic/optical equipment'
             75 'Portable electronic communications'
             76 'Recreational/sports equipment' 77 'Other' 78 'Trailers'
             79 'Watercraft equipment/parts/accessories' 80 'Weapons--other'
             88 'Pending inventory (of property)' 99 'Special category' /
   V30073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Aircraft'
             2 'Alcohol' 3 'Automobiles' 4 'Bicycles' 5 'Buses'
             6 'Clothes/Furs' 7 'Computer Hardware/software'
             8 'Consumable Goods' 9 'Credit/Debit Cards' 10 'Drugs/Narcotics'
             11 'Drug/Narcotic Equip.' 12 'Farm Equipment' 13 'Firearms'
             14 'Gambling Equipment'
             15 'Heavy Construction/Industrial Equipment'
             16 'Household Goods' 17 'Jewelry/Precious Metals' 18 'Livestock'
             19 'Merchandise' 20 'Money' 21 'Negotiable Instruments'
             22 'Nonnegotiable Instruments' 23 'Office-Type Equipment'
             24 'Other Motor Vehicles' 25 'Purses/Handbags/Wallets'
             26 'Radios/TVs/VCRs' 27 'Recordings-Audio/Visual'
             28 'Recreational Vehicles'
             29 'Structures-Single Occupancy Dwellings'
             30 'Structures-Other Dwellings'
             31 'Structures - Commercial/Business'
             32 'Structures - Industrial/Manufacturing'
             33 'Structures Public/Community' 34 'Structures-Storage'
             35 'Structures-Other' 36 'Tools-Power/Hand' 37 'Trucks'
             38 'Vehicle Parts/Accessories' 39 'Watercraft'
             41 'Aircraft parts/accessories'
             42 'Artistic supplies/accessories' 43 'Building materials'
             44 'Camping/hunting/fishing equipment/supplies' 45 'Chemicals'
             46 'Collections/collectibles' 47 'Crops'
             48 'Decuments/personal or business' 49 'Explosives'
             59 'Firearm accessories' 64 'Fuel' 65 'Identity documents'
             66 'Identity--intangible' 67 'Law enforcement equipment'
             68 'Lawn/yard/garden equipment' 69 'Logging equipment'
             70 'Medical/medical lab equipment' 71 'Metals, non-precious'
             72 'Musical instruments' 73 'Pets'
             74 'Photographic/optical equipment'
             75 'Portable electronic communications'
             76 'Recreational/sports equipment' 77 'Other' 78 'Trailers'
             79 'Watercraft equipment/parts/accessories' 80 'Weapons--other'
             88 'Pending inventory (of property)' 99 'Special category' /
   V30081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30101    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30102    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30103    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30111    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30121    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30122    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30123    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30131    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30132    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30133    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30141    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30142    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30143    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30151    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30152    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30153    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30161    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30172    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30173    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30181    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30182    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30183    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30191    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30192    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30193    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30201    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30202    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30203    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crack Cocaine' 2 'Cocaine (all forms except Crack)'
             3 'Hashish' 4 'Heroin' 5 'Marijuana' 6 'Morphine' 7 'Opium'
             8 'Other Narcotics' 9 'LSD' 10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30211    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30212    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30213    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30221    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30222    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30223    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V30231    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30232    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V30233    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Gram'
             2 'Kilogram' 3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter'
             7 'Fluid Ounce' 8 'Gallon' 9 'Dosage Unit/Items'
             10 'Number of Plants' /
   V50061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Unknown N offenders' /
   V50062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Unknown N offenders' /
   V50063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Unknown N offenders' /
   V50071    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 99 'Over 98 yrs'
             /
   V50072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 99 'Over 98 yrs'
             /
   V50073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 99 'Over 98 yrs'
             /
   V50081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V50082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V50083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V50091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black' 3 'American Indian/Alaskan Native'
             4 'Asian/Pacific Islander' /
   V50092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black' 3 'American Indian/Alaskan Native'
             4 'Asian/Pacific Islander' /
   V50093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black' 3 'American Indian/Alaskan Native'
             4 'Asian/Pacific Islander' /
   V60061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V60062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V60063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V60081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V60082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V60083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V60091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'On-View Arrest' 2 'Summoned/Cited' 3 'Taken Into Custody' /
   V60092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'On-View Arrest' 2 'Summoned/Cited' 3 'Taken Into Custody' /
   V60093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'On-View Arrest' 2 'Summoned/Cited' 3 'Taken Into Custody' /
   V60101    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Count Arrestee' 2 'Multiple' /
   V60102    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Count Arrestee' 2 'Multiple' /
   V60103    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Count Arrestee' 2 'Multiple' /
   V60111    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' 901 'Bad Checks'
             902 'Curfew/Loitering/Vagrancy Violations'
             903 'Disorderly Conduct' 904 'Driving Under the Influence'
             905 'Drunkenness' 906 'Family Offenses, Nonviolent'
             907 'Liquor Law Violations' 908 'Peeping Tom' 909 'Runaway'
             910 'Trespass of Real Property' 990 'All Other Offenses' /
   V60112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' 901 'Bad Checks'
             902 'Curfew/Loitering/Vagrancy Violations'
             903 'Disorderly Conduct' 904 'Driving Under the Influence'
             905 'Drunkenness' 906 'Family Offenses, Nonviolent'
             907 'Liquor Law Violations' 908 'Peeping Tom' 909 'Runaway'
             910 'Trespass of Real Property' 990 'All Other Offenses' /
   V60113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Forcible Rape'
             112 'Forcible Sodomy' 113 'Sexual Assault With An Object'
             114 'Forcible Fondling' 120 'Robbery' 131 'Aggravated Assault'
             132 'Simple Assault' 133 'Intimidation' 200 'Arson'
             210 'Extortion/Blackmail' 220 'Burglary/Breaking and Entering'
             231 'Pocket-picking' 232 'Purse-snatching' 233 'Shoplifting'
             234 'Theft From Building'
             235 'Theft From Coin-Operated Machine or Device'
             236 'Theft From Motor Vehicle'
             237 'Theft of Motor Vehicle Parts/Accessories'
             238 'All Other Larceny' 240 'Motor Vehicle Theft'
             250 'Counterfeiting/Forgery'
             261 'False Pretenses/Swindle/Confidence Game'
             262 'Credit Card/Automatic Teller Machine Fraud'
             263 'Impersonation' 264 'Welfare Fraud' 265 'Wire Fraud'
             270 'Embezzlement' 280 'Stolen Property Offenses'
             290 'Destruction/Damage/Vandalism of Property'
             351 'Drug/Narcotic Violations' 352 'Drug Equipment Violations'
             361 'Incest' 362 'Statutory Rape'
             370 'Pornography/Obscene Material' 391 'Betting/Wagering'
             392 'Operating/Promoting/Assisting Gambling'
             393 'Gambling Equipment Violations' 394 'Sports Tampering'
             401 'Prostitution' 402 'Assisting or Promoting Prostitution'
             510 'Bribery' 520 'Weapon Law Violations' 901 'Bad Checks'
             902 'Curfew/Loitering/Vagrancy Violations'
             903 'Disorderly Conduct' 904 'Driving Under the Influence'
             905 'Drunkenness' 906 'Family Offenses, Nonviolent'
             907 'Liquor Law Violations' 908 'Peeping Tom' 909 'Runaway'
             910 'Trespass of Real Property' 990 'All Other Offenses' /
   V60121    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Unarmed'
             110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V60122    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Unarmed'
             110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V60123    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Unarmed'
             110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V60131    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Unarmed'
             110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V60132    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Unarmed'
             110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V60133    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Unarmed'
             110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V60141    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             99 'Over 98 years old' /
   V60142    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             99 'Over 98 years old' /
   V60143    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             99 'Over 98 years old' /
   V60151    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V60152    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V60153    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V60161    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black' 3 'American Indian/Alaskan Native'
             4 'Asian/Pacific Islander' /
   V60162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black' 3 'American Indian/Alaskan Native'
             4 'Asian/Pacific Islander' /
   V60163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black' 3 'American Indian/Alaskan Native'
             4 'Asian/Pacific Islander' /
   V60171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V60172    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V60173    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V60181    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Nonresident'
             1 'Resident' /
   V60182    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Nonresident'
             1 'Resident' /
   V60183    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Nonresident'
             1 'Resident' /
   V60191    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Referred'
             1 'Handled' /
   V60192    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Referred'
             1 'Handled' /
   V60193    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Referred'
             1 'Handled' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     INCDATE (-5) /
     RECSADM (-5) /
     RECSOFS (-5) /
     RECSPRP (-5) /
     RECSVIC (-5) /
     RECSOFR (-5) /
     RECSARR (-5) /
     B1006 (-6) /
     B1016 ('-6') /
     B1018 (-6) /
     B2006 (-6) /
     B2007 (-6) /
     B2010 (-6) /
     B2011 (-6) /
     B2014 (-6) /
     B2015 (-6) /
     B2018 (-6) /
     B2019 (-6) /
     B3006 (-6) /
     B3007 (-6) /
     B3009 (-6) /
     B3024 (-9) /
     B3025 (-9, -6) /
     B3026 (-9, -6) /
     B3027 (-9, -6) /
     B3028 (-9, -6) /
     V1006 (-5) /
     V1007 (-5, -7) /
     V1008 (-5) /
     V1009 (-5) /
     V1010 (-5) /
     V1011 (-5) /
     V1012 ('-5','-6') /
     V1013 (-5, -6) /
     V1014 (-5, -6) /
     V1016 (-5, -6) /
     V4006 (-9, -7, -6) /
     V4007 (-9, -7, -6) /
     V4008 (-9, -7, -6) /
     V4009 (-9, -7, -6) /
     V4010 (-9, -7, -6) /
     V4011 (-9, -7, -6) /
     V4012 (-9, -7, -6) /
     V4013 (-9, -7, -6) /
     V4014 (-9, -7, -6) /
     V4015 (-9, -7, -6) /
     V4016 (-9, -7, -6) /
     V4017 (-9, -7, -6) /
     V4017A (-9, -7, -6) /
     V4017B (-9, -7, -6) /
     V4018 (-9.0, -7.0, -6.0) /
     V4019 (-9, -7, -6) /
     V4020 (-9, -7, -6) /
     V4021 (-9, -7, -6) /
     V4022 (-9, -7, -6) /
     V4023 (-9, -7, -6) /
     V4024 (-9, -7, -6) /
     V4025 (-9, -7, -6) /
     V4026 (-9, -7, -6) /
     V4027 (-9, -7, -6) /
     V4028 (-9, -7, -6) /
     V4029 (-9, -7, -6) /
     V4030 (-9, -7, -6) /
     V4031 (-9, -7, -6) /
     V4032 (-9, -7, -6) /
     V4033 (-9, -7, -6) /
     V4034 (-9, -7, -6) /
     V4035 (-9, -7, -6) /
     V4036 (-9, -7, -6) /
     V4037 (-9, -7, -6) /
     V4038 (-9, -7, -6) /
     V4039 (-9, -7, -6) /
     V4040 (-9, -7, -6) /
     V4041 (-9, -7, -6) /
     V4042 (-9, -7, -6) /
     V4043 (-9, -7, -6) /
     V4044 (-9, -7, -6) /
     V4045 (-9, -7, -6) /
     V4046 (-9, -7, -6) /
     V4047 (-9, -7, -6) /
     V4048 (-9, -7, -6) /
     V4049 (-9, -7, -6) /
     V4050 (-9, -7, -6) /
     V20061 (low thru -5) /
     V20062 (low thru -5) /
     V20063 (low thru -5) /
     V20071 (low thru -5) /
     V20072 (low thru -5) /
     V20073 (low thru -5) /
     V20081 (low thru -5) /
     V20082 (low thru -5) /
     V20083 (low thru -5) /
     V20091 (low thru -5) /
     V20092 (low thru -5) /
     V20093 (low thru -5) /
     V20101 (low thru -5) /
     V20102 (low thru -5) /
     V20103 (low thru -5) /
     V20111 (low thru -5) /
     V20112 (low thru -5) /
     V20113 (low thru -5) /
     V20121 (low thru -5) /
     V20122 (low thru -5) /
     V20123 (low thru -5) /
     V20131 (low thru -5) /
     V20132 (low thru -5) /
     V20133 (low thru -5) /
     V20141 (low thru -5) /
     V20142 (low thru -5) /
     V20143 (low thru -5) /
     V20151 (low thru -5) /
     V20152 (low thru -5) /
     V20153 (low thru -5) /
     V20161 (low thru -5) /
     V20162 (low thru -5) /
     V20163 (low thru -5) /
     V20171 (low thru -5) /
     V20172 (low thru -5) /
     V20173 (low thru -5) /
     V20181 (low thru -5) /
     V20182 (low thru -5) /
     V20183 (low thru -5) /
     V20191 (low thru -5) /
     V20192 (low thru -5) /
     V20193 (low thru -5) /
     V20201 (low thru -5) /
     V20202 (low thru -5) /
     V20203 (low thru -5) /
     V30061 (low thru -5) /
     V30062 (low thru -5) /
     V30063 (low thru -5) /
     V30071 (low thru -5) /
     V30072 (low thru -5) /
     V30073 (low thru -5) /
     V30081 (low thru -5) /
     V30082 (low thru -5) /
     V30083 (low thru -5) /
     V30091 (low thru -5) /
     V30092 (low thru -5) /
     V30093 (low thru -5) /
     V30101 (low thru -5) /
     V30102 (low thru -5) /
     V30103 (low thru -5) /
     V30111 (low thru -5) /
     V30112 (low thru -5) /
     V30113 (low thru -5) /
     V30121 (low thru -5) /
     V30122 (low thru -5) /
     V30123 (low thru -5) /
     V30131 (low thru -5) /
     V30132 (low thru -5) /
     V30133 (low thru -5) /
     V30141 (low thru -5) /
     V30142 (low thru -5) /
     V30143 (low thru -5) /
     V30151 (low thru -5) /
     V30152 (low thru -5) /
     V30153 (low thru -5) /
     V30161 (low thru -5) /
     V30162 (low thru -5) /
     V30163 (low thru -5) /
     V30171 (low thru -5) /
     V30172 (low thru -5) /
     V30173 (low thru -5) /
     V30181 (low thru -5) /
     V30182 (low thru -5) /
     V30183 (low thru -5) /
     V30191 (low thru -5) /
     V30192 (low thru -5) /
     V30193 (low thru -5) /
     V30201 (low thru -5) /
     V30202 (low thru -5) /
     V30203 (low thru -5) /
     V30211 (low thru -5) /
     V30212 (low thru -5) /
     V30213 (low thru -5) /
     V30221 (low thru -5) /
     V30222 (low thru -5) /
     V30223 (low thru -5) /
     V30231 (low thru -5) /
     V30232 (low thru -5) /
     V30233 (low thru -5) /
     V50061 (low thru -5) /
     V50062 (low thru -5) /
     V50063 (low thru -5) /
     V50071 (low thru -5) /
     V50072 (low thru -5) /
     V50073 (low thru -5) /
     V50081 (low thru -5) /
     V50082 (low thru -5) /
     V50083 (low thru -5) /
     V50091 (low thru -5) /
     V50092 (low thru -5) /
     V50093 (low thru -5) /
     V60061 (low thru -5) /
     V60062 (low thru -5) /
     V60063 (low thru -5) /
     V60081 (low thru -5) /
     V60082 (low thru -5) /
     V60083 (low thru -5) /
     V60091 (low thru -5) /
     V60092 (low thru -5) /
     V60093 (low thru -5) /
     V60101 (low thru -5) /
     V60102 (low thru -5) /
     V60103 (low thru -5) /
     V60111 (low thru -5) /
     V60112 (low thru -5) /
     V60113 (low thru -5) /
     V60121 (low thru -5) /
     V60122 (low thru -5) /
     V60123 (low thru -5) /
     V60131 (low thru -5) /
     V60132 (low thru -5) /
     V60133 (low thru -5) /
     V60141 (low thru -5) /
     V60142 (low thru -5) /
     V60143 (low thru -5) /
     V60151 (low thru -5) /
     V60152 (low thru -5) /
     V60153 (low thru -5) /
     V60161 (low thru -5) /
     V60162 (low thru -5) /
     V60163 (low thru -5) /
     V60171 (low thru -5) /
     V60172 (low thru -5) /
     V60173 (low thru -5) /
     V60181 (low thru -5) /
     V60182 (low thru -5) /
     V60183 (low thru -5) /
     V60191 (low thru -5) /
     V60192 (low thru -5) /
     V60193 (low thru -5) /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   INCDATE
   RECSBH1
   RECSBH2
   RECSBH3
   RECSADM
   RECSOFS
   RECSPRP
   RECSVIC
   RECSOFR
   RECSARR
   B1005
   B1006
   B1015
   B1018
   B2005
   B2006
   B2007
   B2008
   B2009
   B2010
   B2011
   B2012
   B2013
   B2014
   B2015
   B2016
   B2017
   B2018
   B2019
   B2020
   B3005
   B3006
   B3007
   B3008
   B3009
   B3010
   B3011
   B3024
   B3025
   B3026
   B3027
   B3028
   V1007
   V1008
   V1009
   V1010
   V1011
   V1013
   V1014
   V1016
   V4006
   V4008
   V4009
   V4010
   V4011
   V4012
   V4013
   V4014
   V4015
   V4016
   V4017A
   V4017B
   V4018
   V4019
   V4020
   V4021
   V4022
   V4023
   V4024
   V4025
   V4026
   V4027
   V4028
   V4029
   V4030
   V4031
   V4032
   V4033
   V4034
   V4035
   V4036
   V4037
   V4038
   V4039
   V4040
   V4041
   V4042
   V4043
   V4044
   V4045
   V4046
   V4047
   V4048
   V4049
   V4050
   V20062
   V20063
   V20072
   V20073
   V20082
   V20083
   V20091
   V20092
   V20093
   V20101
   V20102
   V20103
   V20112
   V20113
   V20121
   V20122
   V20123
   V20131
   V20132
   V20133
   V20142
   V20143
   V20151
   V20152
   V20153
   V20161
   V20162
   V20163
   V20171
   V20172
   V20173
   V20181
   V20182
   V20183
   V20191
   V20192
   V20193
   V20202
   V20203
   V30062
   V30063
   V30072
   V30073
   V30081
   V30082
   V30083
   V30091
   V30092
   V30093
   V30101
   V30102
   V30103
   V30111
   V30112
   V30113
   V30122
   V30123
   V30131
   V30132
   V30133
   V30141
   V30142
   V30143
   V30152
   V30153
   V30161
   V30162
   V30163
   V30171
   V30172
   V30173
   V30181
   V30182
   V30183
   V30191
   V30192
   V30193
   V30201
   V30202
   V30203
   V30211
   V30212
   V30213
   V30221
   V30222
   V30223
   V30231
   V30232
   V30233
   V50061
   V50062
   V50063
   V50071
   V50072
   V50073
   V50082
   V50083
   V50092
   V50093
   V60061
   V60062
   V60063
   V60081
   V60082
   V60083
   V60092
   V60093
   V60101
   V60102
   V60103
   V60112
   V60113
   V60122
   V60123
   V60131
   V60132
   V60133
   V60141
   V60142
   V60143
   V60152
   V60153
   V60162
   V60163
   V60172
   V60173
   V60182
   V60183
   V60191
   V60192
   V60193
    (scale).

VARIABLE LEVEL
   SEGMENT
   STATE
   ORI
   INCNUM
   B1007
   B1008
   B1009
   B1010
   B1011
   B1012
   B1013
   B1014
   B1016
   B1017
   B3012
   B3013
   B3014
   B3015
   B3016
   B3017
   B3018
   B3019
   B3020
   B3021
   B3022
   B3023
   V1006
   V1012
   V4007
   V4017
   V4017C
   V20061
   V20071
   V20081
   V20111
   V20141
   V20201
   V30061
   V30071
   V30121
   V30151
   V50081
   V50091
   V60071
   V60072
   V60073
   V60091
   V60111
   V60121
   V60151
   V60161
   V60171
   V60181
   ALLOFNS
    (nominal).

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
