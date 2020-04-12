# Tidy Dataset

The name of the final tidy dataset associated with this codebook is final_tidy_dataset.txt

# Description of Tidy Dataset

It has column names 1. Activity Id, 2. Volunteer Id and then followed by 66 variable columns corresponding to MEAN - mean() and STANDARD DEVIATION - std() calculations. The names are those contained in the features.txt file.

The first column of the final tidy dataset is of class factor.
The second column of the final tidy dataset is of class integer.
The remaining 66 columns are of class numeric.

In all, there are 180 rows and 68 columns. The dataset is grouped by activity id and then by volunteer id. Since, there are 6 activities and 30 volunteers. The total records are 180 in number. The 66 variables have the average values for each variable (by activity and volunteer grouping). The dataset is also sorted on the activity id column.

The activity id contains the names of eah activity: Laying, Standing, Sitting, Walking_Downstairs,
Walking_Upstairs and Walking. These are contained in activity_labels.txt

The columns have been given descriptive names.

1. The first column for activities is called Activity Id
2. The second colmn is called Volunteer Id (1 to 30)

The next 66 columns for variables corresponding to mean and std (Standard Deviation) are:

"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y" 
"tGravityAcc-mean()-Z" 
"tGravityAcc-std()-X" 
"tGravityAcc-std()-Y" 
"tGravityAcc-std()-Z" 
"tBodyAccJerk-mean()-X" 
"tBodyAccJerk-mean()-Y" 
"tBodyAccJerk-mean()-Z" 
"tBodyAccJerk-std()-X" 
"tBodyAccJerk-std()-Y" 
"tBodyAccJerk-std()-Z" 
"tBodyGyro-mean()-X" 
"tBodyGyro-mean()-Y" 
"tBodyGyro-mean()-Z" 
"tBodyGyro-std()-X" 
"tBodyGyro-std()-Y" 
"tBodyGyro-std()-Z" 
"tBodyGyroJerk-mean()-X" 
"tBodyGyroJerk-mean()-Y" 
"tBodyGyroJerk-mean()-Z" 
"tBodyGyroJerk-std()-X" 
"tBodyGyroJerk-std()-Y" 
"tBodyGyroJerk-std()-Z" 
"tBodyAccMag-mean()"
"tBodyAccMag-std()" 
"tGravityAccMag-mean()" 
"tGravityAccMag-std()" 
"tBodyAccJerkMag-mean()" 
"tBodyAccJerkMag-std()" 
"tBodyGyroMag-mean()" 
"tBodyGyroMag-std()" 
"tBodyGyroJerkMag-mean()" 
"tBodyGyroJerkMag-std()" 
"fBodyAcc-mean()-X" 
"fBodyAcc-mean()-Y" 
"fBodyAcc-mean()-Z" 
"fBodyAcc-std()-X" 
"fBodyAcc-std()-Y" 
"fBodyAcc-std()-Z" 
"fBodyAccJerk-mean()-X" 
"fBodyAccJerk-mean()-Y" 
"fBodyAccJerk-mean()-Z" 
"fBodyAccJerk-std()-X" 
"fBodyAccJerk-std()-Y" 
"fBodyAccJerk-std()-Z" 
"fBodyGyro-mean()-X" 
"fBodyGyro-mean()-Y" 
"fBodyGyro-mean()-Z" 
"fBodyGyro-std()-X" 
"fBodyGyro-std()-Y" 
"fBodyGyro-std()-Z" 
"fBodyAccMag-mean()" 
"fBodyAccMag-std()" 
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-std()" 
"fBodyBodyGyroMag-mean()" 
"fBodyBodyGyroMag-std()" 
"fBodyBodyGyroJerkMag-mean()" 
"fBodyBodyGyroJerkMag-std()"

# Process Followed

# Reading data into dataframes

The files needed are: X_test.txt (test data), X_train.txt (training data), y_test.txt (activity ids for test data), y_train.txt (acivity ids for training data), subject_test.txt (subject/volunteer id for test data), subject_train.txt (subject/volunteer id for training data), features.txt (561 variables), activity_labels.txt (descriptive names of activities). read.table function is used for this.

Reading the above .txt files (8 in number) into appropriately named dataframes.

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

Both activity id dataframes (test and training) are given column name 'Activity Id'.

## Assigning name to test activity data frame 
names(test_activities)[1]<-'Activity Id'

## Assigning name to training activity data frame
names(training_activities)[1]<-'Activity Id'

Both volunteer id dataframes (test and training) are given column name 'Volunteer Id'.

## Assigning name to test volunter (subject) data frame 
names(test_subjects)[1]<-'Volunteer Id'

## Assigning name to training volunter (subject) data frame
names(training_subjects)[1]<-'Volunteer Id'

Both test and training dataframes are given column names corresponding to the values in features dataframe.

## Assigning the variable names for test and training data from the features data frame
names(test_data)<-as.vector(variable_names[,1])
names(training_data)<-as.vector(variable_names[,1])

## Merging the test and training data, test and training volunteer ids, test and training 
## activity ids using rbind

test and training activity dataframes are merged into one dataframe using rbind.

complete_activities<-rbind(training_activities,test_activities)

test and training volnteer (subject) dataframes are merged into one dataframe using rbind.

complete_subjects<-rbind(training_subjects,test_subjects)

test and training data are merged into one dataframe using rbind. Let's call this merged dataframe in this codebook file.

complete_data<-rbind(training_data,test_data)

The merged dataframe columns are filtered for only mean() and std () {standard deviation} variables. These are 66 in number.

## From the merged test and training data, we select only columns for variables corresponding to
## mean and std calculations
complete_data_meansd<-complete_data[,grepl('mean\\()|std\\()',names(complete_data))]

The combined activity dataframe, volunteer dataframe and the filtered dataframe are cbind with activity id being the first column, volunteer id being the second and then the 66 variables.

## After filtering dataset for mean and std, we cbind to make activity id the first column,
## volunteer id the second column followed by 66 filtered columns
final_meansd_data<-cbind(complete_activities,complete_subjects,complete_data_meansd)

activity ids are matched with the activity label dataframe and the corresponding descriptive names are given to activity id column.

## Using match to assign the descriptive activity names to the first column of the merged data 
## frame wherever the id matches with the first column of avtivity ids dataframe
final_meansd_data$`Activity Id`<-activity_labels$V2[match(final_meansd_data$`Activity Id`,activity_labels$V1)]

This final dataset is then grouped by activity id, volunteer id and then sorted on the grouped activity id. Finally a mean for all variables is calculated. This will result in 180 rows and 68 columns.

## This dataset is then grouped by activity label followed by volunteer id. Then, it is arranged
## on activity label using '.by_group = TRUE'. Finally summarise_all is used to calculate
## mean of all variables
final_tidy_dataset<-final_meansd_data %>% group_by(`Activity Id`,`Volunteer Id`) %>% 
        arrange(`Activity Id`,.by_group=TRUE) %>% summarise_all(mean)

The resulting dataset can then be written to a text file using write.table function.

## The final_tidy_dataset.txt is then written to the working directory
write.table(final_tidy_dataset,'final_tidy_dataset.txt',col.names = TRUE,row.names = FALSE)