

========================================================================================================================

## Getting and Cleaning Data Course Project
## runAnalysis.r File Description:

## Based on the  UCI HAR Dataset downloaded available at
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## the following script will:
## 1 Merges the training and the test sets to create one data set.
## 2 Extracts only the measurements on the mean and standard deviation for each measurement.
## 3 Uses descriptive activity names to name the activities in the data set.
## 4 Appropriately labels the data set with descriptive variable names.
## 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

========================================================================================================================
## 1 Merges the training and the test sets to create one data set.


library(plyr)  ## load library
 

setwd("~/UCI HAR Dataset")  ## Set working directory 

####### Read in the data from files and assign columns names: features.txt, activity_labels.txt, subject_train.txt, x_train.txt, y_train.txt, subject_test.txt, x_test.txt, y_test.txt

features     = read.table("features.txt",header=FALSE) 
activityLabels = read.table("activity_labels.txt",col.names = c("ActivityId", "Activity"))

## train data
subjectTrain = read.table("./train/subject_train.txt",col.names = "SubjectId") 
xTrain       = read.table("./train/x_train.txt",col.names = features[,2])  
yTrain       = read.table("./train/y_train.txt",col.names = "ActivityId") 

## test data
subjectTest = read.table("./test/subject_test.txt",col.names = "SubjectId")   
xTest       = read.table("./test/x_test.txt",col.names = features[,2]) 
yTest       = read.table("./test/y_test.txt",col.names = "ActivityId")  

# Create the final train and test dataset by merging yTrain, subjectTrain, and xTrain / yTest, subjectTrain, and xTest 
FullTrainData = cbind(yTrain,subjectTrain,xTrain)
FullTestData = cbind(yTest,subjectTest,xTest)

# Combine test and train datasets to create a master data
UCI_HAR_Dataset = cbind(yTest,subjectTest,xTest)



========================================================================================================================
## 2 Extracts only the measurements on the mean and standard deviation for each measurement.


UCI_HAR_Dataset_measurements <- UCI_HAR_Dataset[,grepl("mean|std|Subject|ActivityId", names(UCI_HAR_Dataset))]


========================================================================================================================
## 3 Uses descriptive activity names to name the activities in the data set.

UCI_HAR_Dataset_activities = merge(UCI_HAR_Dataset_measurements,activityLabels,by='ActivityId',all.x=TRUE)

========================================================================================================================
## 4 Appropriately labels the data set with descriptive variable names.


# Cleaning up the variable names 
names(UCI_HAR_Dataset_activities) <- gsub("\\()","",names(UCI_HAR_Dataset_activities))                             ##remove parentheses
names(UCI_HAR_Dataset_activities) <- gsub("-mean","Mean",names(UCI_HAR_Dataset_activities))                       ##relabel means 
names(UCI_HAR_Dataset_activities) <- gsub("-std$","StdDev",names(UCI_HAR_Dataset_activities))                      ##relabel standard deviation 
names(UCI_HAR_Dataset_activities) <- gsub('Acc',"Acceleration",names(UCI_HAR_Dataset_activities))                  ##relabel Acceleration
names(UCI_HAR_Dataset_activities) <- gsub('GyroJerk',"AngularAcceleration",names(UCI_HAR_Dataset_activities))      ##relabel AngularAcceleration
names(UCI_HAR_Dataset_activities) <- gsub('Gyro',"AngularSpeed",names(UCI_HAR_Dataset_activities))                 ##relabel AngularSpeed
names(UCI_HAR_Dataset_activities) <- gsub('Mag',"Magnitude",names(UCI_HAR_Dataset_activities))                     ##relabel Magnitude
names(UCI_HAR_Dataset_activities) <- gsub('^f',"FrequencyDomain.",names(UCI_HAR_Dataset_activities))               ##relabel FrequencyDomain
names(UCI_HAR_Dataset_activities) <- gsub(("Freq\\."),"Frequency.",names(UCI_HAR_Dataset_activities))              ##relabel Frequency
names(UCI_HAR_Dataset_activities) <- gsub('^t',"TimeDomain.",names(UCI_HAR_Dataset_activities))                    ##relabel TimeDomain

========================================================================================================================
## 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

UCI_HAR_Dataset_avg <-aggregate(. ~SubjectId + ActivityId, UCI_HAR_Dataset_activities, mean)
UCI_HAR_Dataset_avg <- UCI_HAR_Dataset_avg [order(UCI_HAR_Dataset_avg $SubjectId, UCI_HAR_Dataset_avg $ActivityId),]

## write a text file
write.table(UCI_HAR_Dataset_avg, file = "tidydata.txt",row.name=FALSE)
