The present file describes the different steps defined in script run_analysis.R to produce the final tidy data set. 

This file contains 6 steps :

# Step 0 : Acquire data
After the loading of the necessary libraries (dplyr, readr and plyr), the script loads the files from :
* the root level of the dataset directory :
	* **activity_labels.txt** for the description of the 6 activities performed by the volounteers
	* **features.txt** for the description of the measurements 
* the subdirectory 'test' of the dataset directory :
	* **subject_test.txt** : the identifiers of the volunteers from the test group
	* **X_test.txt** : the data frame describing the results of the measurements for all the subjects from the test group. Each column is a measurement from the file features.txt
	* **Y_test.txt** : the identifiers of the activities defined in file activity_labels.txt
* the subdirectory 'train' of the dataset directory :
	* **subject_test.txt** : the identifiers of the volunteers from the train group
	* **X_test.txt** : the data frame describing the results of the measurements for all the subjects from the train group. Each column is a measurement from the file features.txt
	* **Y_test.txt** : the identifiers of the activities defined in file activity_labels.txt
	
All the columns of the X_test data frame are named using the labels of file activity_labels.txt. 
	
# Step 1 : Acquire data

This step merges, for each set of data (train and test), the 3 files subject_test.txt, Y_test.txt and X_test.txt. This produces two data sets with subject id, activity id and 
the measurements (one for test data and one for train data), by putting the columns one next to the other.  
These two data sets are then merged with a row binding. 

# Step 2 : Remove the unnecessary columns

The columns that are not wanted are removed from the selection by selecting only the names containing "mean" or "std". 

# Step 3 : Add the activity description

The activiy names are added to the dataset defined in step 2 with a join on activity id. 

# Step 4 : Name the  columns of the dataset appropriately

In this step, we rename the columns to give precise names to the measurements

# Step 5 : group the data by activity and user id, and compute the means of all the measurements
This step computes the average by user id and activity, and stores the result in a text file. The separator is a TAB character

