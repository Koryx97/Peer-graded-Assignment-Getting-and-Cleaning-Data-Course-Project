## Getting and Cleaning Data: peer assessment project

## The original data was transformed by

1. Merging the original test and train datasets to create one data set.
2. Extracting the measurements that their mean and standard deviation could be calculated. 
3. Using descriptive activity names to name the activities in the data set
4. Labeling the data set with descriptive activity names. 
5. Creating a new independent tidy data set with the average of each variable for each activity and each subject. 

## About R script
File with R code "run_analysis.R" perform the steps above

## About variables:   
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in
