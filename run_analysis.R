library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFileName <- "smartphonesData.zip"
if(!file.exists(destFileName)) {
        download.file(fileUrl, destfile = destFileName, method="curl")
}


#this command list the file structure of the zip files
#unzip("smartphonesData.zip", list=TRUE)


#read the column names for table X from features.txt
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

###############now do the same for trainset

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

#names(train)[grepl("mean|std", names(train), ignore.case = T)]


combinedData <- rbind(test,train)
combinedData <- combinedData[names(combinedData)[grepl("subject.id|activity.name|mean\\(\\)|std\\(\\)", names(combinedData), ignore.case = T)]]

names(combinedData) <- sub("BodyBody", "Body", names(combinedData))
names(combinedData) <- sub("mean\\(\\)", "mean", names(combinedData))
names(combinedData) <- sub("std\\(\\)", "std", names(combinedData))
names(combinedData) <- make.names(names(combinedData))
tidy.data <- combinedData %>% group_by(subject.id, activity.name) %>%
        summarise_each(funs(mean), -subject.id, -activity.name)
write.table(tidy.data, "tidy_data.txt", row.names = FALSE)
