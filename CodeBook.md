# Codebook for the peer-graded assignment: Getting and cleaning data course project 

Date: June 19, 2019
## Raw Data
 
 the data is collected from the accelerometers from the Samsung Galaxy S smartphone as explained in the original README.txt
 --------------------------------------------------------------------------------------------------------------------------
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.|

----------------------------------------------------------------------------------
 
 ### The raw data is downloaded from “https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip” 

 # Creating the tidy data
 In order to create the tidy data, the script from CleaningAssignment.R was used. The script does the following:

### Merging the training and test sets to create one data set
From the raw dataset 
subject_test.txt, X_test.txt and Y_test.txt found in “getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset\test” were combined by column
subject_train.txt, X_train.txt and Y_train.txt found in “getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset\train” were combined by column
the two combined data were again combined by row to create one dataset 

### Extracts only the measurement on the mean and standard deviation for each measurement

Read features.txt found in “getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset”
Replaced column names starting from column 3 by column 2 data of features.txt
New dataset is created by filtering  the column 1,2 and the columns which contains mean or std in their name

### Uses descriptive activity names to name the activities in the dataset
Read activity_labels.txt found in “getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset”
Activity column is then changed in to a factor with 6 levels corresponding to the different activities.
### Appropriately labels the data set with descriptive variable names 
Cleaned the data names by removing “-“,”,”,”()” symbols and replacing names that begin in ‘t’ and ‘f’ with time and freq respectively. 
### From the data set in step 4, create a second , independent tidy data set with average of each variable for each activity and each subject
The data is grouped based on the subject and activitiy (first and second column) and stored in to  a new grouped data
The grouped data is summarized using sumerize_all function and stored in to the final dataset called “tidy_data”.


## Variable Description 

The final data set (tidy_data) contains 180 rows and 81 columns. First column is the subject, second column is the type of activities and the rest 79 columns are the average values for the mean and standard deviation of the different measurements for each unique combination of subject and activity. 


 

