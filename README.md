---
title: "README"
author: "Ken Lee"
date: "October 24, 2015"
output: html_document
---

This is part of a submission to the Coursera's Getting and Cleaning Data course project. In this assigment, the goal is to produce a tidy dataset from the raw data from this Human Activity Recognization Using SmartPhones. More information on this study can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Here are the steps we are tasked to do:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this assignment, we will use library(dpylr). The following code download the zip data from Smarthphone website. It checks to see if file has already been download to avoid downloading same data multiple times:

```{r}
library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFileName <- "smartphonesData.zip"
if(!file.exists(destFileName)) {
        download.file(fileUrl, destfile = destFileName, method="curl")
}

```


The data is broken down into three parts:

1. The list of subjects (ie. subject 1, subject 2....)
2. The list of activities. This is coded in 1 to 6 which needs to be translated
3. The measures or features (ie. fBodyAcc.mean.x is the "mean total body acceleration on the x dimension)

The following code unzip each pieces of the information and glue it together for the test set. This includes translating between activity code to actual name of the activity:

```{r}
features <- read.table(unz(destFileName, "UCI HAR Dataset/features.txt"), header = F, stringsAsFactors = FALSE)
X_test <- read.table(unz(destFileName, "UCI HAR Dataset/test/X_test.txt"), 
                header = F)
names(X_test) <- features$V2

#use activity lookup table to translate Y coding of 1,2,3,4,5,6 into corresponding activities
#Walking, walking upstairs, etc...
activity <- read.table(unz(destFileName, "UCI HAR Dataset/activity_labels.txt"), header = F)
Y_test <- read.table(unz(destFileName, "UCI HAR Dataset/test/y_test.txt"), header = F)
Y_test$V1 <- as.factor(activity$V2[Y_test$V1])
names(Y_test) = c("activity.name")

#give a column name to the subject table
S_test <- read.table(unz(destFileName, "UCI HAR Dataset/test/subject_test.txt"), 
                     header = F, col.names = "subject.id")
#combine all three tables to create test set
test <- cbind(S_test, Y_test, X_test)
```

Now to the training set:

```{r}
X_train <- read.table(unz(destFileName, "UCI HAR Dataset/train/X_train.txt"), 
                     header = F)
names(X_train) <- features$V2

#use activity lookup table to translate Y coding of 1,2,3,4,5,6 into corresponding activities
#Walking, walking upstairs, etc...
Y_train <- read.table(unz(destFileName, "UCI HAR Dataset/train/y_train.txt"), header = F)
Y_train$V1 <- as.factor(activity$V2[Y_train$V1])
names(Y_train) = c("activity.name")

#give a column name to the subject table
S_train <- read.table(unz(destFileName, "UCI HAR Dataset/train/subject_train.txt"), 
                     header = F, col.names = "subject.id")
#combine all three tables to create test set
train <- cbind(S_train, Y_train, X_train)
```

We are now tasked to combine the two sets (training and test). After that we will only include those features that are of mean() and std(). There is one step of the code which produces R friendly variables names. After that, we will group the data by subject and activity and produce averages for each features. 

```{r}
combinedData <- rbind(test,train)
combinedData <- combinedData[names(combinedData)[grepl("subject.id|activity.name|mean\\(\\)|std\\(\\)", names(combinedData), ignore.case = T)]]

names(combinedData) <- sub("BodyBody", "Body", names(combinedData))
names(combinedData) <- sub("mean\\(\\)", "mean", names(combinedData))
names(combinedData) <- sub("std\\(\\)", "std", names(combinedData))
names(combinedData) <- make.names(names(combinedData))
tidy.data <- combinedData %>% group_by(subject.id, activity.name) %>%
        summarise_each(funs(mean), -subject.id, -activity.name)
write.table(tidy.data, "tidy_data.txt", row.names = FALSE)
```

The last peice of code produce the tidy_data and save it as a txt file.
