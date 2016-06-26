## Steps for modifying the data

Additional packages required: **dplyr**

1. Read the file "./ucihar/features.txt" as a data frame, extract the second column and assign it as a character vector named **features**. This is a vector of feature names to be used as column variables for the data.
2. Read the file "./ucihar/activity_labels.txt" as a data frame, extract the second column and assign it as a character vector named **action**. This is a vector of activity names to replace the numbered activity labels.
3. Read the file "./ucihar/train/subject_train.txt" as a data frame, extract the first (only) column and assign it as a factor object named **trainsubj**. This contains the identifiers for the subjects carrying out the experiment.
4. Read the file "./ucihar/train/Y_train.txt" as a table, extract the first (only) column and assign it as a factor object named **trainact**. This contains the numbered activity labels.
5. Assign **action** as the levels of **trainact**, such that the labels are now:
  * 1 – walking; 2 – walking_upstairs; 3 – walking_downstairs; 4 – sitting; 5 – standing; 6 – laying
6. Read the file "./ucihar/train/X_train.txt" and assign it as a data frame named **traindata**. The data frame should have 7352 rows and 561 columns.
7. Insert to the left of **traindata**, the **trainsubj** and **trainact** vectors as two separate columns.
8. Label the columns of **traindata** as follows: "subject", "activity", followed by the **features** vector. The data frame should now have 7352 rows and 563 columns.
9. Repeat steps 3 to 8 for the files in the ".uci/char/test" folder, to construct a similar data frame named **testdata**. It  should have 2947 rows and 563 columns.
10. Combine the two data frames into a new data frame named **alldata**, with 10299 rows and 563 columns. 
  * The objects **testdata** and **traindata** can be removed.
  * The subject and activity columns are factors, while all feature columns are numeric.
11. From **features**, extract all feature names that refer to the mean and standard deviation of each of the 33 measurements, and assign it to a new vector named **meanstd**. It should contain 66 feature names.
12. From **alldata**, extract the subject & activity columns, and all feature columns whose names can be found in the **meanstd** vector (i.e. all feature columns that represent mean or standard deviation values)
13. Convert the resulting table into a "tbl_df" class object named **trimdata**. It should have 10299 rows and 68 columns.
14. From the **dplyr** package, use the group_by function to group trimdata by the subject, then by the activity columns.
15. Use the summarise_each function to calculate the mean values for each feature per activity per subject. Assign the result to a data frame named **meandata**. It should have 180 rows (6 activities, performed by 30 subjects) and 68 columns.
16. Write **meandata** as a text file named "summary.txt".



## Variables of Summarized Data (summary.txt)

