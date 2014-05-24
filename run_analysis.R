
## This program assumes the necessary files have been downloaded to local
## working directory and uncompressed 
## Program assumes that the reshape2 package has been installed

library(reshape2)

##
## Set the working directory to the 
## 

setwd( 'C:/Users/lrich_000/Desktop/Data Science/Git/UCI HAR Dataset')


##
##  - Read the features data set to get the column headers for test and
##    train 
##  - Read the activity labels
##

features  <- read.table('./features.txt', header = FALSE)
activity.labels <- read.table('./activity_labels.txt', col.names=c('Activity_ID', 'Activity_Name'))

##
##  - Read the X training and test data sets and bind together 
##  - Read the y training and test data sets and bind together 
##  - Read the subject training and test data sets and bind together
##

train.X   <- read.table('./train/X_train.txt', col.names=features[,2])
test.X    <- read.table('./test/X_test.txt', col.names=features[,2])
merge.X   <- rbind(train.X, test.X)

train.y   <- read.table('./train/y_train.txt', col.names = c('Activity_Name'))
test.y    <- read.table('./test/y_test.txt', col.names = c('Activity_Name'))
merge.y   <- rbind(train.y, test.y)

test.subject  <- read.table('./test/subject_test.txt', col.names = c('Subject'))
train.subject <- read.table('./train/subject_train.txt', col.names = c('Subject'))
merge.subject <- rbind(train.subject, test.subject)


##
##  - Extract the mean and standard deviation measurements features 
##    and apply to the merged dataset 
##  - Update the activity to meaningful names  
##
##  - Extract the mean and the standard deviation measurements
##  - Convert activity labels to meaningful names, Standing, Walking, etc

valid.features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
mean.std.X <- merge.X[,valid.features]
merge.y$Activity_Name <- activity.labels[merge.y$Activity_Name,2] 



##
##  - Add the subject and activity labels to the full merged data set and ##    to the data set with the mean and standard deviation attributes 
##


merge.X.labeled    <- cbind(merge.subject, merge.y, merge.X)
mean.std.X.labeled <- cbind(merge.subject, merge.y, mean.std.X)


##  - Melt and recast the data applying mean to each of the measurements


  ids <- c("Subject", "Activity_Name")
  measures <- setdiff(colnames(mean.std.X.labeled), ids)
  melted_data <- melt(mean.std.X.labeled, id=ids, measure.vars=measures)
  averages.data <- dcast(melted_data, Subject + Activity_Name ~ variable, mean)   

    


##  - Write the resulting averages data set

write.table(averages.data, "step5_averages.txt", sep='\t')












