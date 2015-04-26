require(plyr)
setwd("c:/Coursera/Project")
getwd()
trainingValues <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

testValues <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# merge values
values <- rbind(trainingValues, testValues)

# merge labels
labels <- rbind(trainingLabels, testLabels)

# merge subjects
subjectsData <- rbind(trainingSubjects, testSubjects)
features <- read.table("UCI HAR Dataset/features.txt")

# select columns with mean() or std()
selectedCols <- grep("-(mean|std)\\(\\)", features[, 2])
values <- values[, selectedCols]
names(values) <- features[selectedCols, 2]

# update values with correct activity names
labels[, 1] <- activityLabels[labels[, 1], 2]
names(labels) <- "Activity"
names(subjectsData) <- "Subject"

dataAll <- cbind(values, labels, subjectsData)
# create data set with mean and save it to the file
meanData = ddply(dataAll, c("Subject","Activity"), numcolwise(mean))
write.table(meanData, "meanData.txt", row.name=FALSE)

