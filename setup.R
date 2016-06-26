# download the file from the given url
# record the download date, store the date and url as RData for future loading
urluci <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urluci, destfile = "UCIHARDataset.zip"); downloaddate <- Sys.Date()
save(urluci, downloaddate, file = "download.RData")
# load("download.RData", verbose = TRUE)

# extract the contents to the same folder
unzip("UCIHARDataset.zip")
file.rename("UCI HAR Dataset", "ucihar")
# All data is now stored under the "ucihar" folder
# Filepaths for files will begin with "./ucihar/..."
