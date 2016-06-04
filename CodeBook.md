The present file describes the different variables used in the final tidy data set 


## General description of the file 

The number of rows of the data set is the sum of the number of rows of the test data set defined in the 'test' subfolder and the number of rows of the training data set 
defined in the 'train' data set. This gives a total number of rows of 2947 (test) + 7352 (train), i.e. 10299 rows.

The file defining the tidy data set contains the average values of each measurement given in the file 'features.txt' defined at the root of the folder 'UCI HAR Dataset'.
As defined in the project, the targer measurements were only the ones having 'mean' or 'std' in their names.

## Description of the columns

In this section, we give the description of each column of the final tidy data set. The columns were slightly renamed in order to avoid spurious characters, and to make them a little bit more readable. 
We remind to the reader that the columns contain the average of the target measurements by activity and user id. 
As this feature is already mentioned in the name of the data set file, we decided not to add this information on the column names to avoid long column names.
We can also notice that the range of the measurements is the final tidy data set is not the same as on the original files. The reason of that comes from the way the column names were filtered. They were filtered using successive **contains("mean")** and **contains("std")** instructions. Therefore, all the columns containing the word "mean" were listed first, and then the ones containing "std". 
In order for the reader not to be lost, we indicated, in the description of each measurement column (see table below), its original name id coming from 'features.txt' file. 


We remind here in italic the description of the measurements, extracted from the 'features_info.txt' file :

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz*

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).*

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).*

*These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

This being written, we can now describe the column of the final data set

Subject_Id 		: identifier of the subject from either train data set or test data set. This information comes directly from the 'test\subject_test.txt' and 'train\subject_train.txt' 
				  files
Activity_Name	: name of the 6 main activities performed by the subjects : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. These values come directly 
				  from the second column of file 'activity_levels.txt' located at the root of the folder 'UCI HAR Dataset'
				  
