---
output: html_document
---
  ---
  title: Getting and Cleaning Data Course Project
  output: html_document
  ---

#Getting and Cleaning Data Course Project

##Project Description and Source:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##EDA
The data comes in several different files which need to be joined together into a single dataframe. Following is a description of what the files are and how they are joined:

* The data comes in several different files:
** The data consist of a test and a train dataset.  Both the test and train datasets need to be combined to form a full dataset.
***  The train dataset representd 30% of the sample population, while the test dataset represents 70% of the sample population.
***  The test and train datasets contain the same number of variables, and the same variable dimensions.  The only difference is the size of the datasets.
*** The test/train datasets consist of files which display the activity measurements (X_test/train.txt), the codes for the activities which were measured (y_test/train.txt), and the subject codes for the subjects performing the activities (subject_test/train.txt).
*** There are also inertial signals for each test/train dataset, but these were not used since the project calls for only mean and standard deviation measurements to be used.

**  There are also files whose attributes apply to the sample population as a whole
*** These files exist irrespective of test/train datasets and can be applied to both
*** These files are the descriptions of the activies (activity_labels.txt), and the measurement variable names (features.txt).

* The data was joined in the train dataset first, then separately in the test dataset.
**  Data from the X_train.txt file was merged with the subject_train.txt file and the y_train.txt file.
**  The dataset was then matched up with the activity_labels.txt file to descriptively label each activity code.
**  The subject code derived from the subject_train.txt file was given the column label "subject_ID".
**  The activity code derived from the y_train.txt file was given the column lable "activty_code".
**  The activity description derived from the activity_labels.txt file was given the column label "activity".
**  The measurement column names were derived from the file features.txt

* The test dataset was joined following the same steps as the train dataset above.
* The test and train datasets were then joined together to form the full sample dataset.
**  There were a total of 564 columns and 10299 rows

* All activity columns that did not deal with the mean or standard deviation of a measurement were then removed 
**  Once the unused columns had been removed, there were 82 total columns remaining
**  The activity columns were then averaged per subject per measured activity and saved into a separate data frame and presented.


