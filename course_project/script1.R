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

###### Remove measurement columns which are not associated with the mean and standard deviation ######
  colsList <- grep("mean|std", value = TRUE, colnames(fullDF))
  colsList2 <- c(colnames(fullDF)[1:3], colsList)
  modDF <- fullDF[,colnames(fullDF)%in%colsList2]

###### Calculate the average of each variable for each activity and each subject ######
  ### Create an array of distinct subject_IDs ###
  distinctSubject <- sort(unique(modDF$subject_ID))
  
  ### Create an array of distinct activities
  distinctActivity <- sort(unique(modDF$activity_code))
  
  ### Create an array of measurement column names ###
  dfColNames <- colnames(modDF)[4:length(colnames(modDF))]
  
  ### Calculate the average of the activity columns by subject_ID and activity code ###
  avgValsDF <- data.frame()
  for(i in 1:length(distinctSubject)){
    tempDF1 <- subset(modDF, modDF$subject_ID == distinctSubject[i])
    for(j in 1:length(distinctActivity)){
      tempDF2 <- subset(tempDF1, tempDF1$activity_code == distinctActivity[j])
      meanList1 <- list()
      for(k in 1:length(dfColNames)){
        meanColVal <- mean(tempDF2[[dfColNames[k]]])
        meanList1 <- c(meanList1, meanColVal)
      }
      meanList2 <- c(distinctSubject[i], distinctActivity[j], meanList1)
      avgValsDF <- rbind(avgValsDF, meanList2)
    }
  }
  
  ### Adding back the activity descriptions and creating the final dataframe ###
  colnames(avgValsDF) <- c("subject_ID", "activity_code", dfColNames)
  activityTempDF <- data.frame(subject_ID = avgValsDF$subject_ID, activity_code = avgValsDF$activity_code, activity = activityLabels[match(avgValsDF$activity_code, activityLabels$activity_code), 2])
  finalDF <- cbind(activityTempDF, avgValsDF[,3:ncol(avgValsDF)])
  
  
  
  
  