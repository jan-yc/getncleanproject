library(dplyr)

# extracts a vector of feature names and a vector of activities
features <- as.character(read.table("./ucihar/features.txt", sep=" ")$V2)
action <- tolower(as.character(read.table("./ucihar/activity_labels.txt")$V2))

trainsubj <- as.factor(read.table("./ucihar/train/subject_train.txt")$V1)
trainact <- as.factor(read.table("./ucihar/train/Y_train.txt")$V1)
# 3. Uses descriptive activity names to name the activities in the data set.
levels(trainact) <- action
traindata <- read.table("./ucihar/train/X_train.txt")
traindata <- cbind(trainsubj, trainact, traindata)
# 4.	Appropriately labels the data set with descriptive variable names.
names(traindata) <- c("subject", "activity", features)

# repeat for test data
testsubj <- as.factor(read.table("./ucihar/test/subject_test.txt")$V1)
testact <- as.factor(read.table("./ucihar/test/Y_test.txt")$V1)
levels(testact) <- action
testdata <- read.table("./ucihar/test/X_test.txt")
testdata <- cbind(testsubj, testact, testdata)
names(testdata) <- c("subject", "activity", features)

# 1. Merges the training and the test sets to create one data set.
alldata <- rbind(traindata, testdata); rm(traindata, testdata)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanstd <- grep("mean\\(|std", features, value = TRUE)
trimdata <- tbl_df(
      alldata[, colnames(alldata) %in% c("subject", "activity", meanstd)]
      ) 

# 5.	From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
trimdata <- group_by(trimdata, subject, activity)
meandata <- summarise_each(trimdata, funs(mean)) 

# 6.	Please upload the tidy data set created in step 5 of the instructions. 
write.table(meandata, file = "summary.txt", row.names = FALSE)

# Use View(meandata) to view the tidy data within R.