| Column Name / Variable      | Units | Description                                                                                   |
|-----------------------------|-------|-----------------------------------------------------------------------------------------------|
| subject                     | None  | Subject ID (1 to 30)                                                                          |
| activity                    | None  | Activity Performed (walking, walking_upstairs, walking_downstairs, sitting, standing, laying) |
| tBodyAcc-mean()-X           | g     | Mean of the time-domain body acceleration along the X axis                                    |
| tBodyAcc-mean()-Y           | g     | Mean of the time-domain body acceleration along the Y axis                                    |
| tBodyAcc-mean()-Z           | g     | Mean of the time-domain body acceleration along the Z axis                                    |
| tBodyAcc-std()-X            | g     | Standard deviation of the time-domain body acceleration along the X axis                      |
| tBodyAcc-std()-Y            | g     | Standard deviation of the time-domain body acceleration along the Y axis                      |
| tBodyAcc-std()-Z            | g     | Standard deviation of the time-domain body acceleration along the Z axis                      |
| tGravityAcc-mean()-X        | g     | Mean of the time-domain gravity acceleration along the X axis                                 |
| tGravityAcc-mean()-Y        | g     | Mean of the time-domain gravity acceleration along the Y axis                                 |
| tGravityAcc-mean()-Z        | g     | Mean of the time-domain gravity acceleration along the Z axis                                 |
| tGravityAcc-std()-X         | g     | Standard deviation of the time-domain gravity acceleration along the X axis                   |
| tGravityAcc-std()-Y         | g     | Standard deviation of the time-domain gravity acceleration along the Y axis                   |
| tGravityAcc-std()-Z         | g     | Standard deviation of the time-domain gravity acceleration along the Z axis                   |
| tBodyAccJerk-mean()-X       | g     | Mean of the time-domain body jerk along the X axis                                            |
| tBodyAccJerk-mean()-Y       | g     | Mean of the time-domain body jerk along the Y axis                                            |
| tBodyAccJerk-mean()-Z       | g     | Mean of the time-domain body jerk along the Z axis                                            |
| tBodyAccJerk-std()-X        | g     | Standard deviation of the time-domain body jerk along the X axis                              |
| tBodyAccJerk-std()-Y        | g     | Standard deviation of the time-domain body jerk along the Y axis                              |
| tBodyAccJerk-std()-Z        | g     | Standard deviation of the time-domain body jerk along the Z axis                              |
| tBodyGyro-mean()-X          | rad/s | Mean of the time-domain angular acceleration around the X axis                                |
| tBodyGyro-mean()-Y          | rad/s | Mean of the time-domain angular acceleration around the Y axis                                |
| tBodyGyro-mean()-Z          | rad/s | Mean of the time-domain angular acceleration around the Z axis                                |
| tBodyGyro-std()-X           | rad/s | Standard deviation of the time-domain angular acceleration around the X axis                  |
| tBodyGyro-std()-Y           | rad/s | Standard deviation of the time-domain angular acceleration around the Y axis                  |
| tBodyGyro-std()-Z           | rad/s | Standard deviation of the time-domain angular acceleration around the Z axis                  |
| tBodyGyroJerk-mean()-X      | rad/s | Mean of the time-domain angular jerk around the X axis                                        |
| tBodyGyroJerk-mean()-Y      | rad/s | Mean of the time-domain angular jerk around the Y axis                                        |
| tBodyGyroJerk-mean()-Z      | rad/s | Mean of the time-domain angular jerk around the Z axis                                        |
| tBodyGyroJerk-std()-X       | rad/s | Standard deviation of the time-domain angular jerk around the X axis                          |
| tBodyGyroJerk-std()-Y       | rad/s | Standard deviation of the time-domain angular jerk around the Y axis                          |
| tBodyGyroJerk-std()-Z       | rad/s | Standard deviation of the time-domain angular jerk around the Z axis                          |
| tBodyAccMag-mean()          | g     | Mean of the 3D magnitude time-domain body acceleration                                        |
| tBodyAccMag-std()           | g     | Standard deviation of the 3D magnitude time-domain body acceleration                          |
| tGravityAccMag-mean()       | g     | Mean of the 3D magnitude time-domain gravity acceleration                                     |
| tGravityAccMag-std()        | g     | Standard deviation of the 3D magnitude of time-domain gravity acceleration                    |
| tBodyAccJerkMag-mean()      | g     | Mean of the 3D magnitude time-domain body jerk                                                |
| tBodyAccJerkMag-std()       | g     | Standard deviation of the 3D magnitude time-domain body jerk                                  |
| tBodyGyroMag-mean()         | rad/s | Mean of the 3D magnitude time-domain angular acceleration                                     |
| tBodyGyroMag-std()          | rad/s | Standard deviation of the 3D magnitude time-domain angular acceleration                       |
| tBodyGyroJerkMag-mean()     | rad/s | Mean of the 3D magnitude time-domain angular jerk                                             |
| tBodyGyroJerkMag-std()      | rad/s | Standard deviation of the 3D magnitude time-domain angular jerk                               |
| fBodyAcc-mean()-X           | g     | Mean of the frequency-domain body acceleration along the X axis                               |
| fBodyAcc-mean()-Y           | g     | Mean of the frequency-domain body acceleration along the Y axis                               |
| fBodyAcc-mean()-Z           | g     | Mean of the frequency-domain body acceleration along the Z axis                               |
| fBodyAcc-std()-X            | g     | Standard deviation of the frequency-domain body acceleration along the X axis                 |
| fBodyAcc-std()-Y            | g     | Standard deviation of the frequency-domain body acceleration along the Y axis                 |
| fBodyAcc-std()-Z            | g     | Standard deviation of the frequency-domain body acceleration along the Z axis                 |
| fBodyAccJerk-mean()-X       | g     | Mean of the frequency-domain body acceleration along the X axis                               |
| fBodyAccJerk-mean()-Y       | g     | Mean of the frequency-domain body acceleration along the Y axis                               |
| fBodyAccJerk-mean()-Z       | g     | Mean of the frequency-domain body acceleration along the Z axis                               |
| fBodyAccJerk-std()-X        | g     | Standard deviation of the frequency-domain body acceleration along the X axis                 |
| fBodyAccJerk-std()-Y        | g     | Standard deviation of the frequency-domain body acceleration along the Y axis                 |
| fBodyAccJerk-std()-Z        | g     | Standard deviation of the frequency-domain body acceleration along the Z axis                 |
| fBodyGyro-mean()-X          | rad/s | Mean of the frequency-domain angular acceleration around the X axis                           |
| fBodyGyro-mean()-Y          | rad/s | Mean of the frequency-domain angular acceleration around the Y axis                           |
| fBodyGyro-mean()-Z          | rad/s | Mean of the frequency-domain angular acceleration around the Z axis                           |
| fBodyGyro-std()-X           | rad/s | Standard deviation of the frequency-domain angular acceleration around the X axis             |
| fBodyGyro-std()-Y           | rad/s | Standard deviation of the frequency-domain angular acceleration around the Y axis             |
| fBodyGyro-std()-Z           | rad/s | Standard deviation of the frequency-domain angular acceleration around the Z axis             |
| fBodyAccMag-mean()          | g     | Mean of the 3D magnitude frequency-domain body acceleration                                   |
| fBodyAccMag-std()           | g     | Standard deviation of the 3D magnitude frequency-domain body acceleration                     |
| fBodyBodyAccJerkMag-mean()  | g     | Mean of the 3D magnitude frequency-domain body jerk                                           |
| fBodyBodyAccJerkMag-std()   | g     | Standard deviation of the 3D magnitude frequency-domain body jerk                             |
| fBodyBodyGyroMag-mean()     | rad/s | Mean of the 3D magnitude frequency-domain angular acceleration                                |
| fBodyBodyGyroMag-std()      | rad/s | Standard deviation of the 3D magnitude frequency-domain angular acceleration                  |
| fBodyBodyGyroJerkMag-mean() | rad/s | Mean of the 3D magnitude frequency-domain angular jerk                                        |
| fBodyBodyGyroJerkMag-std()  | rad/s | Standard deviation of the 3D magnitude frequency-domain angular jerk                          |
