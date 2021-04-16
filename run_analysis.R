url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./Dataset.zip")
unzip(zipfile="./Dataset.zip",exdir="./data")


x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


features <- read.table('./UCI HAR Dataset/features.txt')
labels = read.table('./UCI HAR Dataset/activity_labels.txt')

colnames(x_train) <- features[,2]
colnames(y_train) <-"ActId"
colnames(subject_train) <- "SubId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "ActId"
colnames(subject_test) <- "SubId"
colnames(labels) <- c('ActId','Type')


m_train <- cbind(y_train, subject_train, x_train)
m_test <- cbind(y_test, subject_test, x_test)
merged_data <- rbind(m_train, m_test)


cnames <- colnames(merged_data)
dscrb_bl <- (grepl("ActId" , colNames) | 
                 grepl("SubId" , colNames) | 
                 grepl("mean.." , colNames) | 
                 grepl("std.." , colNames) )

dscrb_data <- merged_data[,dscrb_bl==TRUE]

merged_stat <- merge(dscrb_data, labels, by='ActId', all.x=TRUE)

Tidy_data <- aggregate(. ~SubId + ActId, merged_stat, mean)
Tidy_data <- Tidy_data[order(Tidy_data$SubId, Tidy_data$ActId),]



write.table(Tidy_data, "step_5_table.txt", row.name=FALSE)
