The script performs operation described in project:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Variables
trainingValues, trainingLabels, trainingSubjects, testValues, testLabels, testSubjects - data from downloaded files
activityLabels - activities names form files
values, labels, subjectsData - merged data
features - correct names for values data set
meanData - data set with mean data, which are later stored in file
