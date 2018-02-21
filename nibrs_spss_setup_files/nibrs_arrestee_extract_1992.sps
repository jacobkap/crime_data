*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 25862
*         NATIONAL INCIDENT-BASED REPORTING SYSTEM: EXTRACT FILES,
*                                   1992
*                      (DATASET 0004: ARRESTEE FILE)
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
*  data file is physically located (e.g., "c:\temp\22880-0004-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da22880-0004.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=1092.
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
           V6006 352-353       V6007 354-365 (A)           V6008 366-373
           V6009 374-375           V6010 376-377           V6011 378-380
           V6012 381-383           V6013 384-386           V6014 387-388
           V6015 389-390           V6016 391-392           V6017 393-394
           V6018 395-396           V6019 397-398          V20061 399-401
          V20062 402-404          V20063 405-407          V20071 408-409
          V20072 410-411          V20073 412-413          V20081 414-415
          V20082 416-417          V20083 418-419          V20091 420-421
          V20092 422-423          V20093 424-425          V20101 426-427
          V20102 428-429          V20103 430-431          V20111 432-433
          V20112 434-435          V20113 436-437          V20121 438-439
          V20122 440-441          V20123 442-443          V20131 444-445
          V20132 446-447          V20133 448-449          V20141 450-451
          V20142 452-453          V20143 454-455          V20151 456-457
          V20152 458-459          V20153 460-461          V20161 462-463
          V20162 464-465          V20163 466-467          V20171 468-470
          V20172 471-473          V20173 474-476          V20181 477-479
          V20182 480-482          V20183 483-485          V20191 486-488
          V20192 489-491          V20193 492-494          V20201 495-496
          V20202 497-498          V20203 499-500          V30061 501-502
          V30062 503-504          V30063 505-506          V30071 507-508
          V30072 509-510          V30073 511-512          V30081 513-521
          V30082 522-530          V30083 531-539          V30091 540-547
          V30092 548-555          V30093 556-563          V30101 564-565
          V30102 566-567          V30103 568-569          V30111 570-571
          V30112 572-573          V30113 574-575          V30121 576-577
          V30122 578-579          V30123 580-581          V30131 582-590
          V30132 591-599          V30133 600-608          V30141 609-611
          V30142 612-614          V30143 615-617          V30151 618-619
          V30152 620-621          V30153 622-623          V30161 624-625
          V30162 626-627          V30163 628-629          V30171 630-638
          V30172 639-647          V30173 648-656          V30181 657-659
          V30182 660-662          V30183 663-665          V30191 666-667
          V30192 668-669          V30193 670-671          V30201 672-673
          V30202 674-675          V30203 676-677          V30211 678-686
          V30212 687-695          V30213 696-704          V30221 705-707
          V30222 708-710          V30223 711-713          V30231 714-715
          V30232 716-717          V30233 718-719          V40061 720-722
          V40062 723-725          V40063 726-728          V40071 729-731
          V40072 732-734          V40073 735-737          V40081 738-740
          V40082 741-743          V40083 744-746          V40091 747-749
          V40092 750-752          V40093 753-755          V40101 756-758
          V40102 759-761          V40103 762-764          V40111 765-767
          V40112 768-770          V40113 771-773          V40121 774-776
          V40122 777-779          V40123 780-782          V40131 783-785
          V40132 786-788          V40133 789-791          V40141 792-794
          V40142 795-797          V40143 798-800          V40151 801-803
          V40152 804-806          V40153 807-809          V40161 810-812
          V40162 813-815          V40163 816-818          V40171 819-820
          V40172 821-822          V40173 823-824          V40181 825-828
          V40182 829-832          V40183 833-836          V40191 837-838
          V40192 839-840          V40193 841-842          V40201 843-844
          V40202 845-846          V40203 847-848          V40211 849-850
          V40212 851-852          V40213 853-854          V40221 855-856
          V40222 857-858          V40223 859-860          V40231 861-862
          V40232 863-864          V40233 865-866          V40241 867-868
          V40242 869-870          V40243 871-872          V40251 873-874
          V40252 875-876          V40253 877-878          V40261 879-880
          V40262 881-882          V40263 883-884          V40271 885-886
          V40272 887-888          V40273 889-890          V40281 891-892
          V40282 893-894          V40283 895-896          V40291 897-898
          V40292 899-900          V40293 901-902          V40301 903-904
          V40302 905-906          V40303 907-908          V40311 909-910
          V40312 911-912          V40313 913-914          V40321 915-916
          V40322 917-918          V40323 919-920          V40331 921-922
          V40332 923-924          V40333 925-926          V40341 927-928
          V40342 929-930          V40343 931-932          V40351 933-934
          V40352 935-936          V40353 937-938          V40361 939-940
          V40362 941-942          V40363 943-944          V40371 945-946
          V40372 947-948          V40373 949-950          V40381 951-952
          V40382 953-954          V40383 955-956          V40391 957-958
          V40392 959-960          V40393 961-962          V40401 963-964
          V40402 965-966          V40403 967-968          V40411 969-970
          V40412 971-972          V40413 973-974          V40421 975-976
          V40422 977-978          V40423 979-980          V40431 981-982
          V40432 983-984          V40433 985-986          V40441 987-988
          V40442 989-990          V40443 991-992          V40451 993-994
          V40452 995-996          V40453 997-998         V40461 999-1000
        V40462 1001-1002        V40463 1003-1004        V40471 1005-1006
        V40472 1007-1008        V40473 1009-1010        V40481 1011-1012
        V40482 1013-1014        V40483 1015-1016        V40491 1017-1018
        V40492 1019-1020        V40493 1021-1022        V40501 1023-1024
        V40502 1025-1026        V40503 1027-1028        V50061 1029-1030
        V50062 1031-1032        V50063 1033-1034        V50071 1035-1036
        V50072 1037-1038        V50073 1039-1040        V50081 1041-1042
        V50082 1043-1044        V50083 1045-1046        V50091 1047-1048
        V50092 1049-1050        V50093 1051-1052   ALLOFNS 1053-1092 (A)

   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   SEGMENT   'SEGMENT TYPE' /
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
   RECSARR   'N 06 RECORDS PER ORI-INCIDENT NUMBER' /
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
   V6006     'ARRESTEE SEQUENCE NUMBER' /
   V6007     'ARREST TRANSACTION NUMBER' /
   V6008     'ARREST DATE' /
   V6009     'TYPE OF ARREST' /
   V6010     'MULTIPLE ARRESTEE SEGMENTS INDICATOR' /
   V6011     'UCR ARREST OFFENSE CODE' /
   V6012     'ARRESTEE ARMED WITH 1' /
   V6013     'ARRESTEE ARMED WITH 2' /
   V6014     'AGE OF ARRESTEE' /
   V6015     'SEX OF ARRESTEE' /
   V6016     'RACE OF ARRESTEE' /
   V6017     'ETHNICITY OF ARRESTEE' /
   V6018     'RESIDENT STATUS OF ARRESTEE' /
   V6019     'DISPOSITION OF ARRESTEE UNDER 18' /
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
   V40061    'VICTIM SEQUENCE NUMBER - 1' /
   V40062    'VICTIM SEQUENCE NUMBER - 2' /
   V40063    'VICTIM SEQUENCE NUMBER - 3' /
   V40071    'UCR OFFENSE CODE 1 - 1' /
   V40072    'UCR OFFENSE CODE 1 - 2' /
   V40073    'UCR OFFENSE CODE 1 - 3' /
   V40081    'UCR OFFENSE CODE 2 - 1' /
   V40082    'UCR OFFENSE CODE 2 - 2' /
   V40083    'UCR OFFENSE CODE 2 - 3' /
   V40091    'UCR OFFENSE CODE 3 - 1' /
   V40092    'UCR OFFENSE CODE 3 - 2' /
   V40093    'UCR OFFENSE CODE 3 - 3' /
   V40101    'UCR OFFENSE CODE 4 - 1' /
   V40102    'UCR OFFENSE CODE 4 - 2' /
   V40103    'UCR OFFENSE CODE 4 - 3' /
   V40111    'UCR OFFENSE CODE 5 - 1' /
   V40112    'UCR OFFENSE CODE 5 - 2' /
   V40113    'UCR OFFENSE CODE 5 - 3' /
   V40121    'UCR OFFENSE CODE 6 - 1' /
   V40122    'UCR OFFENSE CODE 6 - 2' /
   V40123    'UCR OFFENSE CODE 6 - 3' /
   V40131    'UCR OFFENSE CODE 7 - 1' /
   V40132    'UCR OFFENSE CODE 7 - 2' /
   V40133    'UCR OFFENSE CODE 7 - 3' /
   V40141    'UCR OFFENSE CODE 8 - 1' /
   V40142    'UCR OFFENSE CODE 8 - 2' /
   V40143    'UCR OFFENSE CODE 8 - 3' /
   V40151    'UCR OFFENSE CODE 9 - 1' /
   V40152    'UCR OFFENSE CODE 9 - 2' /
   V40153    'UCR OFFENSE CODE 9 - 3' /
   V40161    'UCR OFFENSE CODE 10 - 1' /
   V40162    'UCR OFFENSE CODE 10 - 2' /
   V40163    'UCR OFFENSE CODE 10 - 3' /
   V40171    'TYPE OF VICTIM - 1' /
   V40172    'TYPE OF VICTIM - 2' /
   V40173    'TYPE OF VICTIM - 3' /
   V40181    'AGE OF VICTIM - 1' /
   V40182    'AGE OF VICTIM - 2' /
   V40183    'AGE OF VICTIM - 3' /
   V40191    'SEX OF VICTIM - 1' /
   V40192    'SEX OF VICTIM - 2' /
   V40193    'SEX OF VICTIM - 3' /
   V40201    'RACE OF VICTIM - 1' /
   V40202    'RACE OF VICTIM - 2' /
   V40203    'RACE OF VICTIM - 3' /
   V40211    'ETHNICITY OF VICTIM - 1' /
   V40212    'ETHNICITY OF VICTIM - 2' /
   V40213    'ETHNICITY OF VICTIM - 3' /
   V40221    'RESIDENT STATUS OF VICTIM - 1' /
   V40222    'RESIDENT STATUS OF VICTIM - 2' /
   V40223    'RESIDENT STATUS OF VICTIM - 3' /
   V40231    'AGG ASLT/HOMICIDE CIRCUMSTANCE 1 - 1' /
   V40232    'AGG ASLT/HOMICIDE CIRCUMSTANCE 1 - 2' /
   V40233    'AGG ASLT/HOMICIDE CIRCUMSTANCE 1 - 3' /
   V40241    'AGG ASLT/HOMICIDE CIRCUMSTANCE 2 - 1' /
   V40242    'AGG ASLT/HOMICIDE CIRCUMSTANCE 2 - 2' /
   V40243    'AGG ASLT/HOMICIDE CIRCUMSTANCE 2 - 3' /
   V40251    'ADDITIONAL JUSTIFIABLE HOMICIDE CIRCUMSTANCES - 1' /
   V40252    'ADDITIONAL JUSTIFIABLE HOMICIDE CIRCUMSTANCES - 2' /
   V40253    'ADDITIONAL JUSTIFIABLE HOMICIDE CIRCUMSTANCES - 3' /
   V40261    'INJURY 1 - 1' /
   V40262    'INJURY 1 - 2' /
   V40263    'INJURY 1 - 3' /
   V40271    'INJURY 2 - 1' /
   V40272    'INJURY 2 - 2' /
   V40273    'INJURY 2 - 3' /
   V40281    'INJURY 3 - 1' /
   V40282    'INJURY 3 - 2' /
   V40283    'INJURY 3 - 3' /
   V40291    'INJURY 4 - 1' /
   V40292    'INJURY 4 - 2' /
   V40293    'INJURY 4 - 3' /
   V40301    'INJURY 5 - 1' /
   V40302    'INJURY 5 - 2' /
   V40303    'INJURY 5 - 3' /
   V40311    'OFFENDER NUMBER 1 - 1' /
   V40312    'OFFENDER NUMBER 1 - 2' /
   V40313    'OFFENDER NUMBER 1 - 3' /
   V40321    'RELATIONSHIP VIC TO OFF 1 - 1' /
   V40322    'RELATIONSHIP VIC TO OFF 1 - 2' /
   V40323    'RELATIONSHIP VIC TO OFF 1 - 3' /
   V40331    'OFFENDER NUMBER 2 - 1' /
   V40332    'OFFENDER NUMBER 2 - 2' /
   V40333    'OFFENDER NUMBER 2 - 3' /
   V40341    'RELATIONSHIP VIC TO OFF 2 - 1' /
   V40342    'RELATIONSHIP VIC TO OFF 2 - 2' /
   V40343    'RELATIONSHIP VIC TO OFF 2 - 3' /
   V40351    'OFFENDER NUMBER 3 - 1' /
   V40352    'OFFENDER NUMBER 3 - 2' /
   V40353    'OFFENDER NUMBER 3 - 3' /
   V40361    'RELATIONSHIP VIC TO OFF 3 - 1' /
   V40362    'RELATIONSHIP VIC TO OFF 3 - 2' /
   V40363    'RELATIONSHIP VIC TO OFF 3 - 3' /
   V40371    'OFFENDER NUMBER 4 - 1' /
   V40372    'OFFENDER NUMBER 4 - 2' /
   V40373    'OFFENDER NUMBER 4 - 3' /
   V40381    'RELATIONSHIP VIC TO OFF 4 - 1' /
   V40382    'RELATIONSHIP VIC TO OFF 4 - 2' /
   V40383    'RELATIONSHIP VIC TO OFF 4 - 3' /
   V40391    'OFFENDER NUMBER 5 - 1' /
   V40392    'OFFENDER NUMBER 5 - 2' /
   V40393    'OFFENDER NUMBER 5 - 3' /
   V40401    'RELATIONSHIP VIC TO OFF 5 - 1' /
   V40402    'RELATIONSHIP VIC TO OFF 5 - 2' /
   V40403    'RELATIONSHIP VIC TO OFF 5 - 3' /
   V40411    'OFFENDER NUMBER 6 - 1' /
   V40412    'OFFENDER NUMBER 6 - 2' /
   V40413    'OFFENDER NUMBER 6 - 3' /
   V40421    'RELATIONSHIP VIC TO OFF 6 - 1' /
   V40422    'RELATIONSHIP VIC TO OFF 6 - 2' /
   V40423    'RELATIONSHIP VIC TO OFF 6 - 3' /
   V40431    'OFFENDER NUMBER 7 - 1' /
   V40432    'OFFENDER NUMBER 7 - 2' /
   V40433    'OFFENDER NUMBER 7 - 3' /
   V40441    'RELATIONSHIP VIC TO OFF 7 - 1' /
   V40442    'RELATIONSHIP VIC TO OFF 7 - 2' /
   V40443    'RELATIONSHIP VIC TO OFF 7 - 3' /
   V40451    'OFFENDER NUMBER 8 - 1' /
   V40452    'OFFENDER NUMBER 8 - 2' /
   V40453    'OFFENDER NUMBER 8 - 3' /
   V40461    'RELATIONSHIP VIC TO OFF 8 - 1' /
   V40462    'RELATIONSHIP VIC TO OFF 8 - 2' /
   V40463    'RELATIONSHIP VIC TO OFF 8 - 3' /
   V40471    'OFFENDER NUMBER 9 - 1' /
   V40472    'OFFENDER NUMBER 9 - 2' /
   V40473    'OFFENDER NUMBER 9 - 3' /
   V40481    'RELATIONSHIP VIC TO OFF 9 - 1' /
   V40482    'RELATIONSHIP VIC TO OFF 9 - 2' /
   V40483    'RELATIONSHIP VIC TO OFF 9 - 3' /
   V40491    'OFFENDER NUMBER 10 - 1' /
   V40492    'OFFENDER NUMBER 10 - 2' /
   V40493    'OFFENDER NUMBER 10 - 3' /
   V40501    'RELATIONSHIP VIC TO OFF 10 - 1' /
   V40502    'RELATIONSHIP VIC TO OFF 10 - 2' /
   V40503    'RELATIONSHIP VIC TO OFF 10 - 3' /
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
   ALLOFNS   'ALL OFFENSE CODES FOR THE INCIDENT' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   SEGMENT   '01' 'Admin segment' '04' 'Victim segment'
             '05' 'Offender segment' '06' 'Arrestee segment'
             'W1' 'Window exceptional clearance segment' /
   STATE     1 'AL' 2 'AZ' 3 'AR' 4 'CA' 5 'CO' 6 'CT' 7 'DE' 8 'DC' 9 'FL'
             10 'GA' 11 'ID' 12 'IL' 13 'IN' 14 'IA' 15 'KS' 16 'KY' 17 'LA'
             18 'ME' 19 'MD' 20 'MA' 21 'MI' 22 'MN' 23 'MS' 24 'MO' 25 'MT'
             26 'NB' 27 'NV' 28 'NH' 29 'NJ' 30 'NM' 31 'NY' 32 'NC' 33 'ND'
             34 'OH' 35 'OK' 36 'OR' 37 'PA' 38 'RI' 39 'SC' 40 'SD' 41 'TN'
             42 'TX' 43 'UT' 44 'VT' 45 'VA' 46 'WA' 47 'WV' 48 'WI' 49 'WY'
             50 'AK' 51 'HI' 52 'CZ' 53 'PR' 54 'AS' 55 'GM' 62 'VI' /
   RECSADM   -5 'NA Window Record' /
   RECSOFS   -5 'NA Window Record' /
   RECSPRP   -5 'NA Window Record' /
   RECSVIC   -5 'NA Window Record' /
   RECSOFR   -5 'NA Window Record' /
   RECSARR   -5 'NA Window Record' /
   B1006     -6 'Not applicable' /
   B1009     0 'Possessions' 10 'Cities 250,000+' 11 'Cities 1,000,000+'
             12 'Cities 500,000-999,999' 13 'Cities 250,000-499,999'
             20 'Cities 100,000-249,999' 30 'Cities 50,000-99,999'
             40 'Cities 25,000-49,999' 50 'Cities 10,000-24,999'
             60 'Cities 2,500-9,999' 70 'Cites < 2,500' 80 'Non-MSA Counties'
             81 'Non-MSA Counties 100,000+'
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
             3 'University or college' 4 'State Police' 5 'Special Agency' /
   B1013     0 'No' 1 'Yes' /
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
   V1006     -5 'NA Window Record' 0 'Incident date' 1 'Report date' /
   V1007     -7 'Unknown/missing/DNR' -5 'NA Window Record' /
   V1008     -5 'NA Window Record' /
   V1009     -5 'NA Window Record' /
   V1010     -5 'NA Window Record' /
   V1011     -5 'NA Window Record' /
   V1012     '-6' 'Not applicable' '-5' 'NA Window Record' /
   V1013     -6 'Not applicable' -5 'NA Window Record' 1 'Death of offender'
             2 'Prosecution declined' 3 'Extradition denied'
             4 'Victim refused coop' 5 'Juvenile/no custody' /
   V1014     -6 'Not applicable' -5 'NA Window Record' /
   V6009     1 'On-View Arrest' 2 'Summoned/Cited' 3 'Taken Into Custody' /
   V6010     -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Count Arrestee'
             2 'Multiple' /
   V6011     91 'Murder/Nonnegligent Manslaughter'
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
   V6012     1 'Unarmed' 110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V6013     -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Unarmed'
             110 'Firearm' 111 'Firearm, automatic' 120 'Handgun'
             121 'Handgun, automatic' 130 'Rifle' 131 'Rifle, automatic'
             140 'Shotgun' 141 'Shotgun, automatic' 150 'Other Firearm'
             151 'Other Firearm, automatic' 200 'Lethal Cutting Instrument'
             300 'Club/Blackjack/Brass Knuckles' /
   V6014     -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 99 'Over 98 years old'
             /
   V6015     0 'Female' 1 'Male' /
   V6016     -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'White' 2 'Black'
             3 'American Indian/Alaskan Native' 4 'Asian/Pacific Islander' /
   V6017     -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V6018     -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Nonresident'
             1 'Resident' /
   V6019     -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Referred'
             1 'Handled' /
   V20061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record' 0 'Attempted'
             1 'Completed' /
   V20072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Attempted'
             1 'Completed' /
   V20073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Attempted'
             1 'Completed' /
   V20081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20101    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20102    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20103    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Alcohol'
             2 'Computer equipment' 3 'Drugs/narcotics' /
   V20111    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
             24 'Specialty Store (TV, Fur, Etc.)' 25 'Other/unknown' /
   V20112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
             24 'Specialty Store (TV, Fur, Etc.)' 25 'Other/unknown' /
   V20113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
             24 'Specialty Store (TV, Fur, Etc.)' 25 'Other/unknown' /
   V20121    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V20122    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V20123    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V20131    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'No force' 1 'Force'
             /
   V20132    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'No force' 1 'Force'
             /
   V20133    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'No force' 1 'Force'
             /
   V20141    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20142    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20143    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20151    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20152    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20153    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20161    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Buying/Receiving'
             2 'Cultivating/Manufacturing/Publishing'
             3 'Distributing/Selling' 4 'Exploiting Children' 5 'Other Gang'
             6 'Juvenile Gang' 7 'None/Unknown Gang Involvement'
             8 'Operating/Promoting/Assisting' 9 'Possessing/Concealing'
             10 'Transporting/Transmitting/Importing' 11 'Using/Consuming' /
   V20171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record'
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
             -6 'Not applicable' -5 'NA Window Record' 11 'White' 12 'Black'
             13 'American Indian or Alaskan Native'
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
             -6 'Not applicable' -5 'NA Window Record' 11 'White' 12 'Black'
             13 'American Indian or Alaskan Native'
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
             -6 'Not applicable' -5 'NA Window Record' 11 'White' 12 'Black'
             13 'American Indian or Alaskan Native'
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
             -6 'Not applicable' -5 'NA Window Record' 1 'None' 2 'Burned'
             3 'Counterfeited/Forged' 4 'Destroyed/Damaged/Vandalized'
             5 'Recovered' 6 'Seized' 7 'Stolen/Etc.' /
   V30062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None' 2 'Burned'
             3 'Counterfeited/Forged' 4 'Destroyed/Damaged/Vandalized'
             5 'Recovered' 6 'Seized' 7 'Stolen/Etc.' /
   V30063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None' 2 'Burned'
             3 'Counterfeited/Forged' 4 'Destroyed/Damaged/Vandalized'
             5 'Recovered' 6 'Seized' 7 'Stolen/Etc.' /
   V30071    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Aircraft'
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
             38 'Vehicle Parts/Accessories' 39 'Watercraft' 77 'Other'
             88 'Pending Inventory (of Property)' 99 'Special Category' /
   V30072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Aircraft'
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
             38 'Vehicle Parts/Accessories' 39 'Watercraft' 77 'Other'
             88 'Pending Inventory (of Property)' 99 'Special Category' /
   V30073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Aircraft'
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
             38 'Vehicle Parts/Accessories' 39 'Watercraft' 77 'Other'
             88 'Pending Inventory (of Property)' 99 'Special Category' /
   V30081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30101    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30102    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30103    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30111    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30121    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30122    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30123    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30131    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30132    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30133    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30141    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30142    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30143    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30151    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30152    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30153    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30161    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30172    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30173    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30181    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30182    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30183    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30191    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30192    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30193    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30201    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30202    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30203    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Crack Cocaine'
             2 'Cocaine (all forms except Crack)' 3 'Hashish' 4 'Heroin'
             5 'Marijuana' 6 'Morphine' 7 'Opium' 8 'Other Narcotics' 9 'LSD'
             10 'PCP' 11 'Other Hallucinogens'
             12 'Amphetamines/Methamphetamines' 13 'Other Stimulants'
             14 'Barbiturates' 15 'Other Depressants'
             16 'Other Drugs: Antidepressants' 93 'Over 3 Drug Types' /
   V30211    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30212    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30213    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30221    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30222    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30223    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V30231    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30232    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V30233    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Gram' 2 'Kilogram'
             3 'Ounce' 4 'Pound' 5 'Milliliter' 6 'Liter' 7 'Fluid Ounce'
             8 'Gallon' 9 'Dosage Unit/Items' 10 'Number of Plants' /
   V40061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V40062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V40063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' /
   V40071    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40101    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40102    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40103    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40111    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40121    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40122    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40123    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40131    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40132    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40133    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40141    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40142    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40143    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40151    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40152    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40153    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40161    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Individual'
             2 'Business' 3 'Financial Institution' 4 'Government'
             5 'Law Enforcement Officer' 6 'Religious Organization'
             7 'Society/Public' 8 'Other' /
   V40172    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Individual'
             2 'Business' 3 'Financial Institution' 4 'Government'
             5 'Law Enforcement Officer' 6 'Religious Organization'
             7 'Society/Public' 8 'Other' /
   V40173    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Individual'
             2 'Business' 3 'Financial Institution' 4 'Government'
             5 'Law Enforcement Officer' 6 'Religious Organization'
             7 'Society/Public' 8 'Other' /
   V40181    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Under 24 hours (neonate)' 1 '7-364 days old'
             99 'Over 98 years old' /
   V40182    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Under 24 hours (neonate)' 1 '7-364 days old'
             99 'Over 98 years old' /
   V40183    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Under 24 hours (neonate)' 1 '7-364 days old'
             99 'Over 98 years old' /
   V40191    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Female' 1 'Male' /
   V40192    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Female' 1 'Male' /
   V40193    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Female' 1 'Male' /
   V40201    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'White' 2 'Black'
             3 'American Indian/Alaskan Native' 4 'Asian/Pacific Islander' /
   V40202    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'White' 2 'Black'
             3 'American Indian/Alaskan Native' 4 'Asian/Pacific Islander' /
   V40203    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'White' 2 'Black'
             3 'American Indian/Alaskan Native' 4 'Asian/Pacific Islander' /
   V40211    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V40212    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V40213    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Not of Hispanic Origin' 1 'Hispanic Origin' /
   V40221    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Nonresident'
             1 'Resident' /
   V40222    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Nonresident'
             1 'Resident' /
   V40223    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Nonresident'
             1 'Resident' /
   V40231    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40232    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40233    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40241    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40242    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40243    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40251    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             1 'Crim attacked police officer, that officer killed crim'
             2 'Crim attacked fellow pol ofcr, crim killed by oth pol of'
             3 'Crim attacked a civilian'
             4 'Crim attempted flight from a crime'
             5 'Crim killed in commission of a crime'
             6 'Crim resisted arrest' /
   V40252    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             1 'Crim attacked police officer, that officer killed crim'
             2 'Crim attacked fellow pol ofcr, crim killed by oth pol of'
             3 'Crim attacked a civilian'
             4 'Crim attempted flight from a crime'
             5 'Crim killed in commission of a crime'
             6 'Crim resisted arrest' /
   V40253    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             1 'Crim attacked police officer, that officer killed crim'
             2 'Crim attacked fellow pol ofcr, crim killed by oth pol of'
             3 'Crim attacked a civilian'
             4 'Crim attempted flight from a crime'
             5 'Crim killed in commission of a crime'
             6 'Crim resisted arrest' /
   V40261    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40262    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40263    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40271    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40272    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40273    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40281    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40282    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40283    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40291    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40292    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40293    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40301    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40302    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40303    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40311    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40312    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40313    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40321    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40322    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40323    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40331    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40332    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40333    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40341    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40342    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40343    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40351    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40352    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40353    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40361    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40362    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40363    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40371    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40372    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40373    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40381    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40382    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40383    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40391    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40392    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40393    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40401    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40402    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40403    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40411    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40412    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40413    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40421    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40422    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40423    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40431    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40432    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40433    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40441    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40442    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40443    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40451    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40452    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40453    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40461    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40462    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40463    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40471    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40472    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40473    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40481    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40482    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40483    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40491    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40492    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40493    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'N offenders unknown' /
   V40501    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40502    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V40503    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
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
   V50061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Unknown N offenders' /
   V50062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Unknown N offenders' /
   V50063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record'
             0 'Unknown N offenders' /
   V50071    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 99 'Over 98 yrs' /
   V50072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 99 'Over 98 yrs' /
   V50073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 99 'Over 98 yrs' /
   V50081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Female' 1 'Male' /
   V50082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Female' 1 'Male' /
   V50083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 0 'Female' 1 'Male' /
   V50091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'White' 2 'Black'
             3 'American Indian/Alaskan Native' 4 'Asian/Pacific Islander' /
   V50092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'White' 2 'Black'
             3 'American Indian/Alaskan Native' 4 'Asian/Pacific Islander' /
   V50093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window Record' 1 'White' 2 'Black'
             3 'American Indian/Alaskan Native' 4 'Asian/Pacific Islander' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     RECSADM
     RECSOFS
     RECSPRP
     RECSVIC
     RECSOFR
     RECSARR
     V1006
     V1008
     V1009
     V1010
     V1011 (-5) /
     V1013
     V1014 (-5, -6) /
     V1012 ("-5", "-6") /
     V1007 (-5, -7) /
     B1006
     B1018
     B2006
     B2007
     B2010
     B2011
     B2014
     B2015
     B2018
     B2019
     B3006
     B3007
     B3009 (-6) /
     B1016 ("-6") /
     B3024 (-9) /
     B3025
     B3026
     B3027
     B3028 (-9, -6) /
     V20061
     V20062
     V20063
     V20071
     V20072
     V20073
     V20081
     V20082
     V20083
     V20091
     V20092
     V20093
     V20101
     V20102
     V20103
     V20111
     V20112
     V20113
     V20121
     V20122
     V20123
     V20131
     V20132
     V20133
     V20141
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
     V20201
     V20202
     V20203
     V30061
     V30062
     V30063
     V30071
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
     V30121
     V30122
     V30123
     V30131
     V30132
     V30133
     V30141
     V30142
     V30143
     V30151
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
     V40061
     V40062
     V40063
     V40071
     V40072
     V40073
     V40081
     V40082
     V40083
     V40091
     V40092
     V40093
     V40101
     V40102
     V40103
     V40111
     V40112
     V40113
     V40121
     V40122
     V40123
     V40131
     V40132
     V40133
     V40141
     V40142
     V40143
     V40151
     V40152
     V40153
     V40161
     V40162
     V40163
     V40171
     V40172
     V40173
     V40181
     V40182
     V40183
     V40191
     V40192
     V40193
     V40201
     V40202
     V40203
     V40211
     V40212
     V40213
     V40221
     V40222
     V40223
     V40231
     V40232
     V40233
     V40241
     V40242
     V40243
     V40251
     V40252
     V40253
     V40261
     V40262
     V40263
     V40271
     V40272
     V40273
     V40281
     V40282
     V40283
     V40291
     V40292
     V40293
     V40301
     V40302
     V40303
     V40311
     V40312
     V40313
     V40321
     V40322
     V40323
     V40331
     V40332
     V40333
     V40341
     V40342
     V40343
     V40351
     V40352
     V40353
     V40361
     V40362
     V40363
     V40371
     V40372
     V40373
     V40381
     V40382
     V40383
     V40391
     V40392
     V40393
     V40401
     V40402
     V40403
     V40411
     V40412
     V40413
     V40421
     V40422
     V40423
     V40431
     V40432
     V40433
     V40441
     V40442
     V40443
     V40451
     V40452
     V40453
     V40461
     V40462
     V40463
     V40471
     V40472
     V40473
     V40481
     V40482
     V40483
     V40491
     V40492
     V40493
     V40501
     V40502
     V40503
     V50061
     V50062
     V50063
     V50071
     V50072
     V50073
     V50081
     V50082
     V50083
     V50091
     V50092
     V50093 (LO THRU -5) /
     V6010
     V6013
     V6014
     V6016
     V6017
     V6018
     V6019 (LO THRU -6) /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
