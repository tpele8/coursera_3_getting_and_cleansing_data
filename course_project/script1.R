###### Clearing workspace ######
  rm(list=ls())
  cat("\014")
################################
  
###### Reading in files which are independent of test/train datasets ######
  features <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/features.txt")
  activityLabels <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/activity_labels.txt")
  colnames(activityLabels) <- c("activity_code", "activity")
  
###### Working on the test dataset ######
  ### Reading in the files ###
  xTestDF <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/test/X_test.txt")
  xTestColnames <- t(features[,2])
  colnames(xTestDF) <- xTestColnames
  
  yTest <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/test/y_test.txt")
  colnames(yTest) <- c("activity_code")   
  yTestDF <- data.frame(activity_code = yTest$activity_code, activity = activityLabels[match(yTest$activity_code, activityLabels$activity_code), 2])

  head(yTestDF)
  subjectTestDF <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/test/subject_test.txt")
  colnames(subjectTestDF) <- c("subject_ID")
  
  fullTestDF <- cbind(subjectTestDF, yTestDF, xTestDF)

###### Working on the train dataset ######
  ### Reading in the files ###
  xTrainDF <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/train/X_train.txt")
  xTrainColnames <- t(features[,2])
  colnames(xTrainDF) <- xTrainColnames
  
  yTrain <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/train/y_train.txt")
  colnames(yTrain) <- c("activity_code")   
  yTrainDF <- data.frame(activity_code = yTrain$activity_code, activity = activityLabels[match(yTrain$activity_code, activityLabels$activity_code), 2])
  
  subjectTrainDF <- read.table("/Users/i64425/Documents/Coursera/03 - Getting and Cleansing Data/Course Project/UCI HAR Dataset/train/subject_train.txt")
  colnames(subjectTrainDF) <- c("subject_ID")
  
  fullTrainDF <- cbind(subjectTrainDF, yTrainDF, xTrainDF)

###### Combine test and train datasets ######
  fullDF <- rbind(fullTestDF, fullTrainDF)