| Index |           Name          |Data type         | Description                                                                                               |
|-------|------------------------------| -----------|-----------------------------------------------------------------------------------------------------------|
|    1  | Subject                      | num,[1,30] | subjects represented by numbers from 1 to 30                                                                                        |
|    2  | Activity                     | Factor; 6 levels | factor with 6 levels representing the activities, 1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING            |
|    3  | AvgtimeBodyAccmeanX      | Num; [-1,1]      | mean value for time body acceleration mean of X                                                           |
|    4  | AvgtimeBodyAccmeanY       | Num; [-1,1]      | mean value for time body acceleration mean of Y                                            |
|    5  | AvgtimeBodyAccmeanZ       | Num; [-1,1]      | mean value for time body acceleration mean of Z                                                                          |
|    6  | AvgtimeGravityAccmeanX        | Num; [-1,1]      | mean value for time Gravity acceleration mean of X                                                        |
|    7  | AvgtimeGravityAccmeanY         | Num; [-1,1]      | mean value for time Gravity acceleration mean of Y                                                                     |
|    8  | AvgtimeGravityAccmeanZ         | Num; [-1,1]      | mean value for time Gravity acceleration mean of Z                                                                    |
|    9  | AvgtimeBodyAccJerkmeanX    | Num; [-1,1]      | mean value for time Boady acceleration mean of X                                                                               |
|   10  | AvgtimeBodyAccJerkmeanY    | Num; [-1,1]      | mean value for time Body acceleration jerk signal mean of Y                                                                              |
|   11  | AvgtimeBodyAccJerkmeanZ    | Num; [-1,1]      | mean value for the time Body acceleration jerk signal mean of Z                                                                                          |
|   12  | AvgtimeBodyGyromeanX     | Num; [-1,1]      | mean value for the time Body acceleration jerk signal mean of Z                                                                                          |
|   13  | AvgtimeBodyGyromeanY     | Num; [-1,1]      | mean value for the time Body gyroscope signal mean of Y                                                                                           |
|   14  | AvgtimeBodyGyromeanZ     | Num; [-1,1]      | mean value for the time Body gyroscope signal mean of Z                                                                                                         |
|   15  | AvgtimeBodyGyroJerkmeanX   | Num; [-1,1]      | mean value for the time Body gyroscope signal mean of X                                                                                                                       |
|   16  | AvgtimeBodyGyroJerkmeanY   | Num; [-1,1]      | mean value for the time Body gyroscope jerk signal mean of Y                                                                                                                        |
|   17  | AvgtimeBodyGyroJerkmeanZ   | Num; [-1,1]      | mean value for the time Body gyroscope jerk signal mean of Z                                                                                                                                   |
|   18  | AvgtimeBodyAccMagmean    | Num; [-1,1]      | mean value for the time Body acceleration jerk signal mean of Y                                                                                                                       |
|   19  | AvgtimeGravityAccMagmean   | Num; [-1,1]      | mean value for the time Gravity acceleration Magnitude signal mean                  |
|   20  | AvgtimeBodyAccJerkMagmean    | Num; [-1,1]      | mean value for the time body acceleration jerk Magnitude signal mean                          |
|   21  | AvgtimeBodyGyroMagmean      | Num; [-1,1]      | mean value for the time Body gyroscope Magnitude signal mean                                                          |
|   22  | AvgtimeBodyGyroJerkMagmean      | Num; [-1,1]      | mean value for the time body gyroscope jerk Magnitude signal mean                                                             |
|   23  | AvgfreqBodyAccmeanX      | Num; [-1,1]      | mean value for the frequency body acceleration mean of X                                                                    |
|   24  | AvgfreqBodyAccmeanY       | Num; [-1,1]      | data type: num, mean value for the frequency body acceleration mean of Y                                                                     |
|   25  | AvgfreqBodyAccmeanZ       | Num; [-1,1]      | mean value for the frequency body acceleration mean of Z                                                                                    |
|   26  | AvgfreqBodyAccmeanFreqX       | Num; [-1,1]      | mean value for the frequency body acceleration mean frequency of X                                                                                |
|   27  | AvgfreqBodyAccmeanFreqY  | Num; [-1,1]      | mean value for the frequency body acceleration mean frequency of Y                                                                                             |
|   28  | AvgfreqBodyAccmeanFreqZ  | Num; [-1,1]      | mean value for the frequency body acceleration mean frequency of Z                                                                                             |
|   29  | AvgfreqBodyAccJerkmeanX   | Num; [-1,1]      | mean value for the frequency body acceleration jerk mean of X                                                                                              |
|   30  | AvgfreqBodyAccJerkmeanY   | Num; [-1,1]      | mean value for the frequency body acceleration jerk mean of Y                                                                                         |
|   31  | AvgfreqBodyAccJerkmeanZ   | Num; [-1,1]      | mean value for the frequency body acceleration jerk mean of Z                                                                                            |
|   32  | AvgfreqBodyAccJerkmeanFreqX   | Num; [-1,1]      | num, mean value for the frequency body acceleration jerk mean frequency of X                                                                                      |
|   33  | AvgfreqBodyAccJerkmeanFreqY       | Num; [-1,1]      | num, mean value for the frequency body acceleration jerk mean frequency of Y                                                                                                               |
|   34  | AvgfreqBodyAccJerkmeanFreqZ       | Num; [-1,1]      | num, mean value for the frequency body acceleration jerk mean frequency of Z                                                                                                |
|   35  | AvgfreqBodyGyromeanX   | Num; [-1,1]      | mean value for the frequency body gerscope mean of X                                                                                                                   |
|   36  | AvgfreqBodyGyromeanY    | Num; [-1,1]      | mean value for the frequency body gerscope mean of Y                                                                                                                  |
|   37  | AvgfreqBodyGyromeanZ  | Num; [-1,1]      | mean value for the frequency body gerscope mean of Z                                                                                                                           |
|   38  | AvgfreqBodyGyromeanFreqX    | Num; [-1,1]      | mean value for the frequency body gerscope mean frequency of X                                                                                                         |
|   39  | AvgfreqBodyGyromeanFreqY     | Num; [-1,1]      | mean value for the frequency body gerscope mean frequency of Y                                                                                                                                          |
|   40  | AvgfreqBodyGyromeanFreqZ      | Num; [-1,1]      | mean value for the frequency body gerscope mean frequency of Z                                                                                                                            |
|   41  | AvgfreqBodyAccMagmean | Num; [-1,1]      | mean value for the frequency body acceleration magnitude mean                         |
|   42  | AvgfreqBodyAccMagmeanFreq  | Num; [-1,1]      | mean value for the frequency body acceleration magnitude frequency                   |
|   43  | AvgfreqBodyBodyAccJerkMagmean       | Num; [-1,1]      | mean value for the frequency body acceleration jerk magnitude mean                                            |
|   44  | AvgfreqBodyBodyAccJerkMagmeanFreq       | Num; [-1,1]      | mean value for the frequency body acceleration jerk magnitude mean frequency                                       |
|   45  | AvgfreqBodyBodyGyroMagmean       | Num; [-1,1]      | mean value for the frequency body acceleration jerk magnitude mean frequency                                                |
|   46  | AvgfreqBodyBodyGyroMagmeanFreq"           | Num; [-1,1]      | mean value for the frequency body acceleration jerk magnitude mean frequency         mean value for the frequency body gyroscope jerk magnitude mean                          |
|   47  | AvgfreqBodyBodyGyroJerkMagmean        | Num; [-1,1]      | mean value for the frequency body gyroscope jerk magnitude mean                          |
|   48  | AvgfreqBodyBodyGyroJerkMagmeanFreq        | Num; [-1,1]      | mean value for the frequency body of body gyroscope jerk magnitude mean frequency                         |
|   49  | AvgtimeBodyAccstdX   | Num; [-1,1]      | mean value for the time body acceleration standard deviation of X                       |
|   50  | AvgtimeBodyAccstdY    | Num; [-1,1]      | mean value for the time body acceleration standard deviation of Y                       |
|   51  | AvgtimeBodyAccstdZ   | Num; [-1,1]      | mean value for the time body acceleration standard deviation of Z                       |
|   52  | AvgtimeGravityAccstdX     | Num; [-1,1]      | mean value for the time gravity acceleration standard deviation of X         |
|   53  | AvgtimeGravityAccstdY    | Num; [-1,1]      | mean value for the time gravity acceleration standard deviation of Y         |
|   54  | AvgtimeGravityAccstdZ    | Num; [-1,1]      | mean value for the time gravity acceleration standard deviation of Z         |
|   55  | AvgtimeBodyAccJerkstdX      | Num; [-1,1]      | mean value for the time body acceleration jerk of X                            |
|   56  | AvgtimeBodyAccJerkstdY            | Num; [-1,1]      | mean value for the time body acceleration jerk standard deviation of Y                            |
|   57  | AvgtimeBodyAccJerkstdZ      | Num; [-1,1]      | mean value for the time body acceleration jerk standard deviation of Z                            |
|   58  | AvgtimeBodyGyrostdX       | Num; [-1,1]      | mean value for the time body gyroscope standard deviation of X              |
|   59  | AvgtimeBodyGyrostdY       | Num; [-1,1]      | mean value for the time body gyroscope standard deviation of Y              |
|   60  | AvgtimeBodyGyrostdZ       | Num; [-1,1]      | mean value for the time body gyroscope standard deviation of Z              |
|   61  | AvgtimeBodyGyroJerkstdX      | Num; [-1,1]      | mean value for the time body gyroscope jerk standard deviation of X                                |
|   62  | AvgtimeBodyGyroJerkstdY       | Num; [-1,1]      | mean value for the time body gyroscope jerk standard deviation of Y                 |
|   63  | AvgtimeBodyGyroJerkstdZ  | Num; [-1,1]      | mean value for the time body gyroscope jerk standard deviation of Z                       |
|   64  | AvgtimeBodyAccMagstd   | Num; [-1,1]      | mean value for the time body gyroscope jerk standard deviation of X         |
|   65  | AvgtimeGravityAccMagstd     | Num; [-1,1]      | mean value for the time gravity accerelation magnitude standard deviation                                |
|   66  | AvgtimeBodyAccJerkMagstd      | Num; [-1,1]      | mean value for the time body accerelation jerk magnitude standard deviation                   |
|   67  | AvgtimeBodyGyroMagstd | Num; [-1,1]      | mean value for the time body gyroscope magnitude standard deviation                        |
|   68  | AvgtimeBodyGyroJerkMagstd   | Num; [-1,1]      | mean value for the time body gyroscope jerk magnitude standard deviation           |
|   69  | AvgfreqBodyAccstdX  | Num; [-1,1]      | mean value for the frequency body acceleration standard deviation of X          |
|   70  | AvgfreqBodyAccstdY   | Num; [-1,1]      | mean value for the frequency body acceleration standard deviation of Y           |
|   71  | Avrg-fBodyGyroJerkMag-std()  | Num; [-1,1]      | mean value for the frequency body acceleration standard deviation of Z          |
|   72  | AvgfreqBodyAccJerkstdX  | Num; [-1,1]      | mean value for the frequency body acceleration jerk standard deviation of X          |
|   73  | AvgfreqBodyAccJerkstdY  | Num; [-1,1]      | mean value for the frequency body acceleration jerk standard deviation of Y           |
|   74  | AvgfreqBodyAccJerkstdZ   | Num; [-1,1]      | mean value for the frequency body acceleration jerk standard deviation of Z           |
|   75  | AvgfreqBodyGyrostdX  | Num; [-1,1]      | mean value for the frequency body gyroscope standard deviation of X           |
|   76  | AvgfreqBodyGyrostdY  | Num; [-1,1]      | mean value for the frequency body gyroscope standard deviation of Y           |
|   77  | AvgfreqBodyGyrostdZ   | Num; [-1,1]      | mean value for the frequency body gyroscope standard deviation of Z           |
|   78  | AvgfreqBodyAccMagstd   | Num; [-1,1]      | mean value for the frequency body gyroscope standard deviation of X           |
|   79  | AvgfreqBodyBodyAccJerkMagstd   | Num; [-1,1]      | mean value for the frequency body of body acceleration magnitude standard deviation           | 
|   80  | AvgfreqBodyBodyGyroMagstd  | Num; [-1,1]      | mean value for the frequency body of body gyroscope magnitude standard deviation           |
|   81  | AvgfreqBodyBodyGyroJerkMagstd  | Num; [-1,1]      | mean value for the frequency body of body gyroscope jerk magnitude standard deviation          |
 
