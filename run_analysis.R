## The below script reads training data, test data, activity labels (for both training and test),
## volunteer ids (for both training and test) and variable names (features) from the current
## working directory.

## It then merges the training and test data, selects columns only corresponding to mean(mean) and
## standard deviation (std) values. Activity labels and volunteer ids are then added to this
## filtered data set.

## This resulting dataset is then grouped by activity and subject (volunteer) in that order
## Finally, the mean for each variable of the grouped data is calculated.

## This tidy dataset is written to the working directory

## Loading the data.table and dplyr packages
library(dplyr)
library(data.table)

## Reading the test data
test_data<-read.table('X_test.txt',header = FALSE)

## Reading the training data
training_data<-read.table('X_train.txt',header = FALSE)

## Reading the volunteer (subject) ids for test data
test_subjects<-read.table('subject_test.txt',header = FALSE)

## Reading the volunteer (subject) ids for training data
training_subjects<-read.table('subject_train.txt',header = FALSE)

## Reading the activity ids for test data
test_activities<-read.table('y_test.txt',header = FALSE)

## Reading the activity ids for training data
training_activities<-read.table('y_train.txt',header = FALSE)

## Reading the variable (feature) names
variable_names<-read.table('features.txt',header = FALSE)

## Eliminating the first column (sequence numbers) from features dataframe
variable_names[,1]<-NULL

## Assigning name to test volunter (subject) data frame 
names(test_subjects)[1]<-'Volunteer Id'

## Assigning name to training volunter (subject) data frame
names(training_subjects)[1]<-'Volunteer Id'

## Assigning name to test activity data frame 
names(test_activities)[1]<-'Activity Id'

## Assigning name to training activity data frame
names(training_activities)[1]<-'Activity Id'

## Assigning the variable names for test and training data from the features data frame
names(test_data)<-as.vector(variable_names[,1])
names(training_data)<-as.vector(variable_names[,1])

## Merging the test and training data, test and training volunteer ids, test and training 
## activity ids using rbind
complete_data<-rbind(training_data,test_data)
complete_subjects<-rbind(training_subjects,test_subjects)
complete_activities<-rbind(training_activities,test_activities)

## From the merged test and training data, we select only columns for variables corresponding to
## mean and std calculations
complete_data_meansd<-complete_data[,grepl('mean\\()|std\\()',names(complete_data))]

## After filtering dataset for mean and std, we cbind to make activity id the first column,
## volunteer id the second column followed by 66 filtered columns
final_meansd_data<-cbind(complete_activities,complete_subjects,complete_data_meansd)

## Reading the activity labels (descriptive names) into a dataframe
activity_labels<-read.table('activity_labels.txt',header = FALSE)

## Using match to assign the descriptive activity names to the first column of the merged data 
## frame wherever the id matches with the first column of avtivity ids dataframe
final_meansd_data$`Activity Id`<-activity_labels$V2[match(final_meansd_data$`Activity Id`,activity_labels$V1)]

## This dataset is then grouped by activity label followed by volunteer id. Then, it is arranged
## on activity label using '.by_group = TRUE'. Finally summarise_all is used to calculate
## mean of all variables
final_tidy_dataset<-final_meansd_data %>% group_by(`Activity Id`,`Volunteer Id`) %>% 
        arrange(`Activity Id`,.by_group=TRUE) %>% summarise_all(mean)

## The final_tidy_dataset.txt is then written to the working directory
write.table(final_tidy_dataset,'final_tidy_dataset.txt',col.names = TRUE)