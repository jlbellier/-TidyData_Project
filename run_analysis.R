###############################################
#
# run_analysis.R
#
###############################################

# Step 0 : Getting the data
#############################
library(readr)
library(dplyr) # Will be used from step 2
library(plyr) # Will be used from step 2

mainFolder <- "UCI HAR Dataset"
testFolder <- paste(mainFolder,"\\test",sep="")
trainFolder <- paste(mainFolder,"\\train",sep="")

# Read the files from the main folder
activityLabelsFile <-  read.table(file=paste(mainFolder,"\\activity_labels.txt",sep=""),col.names=c("Activity_Id","Activity_Name"))
features_file <-  read.table(file=paste(mainFolder,"\\features.txt",sep=""),col.names=c("Measure_Id","Measure_Name"))

print(features_file)

# Read the files from the train folder
trainSubjectFile <-  read.table(file=paste(trainFolder,"\\subject_train.txt",sep=""),col.names=c("Subject_Id"))
trainXFile <-  read.table(file=paste(trainFolder,"\\X_train.txt",sep=""),col.names=features_file[,2],check.names = TRUE)
trainYFile <-  read.table(file=paste(trainFolder,"\\Y_train.txt",sep=""),col.names=c("Activity_Id"))

# Read the files from the test folder
testSubjectFile <-  read.table(file=paste(testFolder,"\\subject_test.txt",sep=""),col.names=c("Subject_Id"))
testXFile <-  read.table(file=paste(testFolder,"\\X_test.txt",sep=""),col.names=features_file[,2],check.names =TRUE)
testYFile <-  read.table(file=paste(testFolder,"\\Y_test.txt",sep=""),col.names=c("Activity_Id"))

# Step 1 : Merging the test and train data
###########################################

trainData <- cbind(trainSubjectFile, trainYFile, trainXFile)
print("données entrainement")
print(trainData[1:10,1:10])
testData <- cbind(testSubjectFile, testYFile, testXFile)
print("données test")
print(testData[1:10,1:10])
mergedData <- rbind(trainData,testData)

# Step 2 : Extract only the measures on the mean and standard deviation for each measurement 
#############################################################################################

mergedDataMeanStd <- select(mergedData, Activity_Id ,Subject_Id, contains("mean"),contains("std"))

# Step 3 : Use descriptive activity names to name the activities in the data set 
################################################################################

mergedDataMeanStd <- merge(x=activityLabelsFile, y=mergedDataMeanStd, by.x="Activity_Id", by.y = "Activity_Id")


# Step 4 : Label the measures with significant names 
#####################################################

names(mergedDataMeanStd) <- gsub("mean","Mean",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("std","StandardDeviation",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("Acc","Acceleration",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("GyroJerk","AngularVelocity",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("Freq","Frequency",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("^t","timeDomain",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("^f","FFT",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("[\\.]{3}","\\_",names(mergedDataMeanStd))
names(mergedDataMeanStd) <- gsub("[\\.]{2}","",names(mergedDataMeanStd))

# Step 5 : From step 4, creation of a new tidy data set with the mean of each measurement by activity and subject
####################################################################################################################

GroupActivitySubjectMeans <- group_by(mergedDataMeanStd,Subject_Id, Activity_Name)
GroupActivitySubjectMeans <- summarise_each(GroupActivitySubjectMeans,funs(mean),-(1:3))
write.table(GroupActivitySubjectMeans,file="avgMeasurementsbyUser_Activity.txt",quote=FALSE,sep="\t",row.names=FALSE)
