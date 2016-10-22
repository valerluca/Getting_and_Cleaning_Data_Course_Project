##CodeBook for Human Activity Recognition Using Smartphones Dataset and the output of this project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# For each record it is provided:

*  Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*  Triaxial Angular velocity from the gyroscope. 
*  A 561-feature vector with time and frequency domain variables. 
*  Its activity label. 
*  An identifier of the subject who carried out the experiment.

#The dataset includes the following files:

*  'README.txt'
*  'features_info.txt': Shows information about the variables used on the feature vector.
*  'features.txt': List of all features.
*  'activity_labels.txt': Links the class labels with their activity name.
*  'train/X_train.txt': Training set.
*  'train/y_train.txt': Training labels.
*  'test/X_test.txt': Test set.
*  'test/y_test.txt': Test labels.

# The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


For more information about this dataset contact: activityrecognition@smartlab.ws


##Processing required to create and clean the final tidy data set

see README.md file and run_analysis.R file.


##Variables

features: dataset for the feature labels activities: dataset for the activity labels

#The output file tidydata.txt contans the following variables:

Only features for mean and standard deviations measures were kept. That means that from the original 561 feature vector the output is  reduced to 79 values for per each ativity.

 [1] "SubjectId"                                                   
 [2] "Activity"                                                    
 [3] "ActivityId"                                                  
 [4] "TimeDomain.BodyAccelerationMean-X"                           
 [5] "TimeDomain.BodyAccelerationMean-Y"                           
 [6] "TimeDomain.BodyAccelerationMean-Z"                           
 [7] "TimeDomain.BodyAcceleration-std-X"                           
 [8] "TimeDomain.BodyAcceleration-std-Y"                           
 [9] "TimeDomain.BodyAcceleration-std-Z"                           
