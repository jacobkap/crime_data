*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 36421
*         NATIONAL INCIDENT-BASED REPORTING SYSTEM, 2014: EXTRACT
*                                  FILES
*                   (DATASET 0003: OFFENDER-LEVEL FILE)
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
*  data file is physically located (e.g., "c:\temp\36421-0003-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da36421-0003.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=1239.
DATA LIST FILE=DATA /
            SEGMENT 1-2 (A)               STATE 3-4
            ORI 5-13 (A)        INCNUM 14-25 (A)           INCDATE 26-33
            RECSBH 34-36           RECSADM 37-39           RECSOFS 40-42
           RECSPRP 43-45           RECSVIC 46-48           RECSOFR 49-51
           RECSARR 52-54             BH005 55-62             BH006 63-70
        BH007 71-100 (A)       BH008 101-102 (A)           BH009 103-104
           BH010 105-106           BH011 107-108           BH012 109-110
           BH013 111-112       BH014 113-121 (A)           BH015 122-125
       BH016 126-129 (A)           BH017 130-131           BH018 132-139
           BH019 140-148           BH020 149-151           BH021 152-154
           BH022 155-163           BH023 164-172           BH024 173-175
           BH025 176-178           BH026 179-187           BH027 188-196
           BH028 197-199           BH029 200-202           BH030 203-211
           BH031 212-220           BH032 221-223           BH033 224-226
           BH034 227-235           BH035 236-244           BH036 245-247
           BH037 248-250           BH038 251-259           BH039 260-261
           BH040 262-263           BH041 264-267           BH042 268-270
           BH043 271-273           BH044 274-276           BH045 277-279
           BH046 280-282           BH047 283-285           BH048 286-288
           BH049 289-291           BH050 292-294           BH051 295-297
           BH052 298-300           BH053 301-303           BH054 304-306
           BH055 307-309           BH056 310-312           BH057 313-315
           BH058 316-318           BH059 319-326           V1006 327-328
           V1007 329-330           V1008 331-332           V1009 333-335
           V1010 336-337           V1011 338-339       V1012 340-343 (A)
           V1013 344-345           V1014 346-353           V1016 354-355
           V5006 356-357           V5007 358-359           V5008 360-361
           V5009 362-363           V5011 364-365          V20061 366-368
          V20062 369-371          V20063 372-374          V20071 375-376
          V20072 377-378          V20073 379-380          V20081 381-382
          V20082 383-384          V20083 385-386          V20091 387-388
          V20092 389-390          V20093 391-392          V20101 393-394
          V20102 395-396          V20103 397-398          V20111 399-400
          V20112 401-402          V20113 403-404          V20121 405-406
          V20122 407-408          V20123 409-410          V20131 411-412
          V20132 413-414          V20133 415-416          V20141 417-418
          V20142 419-420          V20143 421-422          V20151 423-424
          V20152 425-426          V20153 427-428          V20161 429-430
          V20162 431-432          V20163 433-434          V20171 435-437
          V20172 438-440          V20173 441-443          V20181 444-446
          V20182 447-449          V20183 450-452          V20191 453-455
          V20192 456-458          V20193 459-461          V20201 462-463
          V20202 464-465          V20203 466-467         V2020B1 468-469
         V2020B2 470-471         V2020B3 472-473         V2020C1 474-475
         V2020C2 476-477         V2020C3 478-479         V2020D1 480-481
         V2020D2 482-483         V2020D3 484-485         V2020E1 486-487
         V2020E2 488-489         V2020E3 490-491          V30061 492-493
          V30062 494-495          V30063 496-497          V30071 498-499
          V30072 500-501          V30073 502-503          V30081 504-512
          V30082 513-521          V30083 522-530          V30091 531-538
          V30092 539-546          V30093 547-554          V30101 555-556
          V30102 557-558          V30103 559-560          V30111 561-562
          V30112 563-564          V30113 565-566          V30121 567-568
          V30122 569-570          V30123 571-572          V30131 573-581
          V30132 582-590          V30133 591-599          V30141 600-602
          V30142 603-605          V30143 606-608          V30151 609-610
          V30152 611-612          V30153 613-614          V30161 615-616
          V30162 617-618          V30163 619-620          V30171 621-629
          V30172 630-638          V30173 639-647          V30181 648-650
          V30182 651-653          V30183 654-656          V30191 657-658
          V30192 659-660          V30193 661-662          V30201 663-664
          V30202 665-666          V30203 667-668          V30211 669-677
          V30212 678-686          V30213 687-695          V30221 696-698
          V30222 699-701          V30223 702-704          V30231 705-706
          V30232 707-708          V30233 709-710          V40061 711-713
          V40062 714-716          V40063 717-719          V40071 720-722
          V40072 723-725          V40073 726-728          V40081 729-731
          V40082 732-734          V40083 735-737          V40091 738-740
          V40092 741-743          V40093 744-746          V40101 747-749
          V40102 750-752          V40103 753-755          V40111 756-758
          V40112 759-761          V40113 762-764          V40121 765-767
          V40122 768-770          V40123 771-773          V40131 774-776
          V40132 777-779          V40133 780-782          V40141 783-785
          V40142 786-788          V40143 789-791          V40151 792-794
          V40152 795-797          V40153 798-800          V40161 801-803
          V40162 804-806          V40163 807-809          V40171 810-811
          V40172 812-813          V40173 814-815         V4017A1 816-817
         V4017A2 818-819         V4017A3 820-821         V4017B1 822-823
         V4017B2 824-825         V4017B3 826-827     V4017C1 828-836 (A)
     V4017C2 837-845 (A)     V4017C3 846-854 (A)      V40181 855-858 (1)
      V40182 859-862 (1)      V40183 863-866 (1)          V40191 867-868
          V40192 869-870          V40193 871-872          V40201 873-874
          V40202 875-876          V40203 877-878          V40211 879-880
          V40212 881-882          V40213 883-884          V40221 885-886
          V40222 887-888          V40223 889-890          V40231 891-892
          V40232 893-894          V40233 895-896          V40241 897-898
          V40242 899-900          V40243 901-902          V40251 903-904
          V40252 905-906          V40253 907-908          V40261 909-910
          V40262 911-912          V40263 913-914          V40271 915-916
          V40272 917-918          V40273 919-920          V40281 921-922
          V40282 923-924          V40283 925-926          V40291 927-928
          V40292 929-930          V40293 931-932          V40301 933-934
          V40302 935-936          V40303 937-938          V40311 939-940
          V40312 941-942          V40313 943-944          V40321 945-946
          V40322 947-948          V40323 949-950          V40331 951-952
          V40332 953-954          V40333 955-956          V40341 957-958
          V40342 959-960          V40343 961-962          V40351 963-964
          V40352 965-966          V40353 967-968          V40361 969-970
          V40362 971-972          V40363 973-974          V40371 975-976
          V40372 977-978          V40373 979-980          V40381 981-982
          V40382 983-984          V40383 985-986          V40391 987-988
          V40392 989-990          V40393 991-992          V40401 993-994
          V40402 995-996          V40403 997-998         V40411 999-1000
        V40412 1001-1002        V40413 1003-1004        V40421 1005-1006
        V40422 1007-1008        V40423 1009-1010        V40431 1011-1012
        V40432 1013-1014        V40433 1015-1016        V40441 1017-1018
        V40442 1019-1020        V40443 1021-1022        V40451 1023-1024
        V40452 1025-1026        V40453 1027-1028        V40461 1029-1030
        V40462 1031-1032        V40463 1033-1034        V40471 1035-1036
        V40472 1037-1038        V40473 1039-1040        V40481 1041-1042
        V40482 1043-1044        V40483 1045-1046        V40491 1047-1048
        V40492 1049-1050        V40493 1051-1052        V40501 1053-1054
        V40502 1055-1056        V40503 1057-1058        V60061 1059-1060
        V60062 1061-1062        V60063 1063-1064    V60071 1065-1076 (A)
    V60072 1077-1088 (A)    V60073 1089-1100 (A)        V60081 1101-1108
        V60082 1109-1116        V60083 1117-1124        V60091 1125-1126
        V60092 1127-1128        V60093 1129-1130        V60101 1131-1132
        V60102 1133-1134        V60103 1135-1136        V60111 1137-1139
        V60112 1140-1142        V60113 1143-1145        V60121 1146-1148
        V60122 1149-1151        V60123 1152-1154        V60131 1155-1157
        V60132 1158-1160        V60133 1161-1163        V60141 1164-1165
        V60142 1166-1167        V60143 1168-1169        V60151 1170-1171
        V60152 1172-1173        V60153 1174-1175        V60161 1176-1177
        V60162 1178-1179        V60163 1180-1181        V60171 1182-1183
        V60172 1184-1185        V60173 1186-1187        V60181 1188-1189
        V60182 1190-1191        V60183 1192-1193        V60191 1194-1195
        V60192 1196-1197        V60193 1198-1199   ALLOFNS 1200-1239 (A)
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   SEGMENT   'SEGMENT LEVEL' /
   STATE     'NUMERIC STATE CODE' /
   ORI       'ORIGINATING AGENCY IDENTIFIER' /
   INCNUM    'INCIDENT NUMBER' /
   INCDATE   'INCIDENT DATE' /
   RECSBH    'N BATCH HEADER RECORDS PER ORI-INCIDENT NUMBER' /
   RECSADM   'N ADMINISTRATIVE (01) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSOFS   'N OFFENSE (02) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSPRP   'N PROPERTY (03) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSVIC   'N VICTIM (04) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSOFR   'N OFFENDER (05) RECORDS PER ORI-INCIDENT NUMBER' /
   RECSARR   'N ARRESTEE (06) RECORDS PER ORI-INCIDENT NUMBER' /
   BH005     'DATE ORI WAS ADDED' /
   BH006     'DATE ORI WENT NIBRS' /
   BH007     'CITY NAME' /
   BH008     'STATE ABBREVIATION' /
   BH009     'POPULATION GROUP' /
   BH010     'COUNTRY DIVISION' /
   BH011     'COUNTRY REGION' /
   BH012     'AGENCY INDICATOR' /
   BH013     'CORE CITY' /
   BH014     'COVERED BY ORI' /
   BH015     'FBI FIELD OFFICE' /
   BH016     'JUDICIAL DISTRICT' /
   BH017     'AGENCY NIBRS FLAG' /
   BH018     'AGENCY INACTIVE DATE' /
   BH019     'CURRENT POPULATION 1' /
   BH020     'UCR COUNTY CODE 1' /
   BH021     'MSA CODE 1' /
   BH022     'LAST POPULATION 1' /
   BH023     'CURRENT POPULATION 2' /
   BH024     'UCR COUNTY CODE 2' /
   BH025     'MSA CODE 2' /
   BH026     'LAST POPULATION 2' /
   BH027     'CURRENT POPULATION 3' /
   BH028     'UCR COUNTY CODE 3' /
   BH029     'MSA CODE 3' /
   BH030     'LAST POPULATION 3' /
   BH031     'CURRENT POPULATION 4' /
   BH032     'UCR COUNTY CODE 4' /
   BH033     'MSA CODE 4' /
   BH034     'LAST POPULATION 4' /
   BH035     'CURRENT POPULATION 5' /
   BH036     'UCR COUNTY CODE 5' /
   BH037     'MSA CODE 5' /
   BH038     'LAST POPULATION 5' /
   BH039     '01-06-12 INDICATOR' /
   BH040     'NUMBER OF MONTHS REPORTED' /
   BH041     'MASTER FILE YEAR' /
   BH042     'AGENCY ACTIVITY INDICATORS JANUARY (See Codebook)' /
   BH043     'AGENCY ACTIVITY INDICATORS FEBRUARY (See Codebook)' /
   BH044     'AGENCY ACTIVITY INDICATORS MARCH (See Codebook)' /
   BH045     'AGENCY ACTIVITY INDICATORS APRIL (See Codebook)' /
   BH046     'AGENCY ACTIVITY INDICATORS MAY (See Codebook)' /
   BH047     'AGENCY ACTIVITY INDICATORS JUNE (See Codebook)' /
   BH048     'AGENCY ACTIVITY INDICATORS JULY (See Codebook)' /
   BH049     'AGENCY ACTIVITY INDICATORS AUGUST (See Codebook)' /
   BH050     'AGENCY ACTIVITY INDICATORS SEPTEMBER (See Codebook)' /
   BH051     'AGENCY ACTIVITY INDICATORS OCTOBER (See Codebook)' /
   BH052     'AGENCY ACTIVITY INDICATORS NOVEMBER (See Codebook)' /
   BH053     'AGENCY ACTIVITY INDICATORS DECEMBER (See Codebook)' /
   BH054     'FIPS COUNTY 1' /
   BH055     'FIPS COUNTY 2' /
   BH056     'FIPS COUNTY 3' /
   BH057     'FIPS COUNTY 4' /
   BH058     'FIPS COUNTY 5' /
   BH059     'DATE STATE BEGAN IBR FOR REPORTING LEOKA' /
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
   V5006     'OFFENDER SEQUENCE NUMBER' /
   V5007     'AGE OF OFFENDER' /
   V5008     'SEX OF OFFENDER' /
   V5009     'RACE OF OFFENDER' /
   V5011     'ETHNICITY OF OFFENDER' /
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
   V20201    'BIAS MOTIVATION 1 - 1' /
   V20202    'BIAS MOTIVATION 1 - 2' /
   V20203    'BIAS MOTIVATION 1 - 3' /
   V2020B1   'BIAS MOTIVATION 2 - 1' /
   V2020B2   'BIAS MOTIVATION 2 - 2' /
   V2020B3   'BIAS MOTIVATION 2 - 3' /
   V2020C1   'BIAS MOTIVATION 3 - 1' /
   V2020C2   'BIAS MOTIVATION 3 - 2' /
   V2020C3   'BIAS MOTIVATION 3 - 3' /
   V2020D1   'BIAS MOTIVATION 4 - 1' /
   V2020D2   'BIAS MOTIVATION 4 - 2' /
   V2020D3   'BIAS MOTIVATION 4 - 3' /
   V2020E1   'BIAS MOTIVATION 5 - 1' /
   V2020E2   'BIAS MOTIVATION 5 - 2' /
   V2020E3   'BIAS MOTIVATION 5 - 3' /
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
   V4017A1   'TYPE OF ACTIVITY (OFFICER) - 1' /
   V4017A2   'TYPE OF ACTIVITY (OFFICER) - 2' /
   V4017A3   'TYPE OF ACTIVITY (OFFICER) - 3' /
   V4017B1   'ASSIGNMENT TYPE (OFFICER) - 1' /
   V4017B2   'ASSIGNMENT TYPE (OFFICER) - 2' /
   V4017B3   'ASSIGNMENT TYPE (OFFICER) - 3' /
   V4017C1   'ORI OTHER JURISDICTION (OFFICER) - 1' /
   V4017C2   'ORI OTHER JURISDICTION (OFFICER) - 2' /
   V4017C3   'ORI OTHER JURISDICTION (OFFICER) - 3' /
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
   BH006     -6 'Not applicable' /
   BH009     0 'Possessions and Canal Zone' 10 'Cities 250,000+'
             11 'Cities 1,000,000+' 12 'Cities 500,000-999,999'
             13 'Cities 250,000-499,999' 20 'Cities 100,000-249,999'
             30 'Cities 50,000-99,999' 40 'Cities 25,000-49,999'
             50 'Cities 10,000-24,999' 60 'Cities 2,500-9,999'
             70 'Cities < 2,500' 80 'Non-MSA Counties'
             81 'Non-MSA Counties 100,000+'
             82 'Non-MSA Counties 25,000-99,999'
             83 'Non-MSA Counties 10,000-24,999'
             84 'Non-MSA Counties < 10,000' 85 'Non-MSA State Police'
             90 'MSA Counties' 91 'MSA Counties 100,000+'
             92 'MSA Counties 25,000-99,999' 93 'MSA Counties 10,000-24,999'
             94 'MSA Counties < 10,000' 95 'MSA State Police' /
   BH010     0 'Possessions and Canal Zone' 1 'New England'
             2 'Middle Atlantic' 3 'East North Central'
             4 'West North Central' 5 'South Atlantic' 6 'East South Central'
             7 'West South Central' 8 'Mountain' 9 'Pacific' /
   BH011     0 'Possessions and Canal Zone' 1 'North East' 2 'North Central'
             3 'South' 4 'West' /
   BH012     0 'Covered by another agency' 1 'City' 2 'County'
             3 'University or college' 4 'State Police' 5 'Special Agency'
             6 'Other state agencies' 7 'Tribal agencies'
             8 'Federal agencies' /
   BH013     0 'No' 1 'Yes' /
   BH014     '-6' 'Not applicable' /
   BH015     9999 'Blanked' /
   BH016     '-6' 'Not applicable' /
   BH017     0 'Does not yet participate' 1 'Active' /
   BH018     -6 'Not applicable' /
   BH020     -6 'Not applicable' /
   BH021     -6 'Not applicable' /
   BH024     -6 'Not applicable' /
   BH025     -6 'Not applicable' /
   BH028     -6 'Not applicable' /
   BH029     -6 'Not applicable' /
   BH032     -6 'Not applicable' /
   BH033     -6 'Not applicable' /
   BH036     -6 'Not applicable' /
   BH037     -6 'Not applicable' /
   BH039     -6 'Not applicable' /
   BH042     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH043     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH044     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH045     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH046     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH047     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH048     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH049     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH050     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH051     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH052     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH053     0 'Blk ,Blk ,Blk' 1 'Blk ,Blk ,Window' 10 'Blk ,GrpAB,Blk'
             11 'Blk ,GrpAB,Window' 100 'Zero-rpt,Blk ,Blk'
             101 'Zero-rpt,Blk ,Window' 110 'Zero-rpt,GrpAB,Blk'
             111 'Zero-rpt,GrpAB,Window' /
   BH054     -9 'Undetermined' 900 'UCR' /
   BH055     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   BH056     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   BH057     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   BH058     -9 'Undetermined' -6 'Not applicable' 900 'UCR' /
   BH059     -6 'Not applicable' /
   V1006     -5 'NA Window/Grp B Record' 0 'Incident date' 1 'Report date' /
   V1007     -7 'Unknown/Missing/DNR' -5 'NA Window/Grp B Record' /
   V1008     -5 'NA Window/Grp B Record' /
   V1009     -5 'NA Window/Grp B Record' /
   V1010     -5 'NA Window/Grp B Record' /
   V1011     -5 'NA Window/Grp B Record' /
   V1012     '-6' 'Not applicable' '-5' 'NA Window/Grp B Record' /
   V1013     -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Death of offender' 2 'Prosecution declined'
           3 'In custody of other jurisdiction (includes extradition denied)'
             4 'Victim refused coop' 5 'Juvenile/no custody' /
   V1014     -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V1016     -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'No' 2 'Yes' /
   V5006     0 'Unknown N offenders' /
   V5007     -7 'Unknown/Missing/DNR' 99 'Over 98 yrs' /
   V5008     -7 'Unknown/Missing/DNR' 0 'Female' 1 'Male' /
   V5009     -7 'Unknown/Missing/DNR' 1 'White' 2 'Black or African American'
             3 'American Indian or Alaska Native' 4 'Asian'
             5 'Native Hawaiian or Other Pacific Islander' /
   V5011     -9 'Undetermined' -7 'Unknown/Missing/DNR'
             0 'Not Hispanic or Latino' 1 'Hispanic or Latino' /
   V20061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V20062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V20063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
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
             1 'Air/bus/train terminal' 2 'Bank/savings and loan'
             3 'Bar/nightclub' 4 'Church/synagogue/temple/mosque'
             5 'Commercial/office building' 6 'Construction site'
             7 'Convenience store' 8 'Department/discount store'
             9 'Drug store/Drs office/hospital' 10 'Field/woods'
             11 'Government/public building' 12 'Grocery/supermarket'
             13 'Highway/road/alley/street/sidewalk' 14 'Hotel/motel/etc.'
             15 'Jail/prison/penitentiary/corrections facility'
             16 'Lake/waterway/beach' 17 'Liquor store'
             18 'Parking/drop lot/garage' 19 'Rental storage facility'
             20 'Residence/home' 21 'Restaurant' 22 'School/college'
             23 'Service/gas station' 24 'Specialty store (TV, fur, etc.)'
             25 'Other/unknown' 37 'Abandoned/condemned structure'
             38 'Amusement park' 39 'Arena/stadium/fairgrounds/coliseum'
             40 'ATM separate from bank' 41 'Auto dealership new/used'
             42 'Camp/campground' 44 'Daycare facility'
             45 'Dock/wharf/freight/modal terminal' 46 'Farm facility'
             47 'Gambling facility/casino/race track' 48 'Industrial site'
             49 'Military installation' 50 'Park/playground' 51 'Rest area'
             52 'School--college/university'
             53 'School--elementary/secondary' 54 'Shelter--mission/homeless'
             55 'Shopping mall' 56 'Tribal lands' 57 'Community center' /
   V20112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Air/bus/train terminal' 2 'Bank/savings and loan'
             3 'Bar/nightclub' 4 'Church/synagogue/temple/mosque'
             5 'Commercial/office building' 6 'Construction site'
             7 'Convenience store' 8 'Department/discount store'
             9 'Drug store/Drs office/hospital' 10 'Field/woods'
             11 'Government/public building' 12 'Grocery/supermarket'
             13 'Highway/road/alley/street/sidewalk' 14 'Hotel/motel/etc.'
             15 'Jail/prison/penitentiary/corrections facility'
             16 'Lake/waterway/beach' 17 'Liquor store'
             18 'Parking/drop lot/garage' 19 'Rental storage facility'
             20 'Residence/home' 21 'Restaurant' 22 'School/college'
             23 'Service/gas station' 24 'Specialty store (TV, fur, etc.)'
             25 'Other/unknown' 37 'Abandoned/condemned structure'
             38 'Amusement park' 39 'Arena/stadium/fairgrounds/coliseum'
             40 'ATM separate from bank' 41 'Auto dealership new/used'
             42 'Camp/campground' 44 'Daycare facility'
             45 'Dock/wharf/freight/modal terminal' 46 'Farm facility'
             47 'Gambling facility/casino/race track' 48 'Industrial site'
             49 'Military installation' 50 'Park/playground' 51 'Rest area'
             52 'School--college/university'
             53 'School--elementary/secondary' 54 'Shelter--mission/homeless'
             55 'Shopping mall' 56 'Tribal lands' 57 'Community center' /
   V20113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Air/bus/train terminal' 2 'Bank/savings and loan'
             3 'Bar/nightclub' 4 'Church/synagogue/temple/mosque'
             5 'Commercial/office building' 6 'Construction site'
             7 'Convenience store' 8 'Department/discount store'
             9 'Drug store/Drs office/hospital' 10 'Field/woods'
             11 'Government/public building' 12 'Grocery/supermarket'
             13 'Highway/road/alley/street/sidewalk' 14 'Hotel/motel/etc.'
             15 'Jail/prison/penitentiary/corrections facility'
             16 'Lake/waterway/beach' 17 'Liquor store'
             18 'Parking/drop lot/garage' 19 'Rental storage facility'
             20 'Residence/home' 21 'Restaurant' 22 'School/college'
             23 'Service/gas station' 24 'Specialty store (TV, fur, etc.)'
             25 'Other/unknown' 37 'Abandoned/condemned structure'
             38 'Amusement park' 39 'Arena/stadium/fairgrounds/coliseum'
             40 'ATM separate from bank' 41 'Auto dealership new/used'
             42 'Camp/campground' 44 'Daycare facility'
             45 'Dock/wharf/freight/modal terminal' 46 'Farm facility'
             47 'Gambling facility/casino/race track' 48 'Industrial site'
             49 'Military installation' 50 'Park/playground' 51 'Rest area'
             52 'School--college/university'
             53 'School--elementary/secondary' 54 'Shelter--mission/homeless'
             55 'Shopping mall' 56 'Tribal lands' 57 'Community center' /
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
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V20202    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V20203    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020B1   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020B2   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020B3   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020C1   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020C2   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020C3   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020D1   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020D2   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020D3   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020E1   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020E2   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
   V2020E3   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 11 'Anti-White'
             12 'Anti-Anti-Black or African American'
             13 'Anti-American Indian or Alaska Native' 14 'Anti-Asian'
             15 'Anti-Multi-racial group'
             16 'Anti-Native Hawaiian or other Pacific Islander'
             21 'Anti-Jewish' 22 'Anti-Catholic' 23 'Anti-Protestant'
             24 'Anti-Islamic (Muslim)' 25 'Anti-Other religion'
             26 'Anti-Multi-religious group' 27 'Anti-Atheism/Agnosticism'
             32 'Anti-Hispanic or Latino' 33 'Anti-Not Hispanic or Latino'
             41 'Anti-Gay' 42 'Anti-Lesbian'
         43 'Anti-Lesbian, Gay, Bisexual, or Transgender, Mixed Group (LGBT)'
             44 'Anti-Heterosexual' 45 'Anti-Bisexual'
             51 'Anti-Physical disability' 52 'Anti-Mental disability'
             61 'Anti-Male' 62 'Anti-Female' 71 'Anti-Transgender'
             72 'Anti-Gender non-conforming' 88 'None' 99 'Unknown' /
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
             6 'Clothes/furs' 7 'Computer hardware/software'
             8 'Consumable goods' 9 'Credit/debit cards' 10 'Drugs/narcotics'
             11 'Drug/narcotic equip.' 12 'Farm equipment' 13 'Firearms'
             14 'Gambling equipment'
             15 'Heavy construction/industrial equipment'
             16 'Household goods' 17 'Jewelry/precious metals/gems'
             18 'Livestock' 19 'Merchandise' 20 'Money'
             21 'Negotiable instruments' 22 'Nonnegotiable instruments'
             23 'Office-type equipment' 24 'Other motor vehicles'
             25 'Purses/handbags/wallets' 26 'Radios/tvs/vcrs/dvd players'
             27 'Recordings-audio/visual' 28 'Recreational vehicles'
             29 'Structures-single occupancy dwellings'
             30 'Structures-other dwellings'
             31 'Structures-commercial/business'
             32 'Structures-industrial/manufacturing'
             33 'Structures-public/community' 34 'Structures-storage'
             35 'Structures-other' 36 'Tools-power/hand' 37 'Trucks'
             38 'Vehicle parts/accessories' 39 'Watercraft'
             41 'Aircraft parts/accessories'
             42 'Artistic supplies/accessories' 43 'Building materials'
             44 'Camping/hunting/fishing equipment/supplies' 45 'Chemicals'
             46 'Collections/collectibles' 47 'Crops'
             48 'Documents/personal or business' 49 'Explosives'
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
             6 'Clothes/furs' 7 'Computer hardware/software'
             8 'Consumable goods' 9 'Credit/debit cards' 10 'Drugs/narcotics'
             11 'Drug/narcotic equip.' 12 'Farm equipment' 13 'Firearms'
             14 'Gambling equipment'
             15 'Heavy construction/industrial equipment'
             16 'Household goods' 17 'Jewelry/precious metals/gems'
             18 'Livestock' 19 'Merchandise' 20 'Money'
             21 'Negotiable instruments' 22 'Nonnegotiable instruments'
             23 'Office-type equipment' 24 'Other motor vehicles'
             25 'Purses/handbags/wallets' 26 'Radios/tvs/vcrs/dvd players'
             27 'Recordings-audio/visual' 28 'Recreational vehicles'
             29 'Structures-single occupancy dwellings'
             30 'Structures-other dwellings'
             31 'Structures-commercial/business'
             32 'Structures-industrial/manufacturing'
             33 'Structures-public/community' 34 'Structures-storage'
             35 'Structures-other' 36 'Tools-power/hand' 37 'Trucks'
             38 'Vehicle parts/accessories' 39 'Watercraft'
             41 'Aircraft parts/accessories'
             42 'Artistic supplies/accessories' 43 'Building materials'
             44 'Camping/hunting/fishing equipment/supplies' 45 'Chemicals'
             46 'Collections/collectibles' 47 'Crops'
             48 'Documents/personal or business' 49 'Explosives'
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
             6 'Clothes/furs' 7 'Computer hardware/software'
             8 'Consumable goods' 9 'Credit/debit cards' 10 'Drugs/narcotics'
             11 'Drug/narcotic equip.' 12 'Farm equipment' 13 'Firearms'
             14 'Gambling equipment'
             15 'Heavy construction/industrial equipment'
             16 'Household goods' 17 'Jewelry/precious metals/gems'
             18 'Livestock' 19 'Merchandise' 20 'Money'
             21 'Negotiable instruments' 22 'Nonnegotiable instruments'
             23 'Office-type equipment' 24 'Other motor vehicles'
             25 'Purses/handbags/wallets' 26 'Radios/tvs/vcrs/dvd players'
             27 'Recordings-audio/visual' 28 'Recreational vehicles'
             29 'Structures-single occupancy dwellings'
             30 'Structures-other dwellings'
             31 'Structures-commercial/business'
             32 'Structures-industrial/manufacturing'
             33 'Structures-public/community' 34 'Structures-storage'
             35 'Structures-other' 36 'Tools-power/hand' 37 'Trucks'
             38 'Vehicle parts/accessories' 39 'Watercraft'
             41 'Aircraft parts/accessories'
             42 'Artistic supplies/accessories' 43 'Building materials'
             44 'Camping/hunting/fishing equipment/supplies' 45 'Chemicals'
             46 'Collections/collectibles' 47 'Crops'
             48 'Documents/personal or business' 49 'Explosives'
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
   V40061    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V40062    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V40063    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' /
   V40071    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40072    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40073    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40081    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40082    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40083    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40091    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40092    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40093    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40101    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40102    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40103    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40111    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40121    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40122    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40123    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40131    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40132    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40133    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40141    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40142    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40143    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40151    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40152    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40153    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40161    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' /
   V40171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Individual'
             2 'Business' 3 'Financial Institution' 4 'Government'
             5 'Law Enforcement Officer' 6 'Religious Organization'
             7 'Society/Public' 8 'Other' /
   V40172    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Individual'
             2 'Business' 3 'Financial Institution' 4 'Government'
             5 'Law Enforcement Officer' 6 'Religious Organization'
             7 'Society/Public' 8 'Other' /
   V40173    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Individual'
             2 'Business' 3 'Financial Institution' 4 'Government'
             5 'Law Enforcement Officer' 6 'Religious Organization'
             7 'Society/Public' 8 'Other' /
   V4017A1   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Respond disturbance' 2 'Burglary in process'
             3 'Robbery in process' 4 'Attempt oth arrest' 5 'Civil disorder'
             6 'Custody prisoners' 7 'Investigating' 8 'Ambush-no warning'
             9 'Deranged assailant' 10 'Traffic pursuits' 11 'All other' /
   V4017A2   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Respond disturbance' 2 'Burglary in process'
             3 'Robbery in process' 4 'Attempt oth arrest' 5 'Civil disorder'
             6 'Custody prisoners' 7 'Investigating' 8 'Ambush-no warning'
             9 'Deranged assailant' 10 'Traffic pursuits' 11 'All other' /
   V4017A3   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Respond disturbance' 2 'Burglary in process'
             3 'Robbery in process' 4 'Attempt oth arrest' 5 'Civil disorder'
             6 'Custody prisoners' 7 'Investigating' 8 'Ambush-no warning'
             9 'Deranged assailant' 10 'Traffic pursuits' 11 'All other' /
   V4017B1   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Two-officer vehicle' 2 '1 officer veh (alone)'
             3 '1 officer veh (assist)' 4 'Spec assign (alone)'
             5 'Spec assign (assist)' 6 'Other (alone)' 7 'Other (assisted)'
             /
   V4017B2   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Two-officer vehicle' 2 '1 officer veh (alone)'
             3 '1 officer veh (assist)' 4 'Spec assign (alone)'
             5 'Spec assign (assist)' 6 'Other (alone)' 7 'Other (assisted)'
             /
   V4017B3   -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Two-officer vehicle' 2 '1 officer veh (alone)'
             3 '1 officer veh (assist)' 4 'Spec assign (alone)'
             5 'Spec assign (assist)' 6 'Other (alone)' 7 'Other (assisted)'
             /
   V4017C1   '-8' 'NA LT 3 records' '-6' 'Not applicable'
             '-5' 'NA Window/Grp B Record' /
   V4017C2   '-8' 'NA LT 3 records' '-6' 'Not applicable'
             '-5' 'NA Window/Grp B Record' /
   V4017C3   '-8' 'NA LT 3 records' '-6' 'Not applicable'
             '-5' 'NA Window/Grp B Record' /
   V40181    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0.1 'Under 24 hours (neonate)' 0.2 '1-6 days old'
             0.5 '7-364 days old' 99 'Over 98 years old' /
   V40182    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0.1 'Under 24 hours (neonate)' 0.2 '1-6 days old'
             0.5 '7-364 days old' 99 'Over 98 years old' /
   V40183    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0.1 'Under 24 hours (neonate)' 0.2 '1-6 days old'
             0.5 '7-364 days old' 99 'Over 98 years old' /
   V40191    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V40192    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V40193    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Female'
             1 'Male' /
   V40201    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black or African American'
             3 'American Indian or Alaska Native' 4 'Asian'
             5 'Native Hawaiian or Other Pacific Islander' /
   V40202    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black or African American'
             3 'American Indian or Alaska Native' 4 'Asian'
             5 'Native Hawaiian or Other Pacific Islander' /
   V40203    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black or African American'
             3 'American Indian or Alaska Native' 4 'Asian'
             5 'Native Hawaiian or Other Pacific Islander' /
   V40211    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not Hispanic or Latino' 1 'Hispanic or Latino' /
   V40212    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not Hispanic or Latino' 1 'Hispanic or Latino' /
   V40213    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not Hispanic or Latino' 1 'Hispanic or Latino' /
   V40221    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Nonresident'
             1 'Resident' /
   V40222    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Nonresident'
             1 'Resident' /
   V40223    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 0 'Nonresident'
             1 'Resident' /
   V40231    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40232    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40233    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40241    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40242    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40243    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'Argument'
             2 'Assault on Law Enf. Officer(s)' 3 'Drug Dealing' 4 'Gangland'
             5 'Juvenile Gang' 6 'Lovers Quarrel' 7 'Mercy Killing'
             8 'Other Felony Involved' 9 'Other Circumstances'
             20 'Criminal Killed by Private Citizen'
             21 'Criminal Killed by Police Officer'
             30 'Child Playing With Weapon' 31 'Gun-Cleaning Accident'
             32 'Hunting Accident' 33 'Other Negligent Weapon Handling'
             34 'Other Negligent Killings' /
   V40251    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crim attacked police officer, that officer killed crim'
             2 'Crim attacked fellow pol ofcr, crim killed by oth pol of'
             3 'Crim attacked a civilian'
             4 'Crim attempted flight from a crime'
             5 'Crim killed in commission of a crime'
             6 'Crim resisted arrest' /
   V40252    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crim attacked police officer, that officer killed crim'
             2 'Crim attacked fellow pol ofcr, crim killed by oth pol of'
             3 'Crim attacked a civilian'
             4 'Crim attempted flight from a crime'
             5 'Crim killed in commission of a crime'
             6 'Crim resisted arrest' /
   V40253    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             1 'Crim attacked police officer, that officer killed crim'
             2 'Crim attacked fellow pol ofcr, crim killed by oth pol of'
             3 'Crim attacked a civilian'
             4 'Crim attempted flight from a crime'
             5 'Crim killed in commission of a crime'
             6 'Crim resisted arrest' /
   V40261    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40262    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40263    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40271    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40272    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40273    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40281    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40282    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40283    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40291    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40292    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40293    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40301    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40302    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40303    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'None'
             2 'Apparent Minor Injury' 3 'Apparent Broken Bones'
             4 'Other Major Injury' 5 'Possible Internal Injury'
             6 'Loss of Teeth' 7 'Severe Laceration' 8 'Unconsciousness' /
   V40311    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40312    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40313    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40321    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40332    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40333    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40341    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40352    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40353    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40361    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40372    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40373    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40381    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40392    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40393    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40401    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40412    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40413    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40421    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40432    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40433    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40441    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40452    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40453    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40461    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40472    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40473    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40481    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40492    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40493    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'N offenders unknown' /
   V40501    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             -6 'Not applicable' -5 'NA Window/Grp B Record'
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
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' 901 'Bad Checks'
             902 'Curfew/Loitering/Vagrancy Violations'
             903 'Disorderly Conduct' 904 'Driving Under the Influence'
             905 'Drunkenness' 906 'Family Offenses, Nonviolent'
             907 'Liquor Law Violations' 908 'Peeping Tom' 909 'Runaway'
             910 'Trespass of Real Property' 990 'All Other Offenses' /
   V60112    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' 901 'Bad Checks'
             902 'Curfew/Loitering/Vagrancy Violations'
             903 'Disorderly Conduct' 904 'Driving Under the Influence'
             905 'Drunkenness' 906 'Family Offenses, Nonviolent'
             907 'Liquor Law Violations' 908 'Peeping Tom' 909 'Runaway'
             910 'Trespass of Real Property' 990 'All Other Offenses' /
   V60113    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             91 'Murder/Nonnegligent Manslaughter'
             92 'Negligent Manslaughter' 93 'Justifiable Homicide'
             100 'Kidnaping/Abduction' 111 'Rape' 112 'Sodomy'
             113 'Sexual Assault With An Object'
             114 'Fondling (Indecent Liberties/Child Molesting)'
             120 'Robbery' 131 'Aggravated Assault' 132 'Simple Assault'
             133 'Intimidation' 200 'Arson' 210 'Extortion/Blackmail'
             220 'Burglary/Breaking and Entering' 231 'Pocket-picking'
             232 'Purse-snatching' 233 'Shoplifting'
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
             403 'Purchasing Prostitution' 510 'Bribery'
             520 'Weapon Law Violations'
             641 'Human Trafficking - Commercial Sex Acts'
             642 'Human Trafficking - Involuntary Servitude' 901 'Bad Checks'
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
             2 'Black or African American'
             3 'American Indian or Alaska Native' 4 'Asian'
             5 'Native Hawaiian or Other Pacific Islander' /
   V60162    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black or African American'
             3 'American Indian or Alaska Native' 4 'Asian'
             5 'Native Hawaiian or Other Pacific Islander' /
   V60163    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record' 1 'White'
             2 'Black or African American'
             3 'American Indian or Alaska Native' 4 'Asian'
             5 'Native Hawaiian or Other Pacific Islander' /
   V60171    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not Hispanic or Latino' 1 'Hispanic or Latino' /
   V60172    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not Hispanic or Latino' 1 'Hispanic or Latino' /
   V60173    -9 'Undetermined' -8 'NA LT 3 records' -7 'Unknown/Missing/DNR'
             -6 'Not applicable' -5 'NA Window/Grp B Record'
             0 'Not Hispanic or Latino' 1 'Hispanic or Latino' /
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
   ALLOFNS   '-5' 'NA Window/Grp B Record' /
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
     BH006 (-6) /
     BH014 ('-6') /
     BH016 ('-6') /
     BH018 (-6) /
     BH020 (-6) /
     BH021 (-6) /
     BH024 (-6) /
     BH025 (-6) /
     BH028 (-6) /
     BH029 (-6) /
     BH032 (-6) /
     BH033 (-6) /
     BH036 (-6) /
     BH037 (-6) /
     BH039 (-6) /
     BH054 (-9) /
     BH055 (-9, -6) /
     BH056 (-9, -6) /
     BH057 (-9, -6) /
     BH058 (-9, -6) /
     BH059 (-6) /
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
     V5007 (-7) /
     V5008 (-7) /
     V5009 (-7) /
     V5011 (-7, -9) /
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
     V2020B1 (low thru -5) /
     V2020B2 (low thru -5) /
     V2020B3 (low thru -5) /
     V2020C1 (low thru -5) /
     V2020C2 (low thru -5) /
     V2020C3 (low thru -5) /
     V2020D1 (low thru -5) /
     V2020D2 (low thru -5) /
     V2020D3 (low thru -5) /
     V2020E1 (low thru -5) /
     V2020E2 (low thru -5) /
     V2020E3 (low thru -5) /
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
     V40061 (low thru -5) /
     V40062 (low thru -5) /
     V40063 (low thru -5) /
     V40071 (low thru -5) /
     V40072 (low thru -5) /
     V40073 (low thru -5) /
     V40081 (low thru -5) /
     V40082 (low thru -5) /
     V40083 (low thru -5) /
     V40091 (low thru -5) /
     V40092 (low thru -5) /
     V40093 (low thru -5) /
     V40101 (low thru -5) /
     V40102 (low thru -5) /
     V40103 (low thru -5) /
     V40111 (low thru -5) /
     V40112 (low thru -5) /
     V40113 (low thru -5) /
     V40121 (low thru -5) /
     V40122 (low thru -5) /
     V40123 (low thru -5) /
     V40131 (low thru -5) /
     V40132 (low thru -5) /
     V40133 (low thru -5) /
     V40141 (low thru -5) /
     V40142 (low thru -5) /
     V40143 (low thru -5) /
     V40151 (low thru -5) /
     V40152 (low thru -5) /
     V40153 (low thru -5) /
     V40161 (low thru -5) /
     V40162 (low thru -5) /
     V40163 (low thru -5) /
     V40171 (low thru -5) /
     V40172 (low thru -5) /
     V40173 (low thru -5) /
     V4017A1 (low thru -5) /
     V4017A2 (low thru -5) /
     V4017A3 (low thru -5) /
     V4017B1 (low thru -5) /
     V4017B2 (low thru -5) /
     V4017B3 (low thru -5) /
     V4017C1 ('-5','-6','-8') /
     V4017C2 ('-5','-6','-8') /
     V4017C3 ('-5','-6','-8') /
     V40181 (low thru -5.0) /
     V40182 (low thru -5.0) /
     V40183 (low thru -5.0) /
     V40191 (low thru -5) /
     V40192 (low thru -5) /
     V40193 (low thru -5) /
     V40201 (low thru -5) /
     V40202 (low thru -5) /
     V40203 (low thru -5) /
     V40211 (low thru -5) /
     V40212 (low thru -5) /
     V40213 (low thru -5) /
     V40221 (low thru -5) /
     V40222 (low thru -5) /
     V40223 (low thru -5) /
     V40231 (low thru -5) /
     V40232 (low thru -5) /
     V40233 (low thru -5) /
     V40241 (low thru -5) /
     V40242 (low thru -5) /
     V40243 (low thru -5) /
     V40251 (low thru -5) /
     V40252 (low thru -5) /
     V40253 (low thru -5) /
     V40261 (low thru -5) /
     V40262 (low thru -5) /
     V40263 (low thru -5) /
     V40271 (low thru -5) /
     V40272 (low thru -5) /
     V40273 (low thru -5) /
     V40281 (low thru -5) /
     V40282 (low thru -5) /
     V40283 (low thru -5) /
     V40291 (low thru -5) /
     V40292 (low thru -5) /
     V40293 (low thru -5) /
     V40301 (low thru -5) /
     V40302 (low thru -5) /
     V40303 (low thru -5) /
     V40311 (low thru -5) /
     V40312 (low thru -5) /
     V40313 (low thru -5) /
     V40321 (low thru -5) /
     V40322 (low thru -5) /
     V40323 (low thru -5) /
     V40331 (low thru -5) /
     V40332 (low thru -5) /
     V40333 (low thru -5) /
     V40341 (low thru -5) /
     V40342 (low thru -5) /
     V40343 (low thru -5) /
     V40351 (low thru -5) /
     V40352 (low thru -5) /
     V40353 (low thru -5) /
     V40361 (low thru -5) /
     V40362 (low thru -5) /
     V40363 (low thru -5) /
     V40371 (low thru -5) /
     V40372 (low thru -5) /
     V40373 (low thru -5) /
     V40381 (low thru -5) /
     V40382 (low thru -5) /
     V40383 (low thru -5) /
     V40391 (low thru -5) /
     V40392 (low thru -5) /
     V40393 (low thru -5) /
     V40401 (low thru -5) /
     V40402 (low thru -5) /
     V40403 (low thru -5) /
     V40411 (low thru -5) /
     V40412 (low thru -5) /
     V40413 (low thru -5) /
     V40421 (low thru -5) /
     V40422 (low thru -5) /
     V40423 (low thru -5) /
     V40431 (low thru -5) /
     V40432 (low thru -5) /
     V40433 (low thru -5) /
     V40441 (low thru -5) /
     V40442 (low thru -5) /
     V40443 (low thru -5) /
     V40451 (low thru -5) /
     V40452 (low thru -5) /
     V40453 (low thru -5) /
     V40461 (low thru -5) /
     V40462 (low thru -5) /
     V40463 (low thru -5) /
     V40471 (low thru -5) /
     V40472 (low thru -5) /
     V40473 (low thru -5) /
     V40481 (low thru -5) /
     V40482 (low thru -5) /
     V40483 (low thru -5) /
     V40491 (low thru -5) /
     V40492 (low thru -5) /
     V40493 (low thru -5) /
     V40501 (low thru -5) /
     V40502 (low thru -5) /
     V40503 (low thru -5) /
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
     ALLOFNS ('-5') /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   INCDATE
   RECSBH
   RECSADM
   RECSOFS
   RECSPRP
   RECSVIC
   RECSOFR
   RECSARR
   BH005
   BH006
   BH015
   BH018
   BH019
   BH020
   BH021
   BH022
   BH023
   BH024
   BH025
   BH026
   BH027
   BH028
   BH029
   BH030
   BH031
   BH032
   BH033
   BH034
   BH035
   BH036
   BH037
   BH038
   BH039
   BH040
   BH041
   BH054
   BH055
   BH056
   BH057
   BH058
   BH059
   V1007
   V1008
   V1009
   V1010
   V1011
   V1013
   V1014
   V1016
   V5007
   V5008
   V5009
   V5011
   V20062
   V20063
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
   V20202
   V20203
   V2020B1
   V2020B2
   V2020B3
   V2020C1
   V2020C2
   V2020C3
   V2020D1
   V2020D2
   V2020D3
   V2020E1
   V2020E2
   V2020E3
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
   V40172
   V40173
   V4017A1
   V4017A2
   V4017A3
   V4017B1
   V4017B2
   V4017B3
   V40181
   V40182
   V40183
   V40192
   V40193
   V40202
   V40203
   V40212
   V40213
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
   V60061
   V60062
   V60063
   V60081
   V60082
   V60083
   V60091
   V60092
   V60093
   V60101
   V60102
   V60103
   V60111
   V60112
   V60113
   V60121
   V60122
   V60123
   V60131
   V60132
   V60133
   V60141
   V60142
   V60143
   V60151
   V60152
   V60153
   V60161
   V60162
   V60163
   V60171
   V60172
   V60173
   V60181
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
   BH007
   BH008
   BH009
   BH010
   BH011
   BH012
   BH013
   BH014
   BH016
   BH017
   BH042
   BH043
   BH044
   BH045
   BH046
   BH047
   BH048
   BH049
   BH050
   BH051
   BH052
   BH053
   V1006
   V1012
   V5006
   V20061
   V20071
   V20111
   V20201
   V30061
   V30071
   V40071
   V40171
   V4017C1
   V4017C2
   V4017C3
   V40191
   V40201
   V40211
   V40221
   V60071
   V60072
   V60073
   ALLOFNS
    (nominal).

* SPSS FORMAT COMMAND.

FORMAT
    SEGMENT (A2) /
    STATE (F2.0) /
    ORI (A9) /
    INCNUM (A12) /
    INCDATE (F8.0) /
    RECSBH (F3.0) /
    RECSADM (F3.0) /
    RECSOFS (F3.0) /
    RECSPRP (F3.0) /
    RECSVIC (F3.0) /
    RECSOFR (F3.0) /
    RECSARR (F3.0) /
    BH005 (F8.0) /
    BH006 (F8.0) /
    BH007 (A30) /
    BH008 (A2) /
    BH009 (F2.0) /
    BH010 (F2.0) /
    BH011 (F2.0) /
    BH012 (F2.0) /
    BH013 (F2.0) /
    BH014 (A9) /
    BH015 (F4.0) /
    BH016 (A4) /
    BH017 (F2.0) /
    BH018 (F8.0) /
    BH019 (F9.0) /
    BH020 (F3.0) /
    BH021 (F3.0) /
    BH022 (F9.0) /
    BH023 (F9.0) /
    BH024 (F3.0) /
    BH025 (F3.0) /
    BH026 (F9.0) /
    BH027 (F9.0) /
    BH028 (F3.0) /
    BH029 (F3.0) /
    BH030 (F9.0) /
    BH031 (F9.0) /
    BH032 (F3.0) /
    BH033 (F3.0) /
    BH034 (F9.0) /
    BH035 (F9.0) /
    BH036 (F3.0) /
    BH037 (F3.0) /
    BH038 (F9.0) /
    BH039 (F2.0) /
    BH040 (F2.0) /
    BH041 (F4.0) /
    BH042 (F3.0) /
    BH043 (F3.0) /
    BH044 (F3.0) /
    BH045 (F3.0) /
    BH046 (F3.0) /
    BH047 (F3.0) /
    BH048 (F3.0) /
    BH049 (F3.0) /
    BH050 (F3.0) /
    BH051 (F3.0) /
    BH052 (F3.0) /
    BH053 (F3.0) /
    BH054 (F3.0) /
    BH055 (F3.0) /
    BH056 (F3.0) /
    BH057 (F3.0) /
    BH058 (F3.0) /
    BH059 (F8.0) /
    V1006 (F2.0) /
    V1007 (F2.0) /
    V1008 (F2.0) /
    V1009 (F3.0) /
    V1010 (F2.0) /
    V1011 (F2.0) /
    V1012 (A4) /
    V1013 (F2.0) /
    V1014 (F8.0) /
    V1016 (F2.0) /
    V5006 (F2.0) /
    V5007 (F2.0) /
    V5008 (F2.0) /
    V5009 (F2.0) /
    V5011 (F2.0) /
    V20061 (F3.0) /
    V20062 (F3.0) /
    V20063 (F3.0) /
    V20071 (F2.0) /
    V20072 (F2.0) /
    V20073 (F2.0) /
    V20081 (F2.0) /
    V20082 (F2.0) /
    V20083 (F2.0) /
    V20091 (F2.0) /
    V20092 (F2.0) /
    V20093 (F2.0) /
    V20101 (F2.0) /
    V20102 (F2.0) /
    V20103 (F2.0) /
    V20111 (F2.0) /
    V20112 (F2.0) /
    V20113 (F2.0) /
    V20121 (F2.0) /
    V20122 (F2.0) /
    V20123 (F2.0) /
    V20131 (F2.0) /
    V20132 (F2.0) /
    V20133 (F2.0) /
    V20141 (F2.0) /
    V20142 (F2.0) /
    V20143 (F2.0) /
    V20151 (F2.0) /
    V20152 (F2.0) /
    V20153 (F2.0) /
    V20161 (F2.0) /
    V20162 (F2.0) /
    V20163 (F2.0) /
    V20171 (F3.0) /
    V20172 (F3.0) /
    V20173 (F3.0) /
    V20181 (F3.0) /
    V20182 (F3.0) /
    V20183 (F3.0) /
    V20191 (F3.0) /
    V20192 (F3.0) /
    V20193 (F3.0) /
    V20201 (F2.0) /
    V20202 (F2.0) /
    V20203 (F2.0) /
    V2020B1 (F2.0) /
    V2020B2 (F2.0) /
    V2020B3 (F2.0) /
    V2020C1 (F2.0) /
    V2020C2 (F2.0) /
    V2020C3 (F2.0) /
    V2020D1 (F2.0) /
    V2020D2 (F2.0) /
    V2020D3 (F2.0) /
    V2020E1 (F2.0) /
    V2020E2 (F2.0) /
    V2020E3 (F2.0) /
    V30061 (F2.0) /
    V30062 (F2.0) /
    V30063 (F2.0) /
    V30071 (F2.0) /
    V30072 (F2.0) /
    V30073 (F2.0) /
    V30081 (F9.0) /
    V30082 (F9.0) /
    V30083 (F9.0) /
    V30091 (F8.0) /
    V30092 (F8.0) /
    V30093 (F8.0) /
    V30101 (F2.0) /
    V30102 (F2.0) /
    V30103 (F2.0) /
    V30111 (F2.0) /
    V30112 (F2.0) /
    V30113 (F2.0) /
    V30121 (F2.0) /
    V30122 (F2.0) /
    V30123 (F2.0) /
    V30131 (F9.0) /
    V30132 (F9.0) /
    V30133 (F9.0) /
    V30141 (F3.0) /
    V30142 (F3.0) /
    V30143 (F3.0) /
    V30151 (F2.0) /
    V30152 (F2.0) /
    V30153 (F2.0) /
    V30161 (F2.0) /
    V30162 (F2.0) /
    V30163 (F2.0) /
    V30171 (F9.0) /
    V30172 (F9.0) /
    V30173 (F9.0) /
    V30181 (F3.0) /
    V30182 (F3.0) /
    V30183 (F3.0) /
    V30191 (F2.0) /
    V30192 (F2.0) /
    V30193 (F2.0) /
    V30201 (F2.0) /
    V30202 (F2.0) /
    V30203 (F2.0) /
    V30211 (F9.0) /
    V30212 (F9.0) /
    V30213 (F9.0) /
    V30221 (F3.0) /
    V30222 (F3.0) /
    V30223 (F3.0) /
    V30231 (F2.0) /
    V30232 (F2.0) /
    V30233 (F2.0) /
    V40061 (F3.0) /
    V40062 (F3.0) /
    V40063 (F3.0) /
    V40071 (F3.0) /
    V40072 (F3.0) /
    V40073 (F3.0) /
    V40081 (F3.0) /
    V40082 (F3.0) /
    V40083 (F3.0) /
    V40091 (F3.0) /
    V40092 (F3.0) /
    V40093 (F3.0) /
    V40101 (F3.0) /
    V40102 (F3.0) /
    V40103 (F3.0) /
    V40111 (F3.0) /
    V40112 (F3.0) /
    V40113 (F3.0) /
    V40121 (F3.0) /
    V40122 (F3.0) /
    V40123 (F3.0) /
    V40131 (F3.0) /
    V40132 (F3.0) /
    V40133 (F3.0) /
    V40141 (F3.0) /
    V40142 (F3.0) /
    V40143 (F3.0) /
    V40151 (F3.0) /
    V40152 (F3.0) /
    V40153 (F3.0) /
    V40161 (F3.0) /
    V40162 (F3.0) /
    V40163 (F3.0) /
    V40171 (F2.0) /
    V40172 (F2.0) /
    V40173 (F2.0) /
    V4017A1 (F2.0) /
    V4017A2 (F2.0) /
    V4017A3 (F2.0) /
    V4017B1 (F2.0) /
    V4017B2 (F2.0) /
    V4017B3 (F2.0) /
    V4017C1 (A9) /
    V4017C2 (A9) /
    V4017C3 (A9) /
    V40181 (F4.1) /
    V40182 (F4.1) /
    V40183 (F4.1) /
    V40191 (F2.0) /
    V40192 (F2.0) /
    V40193 (F2.0) /
    V40201 (F2.0) /
    V40202 (F2.0) /
    V40203 (F2.0) /
    V40211 (F2.0) /
    V40212 (F2.0) /
    V40213 (F2.0) /
    V40221 (F2.0) /
    V40222 (F2.0) /
    V40223 (F2.0) /
    V40231 (F2.0) /
    V40232 (F2.0) /
    V40233 (F2.0) /
    V40241 (F2.0) /
    V40242 (F2.0) /
    V40243 (F2.0) /
    V40251 (F2.0) /
    V40252 (F2.0) /
    V40253 (F2.0) /
    V40261 (F2.0) /
    V40262 (F2.0) /
    V40263 (F2.0) /
    V40271 (F2.0) /
    V40272 (F2.0) /
    V40273 (F2.0) /
    V40281 (F2.0) /
    V40282 (F2.0) /
    V40283 (F2.0) /
    V40291 (F2.0) /
    V40292 (F2.0) /
    V40293 (F2.0) /
    V40301 (F2.0) /
    V40302 (F2.0) /
    V40303 (F2.0) /
    V40311 (F2.0) /
    V40312 (F2.0) /
    V40313 (F2.0) /
    V40321 (F2.0) /
    V40322 (F2.0) /
    V40323 (F2.0) /
    V40331 (F2.0) /
    V40332 (F2.0) /
    V40333 (F2.0) /
    V40341 (F2.0) /
    V40342 (F2.0) /
    V40343 (F2.0) /
    V40351 (F2.0) /
    V40352 (F2.0) /
    V40353 (F2.0) /
    V40361 (F2.0) /
    V40362 (F2.0) /
    V40363 (F2.0) /
    V40371 (F2.0) /
    V40372 (F2.0) /
    V40373 (F2.0) /
    V40381 (F2.0) /
    V40382 (F2.0) /
    V40383 (F2.0) /
    V40391 (F2.0) /
    V40392 (F2.0) /
    V40393 (F2.0) /
    V40401 (F2.0) /
    V40402 (F2.0) /
    V40403 (F2.0) /
    V40411 (F2.0) /
    V40412 (F2.0) /
    V40413 (F2.0) /
    V40421 (F2.0) /
    V40422 (F2.0) /
    V40423 (F2.0) /
    V40431 (F2.0) /
    V40432 (F2.0) /
    V40433 (F2.0) /
    V40441 (F2.0) /
    V40442 (F2.0) /
    V40443 (F2.0) /
    V40451 (F2.0) /
    V40452 (F2.0) /
    V40453 (F2.0) /
    V40461 (F2.0) /
    V40462 (F2.0) /
    V40463 (F2.0) /
    V40471 (F2.0) /
    V40472 (F2.0) /
    V40473 (F2.0) /
    V40481 (F2.0) /
    V40482 (F2.0) /
    V40483 (F2.0) /
    V40491 (F2.0) /
    V40492 (F2.0) /
    V40493 (F2.0) /
    V40501 (F2.0) /
    V40502 (F2.0) /
    V40503 (F2.0) /
    V60061 (F2.0) /
    V60062 (F2.0) /
    V60063 (F2.0) /
    V60071 (A12) /
    V60072 (A12) /
    V60073 (A12) /
    V60081 (F8.0) /
    V60082 (F8.0) /
    V60083 (F8.0) /
    V60091 (F2.0) /
    V60092 (F2.0) /
    V60093 (F2.0) /
    V60101 (F2.0) /
    V60102 (F2.0) /
    V60103 (F2.0) /
    V60111 (F3.0) /
    V60112 (F3.0) /
    V60113 (F3.0) /
    V60121 (F3.0) /
    V60122 (F3.0) /
    V60123 (F3.0) /
    V60131 (F3.0) /
    V60132 (F3.0) /
    V60133 (F3.0) /
    V60141 (F2.0) /
    V60142 (F2.0) /
    V60143 (F2.0) /
    V60151 (F2.0) /
    V60152 (F2.0) /
    V60153 (F2.0) /
    V60161 (F2.0) /
    V60162 (F2.0) /
    V60163 (F2.0) /
    V60171 (F2.0) /
    V60172 (F2.0) /
    V60173 (F2.0) /
    V60181 (F2.0) /
    V60182 (F2.0) /
    V60183 (F2.0) /
    V60191 (F2.0) /
    V60192 (F2.0) /
    V60193 (F2.0) /
    ALLOFNS (A40) /

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
