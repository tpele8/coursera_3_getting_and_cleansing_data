---
output: html_document
---
  ---
  title: Getting and Cleaning Data Course Project
  output: html_document
  ---
  
#Getting and Cleaning Data Course Project

##Data Source
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##Code Book:

### Files and Descriptions:
For the purposes of this project, the following files were used:
*	X_test.txt
-	This file contains the measurements for the activities in the test dataset
*	X_train.txt
-	This file contains the measurements for the activities in the train dataset
*	subject_test.txt
-	This file contains the codes for the corresponding subjects who were included in the test dataset
*	subject_train.txt
-	This file contains the codes for the corresponding subjects who were included in the train dataset
*	y_test.txt
-	This file contains the activity codes that each subject performed for measurement in the test dataset
*	y_train.txt
-	This file contains the activity codes that each subject performed for measurement in the train dataset
*	activity_labels.txt
-	This file contains the descriptions of each activity corresponding to the activity codes in the y_test.txt and y_train.txt files
*	features.txt
-	This file contains the names of each activity measured and recorded in the X_test.txt and X_train.txt files

###Dataset attributes
*	The entire dataset contains 564 columns (attributes) with 10299 observations (rows)

*	The subset of attributes contains 82 columns (attributes)

###Analysis
Following are the steps to analysis of this data
####Train Data
*	Read X_train.txt, join the dataset with the features.txt dataset to create a dataset with column names
*	Join the y_train.txt dataset
*	Match the activity codes of the y_train.txt file with the descriptions in the activity_labels.txt file and add those to the dataset
*	This introduces three new tidy columns to the X_train.txt dataset
-	subject_ID (integer)
-	activity_code(integer)
-	activity (string)

###Test Data
*	Do the same for the test data as was done for the train data

####Joining and subsetting datasets 
*	Join the test and train datasets
*	Subset the datasets by removing all columns (attributes) that do not contain mean or standard deviation data
*	Rename the columns with their appropriate attribute names
*	Create a new dataset and store the average values for each attribute per subject per activity
*	Write the data to a file.

###Attributes
Following are the attributes of the final tidy dataset
*	subject_ID
*	activity_code
*	activity
*	tBodyAcc-mean()-X
*	tBodyAcc-mean()-Y
*	tBodyAcc-mean()-Z
*	tBodyAcc-std()-X
*	tBodyAcc-std()-Y
*	tBodyAcc-std()-Z
*	tGravityAcc-mean()-X
*	tGravityAcc-mean()-Y
*	tGravityAcc-mean()-Z
*	tGravityAcc-std()-X
*	tGravityAcc-std()-Y
*	tGravityAcc-std()-Z
*	tBodyAccJerk-mean()-X
*	tBodyAccJerk-mean()-Y
*	tBodyAccJerk-mean()-Z
*	tBodyAccJerk-std()-X
*	tBodyAccJerk-std()-Y
*	tBodyAccJerk-std()-Z
*	tBodyGyro-mean()-X
*	tBodyGyro-mean()-Y
*	tBodyGyro-mean()-Z
*	tBodyGyro-std()-X
*	tBodyGyro-std()-Y
*	tBodyGyro-std()-Z
*	tBodyGyroJerk-mean()-X
*	tBodyGyroJerk-mean()-Y
*	tBodyGyroJerk-mean()-Z
*	tBodyGyroJerk-std()-X
*	tBodyGyroJerk-std()-Y
*	tBodyGyroJerk-std()-Z
*	tBodyAccMag-mean()
*	tBodyAccMag-std()
*	tGravityAccMag-mean()
*	tGravityAccMag-std()
*	tBodyAccJerkMag-mean()
*	tBodyAccJerkMag-std()
*	tBodyGyroMag-mean()
*	tBodyGyroMag-std()
*	tBodyGyroJerkMag-mean()
*	tBodyGyroJerkMag-std()
*	fBodyAcc-mean()-X
*	fBodyAcc-mean()-Y
*	fBodyAcc-mean()-Z
*	fBodyAcc-std()-X
*	fBodyAcc-std()-Y
*	fBodyAcc-std()-Z
*	fBodyAcc-meanFreq()-X
*	fBodyAcc-meanFreq()-Y
*	fBodyAcc-meanFreq()-Z
*	fBodyAccJerk-mean()-X
*	fBodyAccJerk-mean()-Y
*	fBodyAccJerk-mean()-Z
*	fBodyAccJerk-std()-X
*	fBodyAccJerk-std()-Y
*	fBodyAccJerk-std()-Z
*	fBodyAccJerk-meanFreq()-X
*	fBodyAccJerk-meanFreq()-Y
*	fBodyAccJerk-meanFreq()-Z
*	fBodyGyro-mean()-X
*	fBodyGyro-mean()-Y
*	fBodyGyro-mean()-Z
*	fBodyGyro-std()-X
*	fBodyGyro-std()-Y
*	fBodyGyro-std()-Z
*	fBodyGyro-meanFreq()-X
*	fBodyGyro-meanFreq()-Y
*	fBodyGyro-meanFreq()-Z
*	fBodyAccMag-mean()
*	fBodyAccMag-std()
*	fBodyAccMag-meanFreq()
*	fBodyBodyAccJerkMag-mean()
*	fBodyBodyAccJerkMag-std()
*	fBodyBodyAccJerkMag-meanFreq()
*	fBodyBodyGyroMag-mean()
*	fBodyBodyGyroMag-std()
*	fBodyBodyGyroMag-meanFreq()
*	fBodyBodyGyroJerkMag-mean()
*	fBodyBodyGyroJerkMag-std()
*	fBodyBodyGyroJerkMag-meanFreq()