[10] "TimeDomain.GravityAccelerationMean-X"                        
[11] "TimeDomain.GravityAccelerationMean-Y"                        
[12] "TimeDomain.GravityAccelerationMean-Z"                        
[13] "TimeDomain.GravityAcceleration-std-X"                        
[14] "TimeDomain.GravityAcceleration-std-Y"                        
[15] "TimeDomain.GravityAcceleration-std-Z"                        
[16] "TimeDomain.BodyAccelerationJerkMean-X"                       
[17] "TimeDomain.BodyAccelerationJerkMean-Y"                       
[18] "TimeDomain.BodyAccelerationJerkMean-Z"                       
[19] "TimeDomain.BodyAccelerationJerk-std-X"                       
[20] "TimeDomain.BodyAccelerationJerk-std-Y"                       
[21] "TimeDomain.BodyAccelerationJerk-std-Z"                       
[22] "TimeDomain.BodyAngularSpeedMean-X"                           
[23] "TimeDomain.BodyAngularSpeedMean-Y"                           
[24] "TimeDomain.BodyAngularSpeedMean-Z"                           
[25] "TimeDomain.BodyAngularSpeed-std-X"                           
[26] "TimeDomain.BodyAngularSpeed-std-Y"                           
[27] "TimeDomain.BodyAngularSpeed-std-Z"                           
[28] "TimeDomain.BodyAngularAccelerationMean-X"                    
[29] "TimeDomain.BodyAngularAccelerationMean-Y"                    
[30] "TimeDomain.BodyAngularAccelerationMean-Z"                    
[31] "TimeDomain.BodyAngularAcceleration-std-X"                    
[32] "TimeDomain.BodyAngularAcceleration-std-Y"                    
[33] "TimeDomain.BodyAngularAcceleration-std-Z"                    
[34] "TimeDomain.BodyAccelerationMagnitudeMean"                    
[35] "TimeDomain.BodyAccelerationMagnitudeStdDev"                  
[36] "TimeDomain.GravityAccelerationMagnitudeMean"                 
[37] "TimeDomain.GravityAccelerationMagnitudeStdDev"               
[38] "TimeDomain.BodyAccelerationJerkMagnitudeMean"                
[39] "TimeDomain.BodyAccelerationJerkMagnitudeStdDev"              
[40] "TimeDomain.BodyAngularSpeedMagnitudeMean"                    
[41] "TimeDomain.BodyAngularSpeedMagnitudeStdDev"                  
[42] "TimeDomain.BodyAngularAccelerationMagnitudeMean"             
[43] "TimeDomain.BodyAngularAccelerationMagnitudeStdDev"           
[44] "FrequencyDomain.BodyAccelerationMean-X"                      
[45] "FrequencyDomain.BodyAccelerationMean-Y"                      
[46] "FrequencyDomain.BodyAccelerationMean-Z"                      
[47] "FrequencyDomain.BodyAcceleration-std-X"                      
[48] "FrequencyDomain.BodyAcceleration-std-Y"                      
[49] "FrequencyDomain.BodyAcceleration-std-Z"                      
[50] "FrequencyDomain.BodyAccelerationMeanFreq-X"                  
[51] "FrequencyDomain.BodyAccelerationMeanFreq-Y"                  
[52] "FrequencyDomain.BodyAccelerationMeanFreq-Z"                  
[53] "FrequencyDomain.BodyAccelerationJerkMean-X"                  
[54] "FrequencyDomain.BodyAccelerationJerkMean-Y"                  
[55] "FrequencyDomain.BodyAccelerationJerkMean-Z"                  
[56] "FrequencyDomain.BodyAccelerationJerk-std-X"                  
[57] "FrequencyDomain.BodyAccelerationJerk-std-Y"                  
[58] "FrequencyDomain.BodyAccelerationJerk-std-Z"                  
[59] "FrequencyDomain.BodyAccelerationJerkMeanFreq-X"              
[60] "FrequencyDomain.BodyAccelerationJerkMeanFreq-Y"              
[61] "FrequencyDomain.BodyAccelerationJerkMeanFreq-Z"              
[62] "FrequencyDomain.BodyAngularSpeedMean-X"                      
[63] "FrequencyDomain.BodyAngularSpeedMean-Y"                      
[64] "FrequencyDomain.BodyAngularSpeedMean-Z"                      
[65] "FrequencyDomain.BodyAngularSpeed-std-X"                      
[66] "FrequencyDomain.BodyAngularSpeed-std-Y"                      
[67] "FrequencyDomain.BodyAngularSpeed-std-Z"                      
[68] "FrequencyDomain.BodyAngularSpeedMeanFreq-X"                  
[69] "FrequencyDomain.BodyAngularSpeedMeanFreq-Y"                  
[70] "FrequencyDomain.BodyAngularSpeedMeanFreq-Z"                  
[71] "FrequencyDomain.BodyAccelerationMagnitudeMean"               
[72] "FrequencyDomain.BodyAccelerationMagnitudeStdDev"             
[73] "FrequencyDomain.BodyAccelerationMagnitudeMeanFreq"           
[74] "FrequencyDomain.BodyBodyAccelerationJerkMagnitudeMean"       
[75] "FrequencyDomain.BodyBodyAccelerationJerkMagnitudeStdDev"     
[76] "FrequencyDomain.BodyBodyAccelerationJerkMagnitudeMeanFreq"   
[77] "FrequencyDomain.BodyBodyAngularSpeedMagnitudeMean"           
[78] "FrequencyDomain.BodyBodyAngularSpeedMagnitudeStdDev"         
[79] "FrequencyDomain.BodyBodyAngularSpeedMagnitudeMeanFreq"       
[80] "FrequencyDomain.BodyBodyAngularAccelerationMagnitudeMean"    
[81] "FrequencyDomain.BodyBodyAngularAccelerationMagnitudeStdDev"  
[82] "FrequencyDomain.BodyBodyAngularAccelerationMagnitudeMeanFreq"

#Final data tidy data set output

tidydata.txt is the final data set that contains the column means for each variable for each subject for each activity. In the R sceipt is written from UCI_HAR_Dataset_avg table.
