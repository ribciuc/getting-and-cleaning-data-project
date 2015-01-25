#You should create one R script called run_analysis.R that does the following. 
#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names. 
#5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load all the data from the UCI HAR Dataset 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merge test and train from x,y and subject data
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

# Set x colnames and extract only the mean and standard deviation for each measurement
colnames(x) <- features[,"V2"]
extracted_features <- c(grep("-mean\\(\\)", features[,"V2"], value=TRUE), grep("-std\\(\\)", features[,"V2"], value=TRUE))
x <- x[, extracted_features]

# Appropriately labels the dataset with descriptive variable names
data_labels = sapply(extracted_features, function(x) {gsub('[-(),]+','_', x)})
names(x) <- data_labels

# Uses descriptive activity names to name the activities in the data set
for (i in 1:nrow(activity_labels)) {
  x$activity[y$V1 == i] <- as.character(activity_labels[i,2])  
}

# Merge subject and x datasets
colnames(subject) <- "subject"
mergedData <- cbind(x, subject)

# Group by activity and subject, aggregate by average and create a csv
tidy <- aggregate(. ~ subject+activity, data=mergedData, FUN=mean)
write.csv(tidy, "tidy.txt", row.names=FALSE)
