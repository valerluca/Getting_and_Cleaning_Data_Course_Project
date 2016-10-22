# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set using R. The outcome is to calulate the mean and the standard deviations of Data Collected from subjects wearing a smartphone and performing various activities.

##Data used for the analysis

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The raw data used here represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#In this repo you will find:

* CodeBook.md: describes the variables, the data, and any transformations or work that you performed to clean up the data
* runAnalysis.R: the R scrip itself
* tidydata.txt: the output of the runAnalysis.R

The script completes the following:

* Loads necessary packages to run the script
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Creates a tidy data set with the average of each variable for each activity and each subject.



In order to run the script, you must first download the Human Activity Recognition Using Smartphones Data Set from this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Prior to run the script you should::

* Download the zip file of the data set
* Move the zip file to the appropriate directory
* Un-zip the file
* Move the run_analysis.R script to the same directory that you un-zipped the file.

  

# Script


## 1 Merges the training and the test sets to create one data set.

* load library needed 
library(plyr)   load library needed 

* Set working directory
setwd("~/UCI HAR Dataset")   

* Read in the data from files and assign columns names: features.txt, activity_labels.txt, subject_train.txt, x_train.txt, y_train.txt, subject_test.txt, x_test.txt, y_test.txt
features     = read.table("features.txt",header=FALSE) 
activityLabels = read.table("activity_labels.txt",col.names = c("ActivityId", "Activity"))

* train data
subjectTrain = read.table("./train/subject_train.txt",col.names = "SubjectId") 
xTrain       = read.table("./train/x_train.txt",col.names = features[,2],check.names=FALSE)  
yTrain       = read.table("./train/y_train.txt",col.names = "ActivityId") 

* test data
subjectTest = read.table("./test/subject_test.txt",col.names = "SubjectId")   
xTest       = read.table("./test/x_test.txt",col.names = features[,2],check.names=FALSE) 
yTest       = read.table("./test/y_test.txt",col.names = "ActivityId")  

* Create the final train and test dataset by merging yTrain, subjectTrain, and xTrain / yTest, subjectTrain, and xTest 
FullTrainData = cbind(yTrain,subjectTrain,xTrain)
FullTestData = cbind(yTest,subjectTest,xTest)

* Combine test and train datasets to create a master data
UCI_HAR_Dataset = cbind(yTest,subjectTest,xTest)

## 2 Extracts only the measurements on the mean and standard deviation for each measurement.
UCI_HAR_Dataset_measurements <- UCI_HAR_Dataset[,grepl("mean|std|Subject|ActivityId", names(UCI_HAR_Dataset))]

## 3 Uses descriptive activity names to name the activities in the data set.
UCI_HAR_Dataset_activities = merge(UCI_HAR_Dataset_measurements,activityLabels,by='ActivityId',all.x=TRUE)

## 4 Appropriately labels the data set with descriptive variable names.

* remove parentheses
names(UCI_HAR_Dataset_activities) <- gsub("\\()","",names(UCI_HAR_Dataset_activities))        

* relabel means   
names(UCI_HAR_Dataset_activities) <- gsub("-mean","Mean",names(UCI_HAR_Dataset_activities))                       

* relabel standard deviation 
names(UCI_HAR_Dataset_activities) <- gsub("-std$","StdDev",names(UCI_HAR_Dataset_activities))                     

* relabel Acceleration
names(UCI_HAR_Dataset_activities) <- gsub('Acc',"Acceleration",names(UCI_HAR_Dataset_activities))                  

* relabel AngularAcceleration
names(UCI_HAR_Dataset_activities) <- gsub('GyroJerk',"AngularAcceleration",names(UCI_HAR_Dataset_activities))      

* relabel AngularSpeed 
names(UCI_HAR_Dataset_activities) <- gsub('Gyro',"AngularSpeed",names(UCI_HAR_Dataset_activities))                 

* relabel Magnitude
names(UCI_HAR_Dataset_activities) <- gsub('Mag',"Magnitude",names(UCI_HAR_Dataset_activities))                     

* relabel FrequencyDomain
names(UCI_HAR_Dataset_activities) <- gsub('^f',"FrequencyDomain.",names(UCI_HAR_Dataset_activities))               

* relabel Frequency
names(UCI_HAR_Dataset_activities) <- gsub(("Freq\\."),"Frequency.",names(UCI_HAR_Dataset_activities))              

* relabel TimeDomain  
names(UCI_HAR_Dataset_activities) <- gsub('^t',"TimeDomain.",names(UCI_HAR_Dataset_activities))                    

## 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

UCI_HAR_Dataset_avg <-aggregate(. ~SubjectId + Activity, UCI_HAR_Dataset_activities, mean)
UCI_HAR_Dataset_avg <- UCI_HAR_Dataset_avg [order(UCI_HAR_Dataset_avg $SubjectId, UCI_HAR_Dataset_avg $Activity),]

## Write a text file
write.table(UCI_HAR_Dataset_avg, file = "tidydata.txt",row.name=FALSE)


