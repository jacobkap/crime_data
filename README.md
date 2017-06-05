To download the files please use the Dropbox link. The cleaned files are in the "clean\_data" folder. The raw data I used (from ICPSR) to create the datasets are also on Dropbox in the "raw\_data" folder. The code used to create the cleaned files are in the "R\_code" folder. [Dropbox link](https://www.dropbox.com/sh/9jy8ds057h7m00d/AACC082n_hahaKooNnxuJBs7a?dl=0)

This will be an ongoing process to create a single dataset for research related to crime. Thank you to Daniel Goldberg for assistance with this project. The single data is called "master\_crime". The datasets currently included here are:

1.  ucr\_offenses\_clearances - [UCR Offenses Known and Clearances by Arrest 1960-2015](http://www.icpsr.umich.edu/icpsrweb/NACJD/series/57)

    This dataset contains:
    -   Yearly counts for crimes committed (aggregated from monthly count)
    -   Yearly counts for crimes cleared (aggregated from monthly count)
    -   WARNING: The UCR does not differentiate between true zeroes (no crime committed) and missing value zeroes. All missing values are labeled as a 0.

2.  ucr\_police\_employee\_leoka - [UCR Police Employee (LEOKA) 1975-2015](http://www.icpsr.umich.edu/icpsrweb/NACJD/series/57)

    This dataset contains:
    -   The number of male/female officers and civilian employees
    -   Number of male/female officers per 1,000 population
    -   Number of total officers per 1,000 population
    -   Number of total civilian employees per 1,000 population

3.  ucr\_supplementary\_homicide\_report - [UCR Supplementary Homicide Reports 1975-2015](https://www.openicpsr.org/openicpsr/project/100699/version/V1/view)

    This dataset contains:
    -   Details on homicide victims, offenders, and circumstances
    -   Age, race, and gender of homicide victims
    -   Age, race, and gender of homicide offenders
    -   Relationship between victim and offender
    -   Circumstances of the homicide
    -   Weapon used

If you have any questions, find any bugs, or have any data to offer, my email is <jacobkap@sas.upenn.edu>.
