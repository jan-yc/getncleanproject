# getncleanproject
Course Project for JHU's Getting and Cleaning Data course

### Contents
The following files can be found in this repository:

* **README.md**: Explanation of how the script(s) work.
* **setup.R**: R script for downloading and extracting the data into the working directory
* **run_analysis.R**: R script for cleaning the data to produce the desired tidy data set
* **Codebook.md**: Description of the data-cleaning process, and the variable names in the resulting data.

### How to use the R scripts

1. If you do not have the Samsung data folder in your working directory, run **setup.R** to download and extract the zip file to a folder that will be named "ucihar". The script also saves the download date and url to a separate .RData file for future reference.

2. Run **run_analysis.R** to transform the data in order to produce the tidy data set that will be written to a text file named **summary.txt**. 
  * To view the tidy data set within R itself, use the command View(meandata) after the script has been completed.