Column name in final data set | Original feature name | Original feature id 
----------------------------- | --------------------- | -------------------
timeDomainBodyAcceleration.Mean_X | tBodyAcc-mean()-X  | 1
timeDomainBodyAcceleration.Mean_Y | tBodyAcc-mean()-Y | 2
timeDomainBodyAcceleration.Mean_Z | tBodyAcc-mean()-Z | 3
timeDomainGravityAcceleration.Mean_X | tGravityAcc-mean()-X | 41
timeDomainGravityAcceleration.Mean_Y | tGravityAcc-mean()-Y | 42
timeDomainGravityAcceleration.Mean_Z | tGravityAcc-mean()-Z | 43
timeDomainBodyAccelerationJerk.Mean_X | tBodyAccJerk-mean()-X | 81
timeDomainBodyAccelerationJerk.Mean_Y | tBodyAccJerk-mean()-Y | 82
timeDomainBodyAccelerationJerk.Mean_Z | tBodyAccJerk-mean()-Z | 83
timeDomainBodyGyro.Mean_X | tBodyGyro-mean()-X | 121
timeDomainBodyGyro.Mean_Y | tBodyGyro-mean()-Y | 122
timeDomainBodyGyro.Mean_Z | tBodyGyro-mean()-Z | 123
timeDomainBodyAngularVelocity.Mean_X | tBodyGyroJerk-mean()-X | 161
timeDomainBodyAngularVelocity.Mean_Y | tBodyGyroJerk-mean()-Y | 162
timeDomainBodyAngularVelocity.Mean_Z | tBodyGyroJerk-mean()-Z | 163
timeDomainBodyAccelerationMag.Mean | tBodyAccMag-mean() | 201
timeDomainBodyAngularVelocityMag.Mean | tBodyGyroJerkMag-mean() | 253
FFTBodyAcceleration.Mean_X | fBodyAcc-mean()-X | 266
FFTBodyAcceleration.Mean_Y | fBodyAcc-mean()-Y | 267
FFTBodyAcceleration.Mean_Z | fBodyAcc-mean()-Z | 268
FFTBodyAcceleration.MeanFrequency_X | fBodyAcc-meanFreq()-X | 294
FFTBodyAcceleration.MeanFrequency_Y | fBodyAcc-meanFreq()-Y | 295
FFTBodyAcceleration.MeanFrequency_Z | fBodyAcc-meanFreq()-Z | 296
FFTBodyAccelerationJerk.Mean_X | fBodyAccJerk-mean()-X | 345 
FFTBodyAccelerationJerk.Mean_Y | fBodyAccJerk-mean()-Y | 346 
FFTBodyAccelerationJerk.Mean_Z | fBodyAccJerk-mean()-Z | 347 
FFTBodyAccelerationJerk.MeanFrequency_X | fBodyAccJerk-meanFreq()-X | 373
FFTBodyAccelerationJerk.MeanFrequency_Y | fBodyAccJerk-meanFreq()-Y | 374
FFTBodyAccelerationJerk.MeanFrequency_Z | fBodyAccJerk-meanFreq()-Z | 375
FFTBodyGyro.Mean_X | fBodyGyro-mean()-X | 424
FFTBodyGyro.Mean_Y | fBodyGyro-mean()-Y | 425
FFTBodyGyro.Mean_Z | fBodyGyro-mean()-Z | 426
FFTBodyGyro.MeanFrequency_X | fBodyGyro-meanFreq()-X | 452
FFTBodyGyro.MeanFrequency_Y | fBodyGyro-meanFreq()-Y | 453
FFTBodyGyro.MeanFrequency_Z | fBodyGyro-meanFreq()-Z | 454
FFTBodyAccelerationMag.Mean | fBodyAccMag-mean() | 503
FFTBodyAccelerationMag.MeanFrequency | fBodyAccMag-meanFreq() | 513
FFTBodyBodyAccelerationJerkMag.Mean| fBodyBodyAccJerkMag-mean()| 516
FFTBodyBodyAccelerationJerkMag.MeanFrequency | fBodyBodyAccJerkMag-meanFreq() |526
FFTBodyBodyGyroMag.Mean | fBodyBodyGyroMag-mean() | 529
FFTBodyBodyGyroMag.MeanFrequency | fBodyBodyGyroMag-meanFreq() | 539
FFTBodyBodyAngularVelocityMag.Mean | fBodyBodyGyroJerkMag-mean() | 542
FFTBodyBodyAngularVelocityMag.MeanFrequency | fBodyBodyGyroJerkMag-meanFreq() |552
angle.tBodyAccelerationMean.gravity. | angle(tBodyAccMean,gravity) | 555
angle.tBodyAccelerationJerkMeangravityMean. | angle(tBodyAccJerkMean),gravityMean) | 556
angle.tBodyGyroMean.gravityMean. | angle(tBodyGyroMean,gravityMean) | 557
angle.tBodyAngularVelocityMean.gravityMean. | angle(tBodyGyroJerkMean,gravityMean) | 558
angle.X.gravityMean. | angle(X,gravityMean) | 559
angle.Y.gravityMean. | angle(Y,gravityMean) | 560
angle.Z.gravityMean. | angle(Z,gravityMean) | 561
timeDomainBodyAcceleration.StandardDeviation_X | tBodyAcc-std()-X | 4
timeDomainBodyAcceleration.StandardDeviation_Y | tBodyAcc-std()-Y | 5
timeDomainBodyAcceleration.StandardDeviation_Z | tBodyAcc-std()-Z | 6
timeDomainGravityAcceleration.StandardDeviation_X | tGravityAcc-std()-X | 44
timeDomainGravityAcceleration.StandardDeviation_Y | tGravityAcc-std()-Y | 45
timeDomainGravityAcceleration.StandardDeviation_Z | tGravityAcc-std()-Z | 46
timeDomainBodyAccelerationJerk.StandardDeviation_X | tBodyAccJerk-std()-X | 84
timeDomainBodyAccelerationJerk.StandardDeviation_Y | tBodyAccJerk-std()-Y | 85
timeDomainBodyAccelerationJerk.StandardDeviation_Z | tBodyAccJerk-std()-Z | 86
timeDomainBodyGyro.StandardDeviation_X | tBodyGyro-std()-X | 124
timeDomainBodyGyro.StandardDeviation_Y | tBodyGyro-std()-Y | 125
timeDomainBodyGyro.StandardDeviation_Z | tBodyGyro-std()-Z | 126
timeDomainBodyAngularVelocity.StandardDeviation_X | tBodyGyroJerk-std()-X | 164
timeDomainBodyAngularVelocity.StandardDeviation_Y | tBodyGyroJerk-std()-Y | 165
timeDomainBodyAngularVelocity.StandardDeviation_Z | tBodyGyroJerk-std()-Z | 166
timeDomainBodyAccelerationMag.StandardDeviation | tBodyAccMag-std() | 202
timeDomainGravityAccelerationMag.StandardDeviation | tGravityAccMag-std() | 215
timeDomainBodyAccelerationJerkMag.StandardDeviation | tBodyAccJerkMag-std() | 228
timeDomainBodyGyroMag.StandardDeviation | tBodyGyroMag-std() | 241
timeDomainBodyAngularVelocityMag.StandardDeviation | tBodyGyroJerkMag-std() | 254
FFTBodyAcceleration.StandardDeviation_X | fBodyAcc-std()-X | 269
FFTBodyAcceleration.StandardDeviation_Y | fBodyAcc-std()-Y | 270
FFTBodyAcceleration.StandardDeviation_Z | fBodyAcc-std()-Z | 271
FFTBodyAccelerationJerk.StandardDeviation_X | fBodyAccJerk-std()-X | 348
FFTBodyAccelerationJerk.StandardDeviation_Y | fBodyAccJerk-std()-Y | 349
FFTBodyAccelerationJerk.StandardDeviation_Z | fBodyAccJerk-std()-Z | 350
FFTBodyGyro.StandardDeviation_X | fBodyGyro-std()-X | 427
FFTBodyGyro.StandardDeviation_Y | fBodyGyro-std()-Y | 428
FFTBodyGyro.StandardDeviation_Z | fBodyGyro-std()-Z | 429
FFTBodyAccelerationMag.StandardDeviation | fBodyAccMag-std() | 504
FFTBodyBodyAccelerationJerkMag.StandardDeviation | fBodyBodyAccJerkMag-std() | 517
FFTBodyBodyGyroMag.StandardDeviation | fBodyBodyGyroMag-std() | 530
FFTBodyBodyAngularVelocityMag.StandardDeviation | fBodyBodyGyroJerkMag-std() | 543




