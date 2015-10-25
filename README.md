---
title: "README"
author: "Ken Lee"
date: "October 24, 2015"
output: html_document
---

This is part of a submission to the Coursera's Getting and Cleaning Data course project. In this assigment, the goal is to produce a tidy dataset from the raw data from this Human Activity Recognization Using SmartPhones. More information on this study can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Here are the steps we are tasked to do:

> You should create one R script called run_analysis.R that does the following. 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this assignment, we will use library(dpylr)
```{r}
library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFileName <- "smartphonesData.zip"
if(!file.exists(destFileName)) {
        download.file(fileUrl, destfile = destFileName, method="curl")
}

```

