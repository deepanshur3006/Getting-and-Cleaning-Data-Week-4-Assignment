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

"TimeDomainBodyAccelerometer-mean()-X"
"TimeDomainBodyAccelerometer-mean()-Y"
"TimeDomainBodyAccelerometer-mean()-Z"
"TimeDomainBodyAccelerometer-std()-X"
"TimeDomainBodyAccelerometer-std()-Y"
"TimeDomainBodyAccelerometer-std()-Z"
"TimeDomainGravityAccelerometer-mean()-X"
"TimeDomainGravityAccelerometer-mean()-Y" 
"TimeDomainGravityAccelerometer-mean()-Z" 
"TimeDomainGravityAccelerometer-std()-X" 
"TimeDomainGravityAccelerometer-std()-Y" 
"TimeDomainGravityAccelerometer-std()-Z" 
"TimeDomainBodyAccelerometerJerk-mean()-X" 
"TimeDomainBodyAccelerometerJerk-mean()-Y" 
"TimeDomainBodyAccelerometerJerk-mean()-Z" 
"TimeDomainBodyAccelerometerJerk-std()-X" 
"TimeDomainBodyAccelerometerJerk-std()-Y" 
"TimeDomainBodyAccelerometerJerk-std()-Z" 
"TimeDomainBodyGyroscope-mean()-X" 
"TimeDomainBodyGyroscope-mean()-Y" 
"TimeDomainBodyGyroscope-mean()-Z" 
"TimeDomainBodyGyroscope-std()-X" 
"TimeDomainBodyGyroscope-std()-Y" 
"TimeDomainBodyGyroscope-std()-Z" 
"TimeDomainBodyGyroscopeJerk-mean()-X" 
"TimeDomainBodyGyroscopeJerk-mean()-Y" 
"TimeDomainBodyGyroscopeJerk-mean()-Z" 
"TimeDomainBodyGyroscopeJerk-std()-X" 
"TimeDomainBodyGyroscopeJerk-std()-Y" 
"TimeDomainBodyGyroscopeJerk-std()-Z" 
"TimeDomainBodyAccelerometerMagnitude-mean()"
"TimeDomainBodyAccelerometerMagnitude-std()" 
"TimeDomainGravityAccelerometerMagnitude-mean()" 
"TimeDomainGravityAccelerometerMagnitude-std()" 
"TimeDomainBodyAccelerometerJerkMagnitude-mean()" 
"TimeDomainBodyAccelerometerJerkMagnitude-std()" 
"TimeDomainBodyGyroscopeMagnitude-mean()" 
"TimeDomainBodyGyroscopeMagnitude-std()" 
"TimeDomainBodyGyroscopeJerkMagnitude-mean()" 
"TimeDomainBodyGyroscopeJerkMagnitude-std()" 
"FrequencyDomainBodyAccelerometer-mean()-X" 
"FrequencyDomainBodyAccelerometer-mean()-Y" 
"FrequencyDomainBodyAccelerometer-mean()-Z" 
"FrequencyDomainBodyAccelerometer-std()-X" 
"FrequencyDomainBodyAccelerometer-std()-Y" 
"FrequencyDomainBodyAccelerometer-std()-Z" 
"FrequencyDomainBodyAccelerometerJerk-mean()-X" 
"FrequencyDomainBodyAccelerometerJerk-mean()-Y" 
"FrequencyDomainBodyAccelerometerJerk-mean()-Z" 
"FrequencyDomainBodyAccelerometerJerk-std()-X" 
"FrequencyDomainBodyAccelerometerJerk-std()-Y" 
"FrequencyDomainBodyAccelerometerJerk-std()-Z" 
"FrequencyDomainBodyGyroscope-mean()-X" 
"FrequencyDomainBodyGyroscope-mean()-Y" 
"FrequencyDomainBodyGyroscope-mean()-Z" 
"FrequencyDomainBodyGyroscope-std()-X" 
"FrequencyDomainBodyGyroscope-std()-Y" 
"FrequencyDomainBodyGyroscope-std()-Z" 
"FrequencyDomainBodyAccelerometerMagnitude-mean()" 
"FrequencyDomainBodyAccelerometerMagnitude-std()" 
"FrequencyDomainBodyAccelerometerJerkMagnitude-mean()" 
"FrequencyDomainBodyAccelerometerJerkMagnitude-std()" 
"FrequencyDomainBodyGyroscopeMagnitude-mean()" 
"FrequencyDomainBodyGyroscopeMagnitude-std()" 
"FrequencyDomainBodyGyroscopeJerkMagnitude-mean()" 
"FrequencyDomainBodyGyroscopeJerkMagnitude-std()"

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
        
The names of the columns of the final dataset are made more readbale using gsub.

## The variable names are made more readbale using the gsub fucntion
names(final_tidy_dataset) <- gsub('^t', 'TimeDomain', names(final_tidy_dataset))
names(final_tidy_dataset) <- gsub('^f', 'FrequencyDomain', names(final_tidy_dataset))
names(final_tidy_dataset) <- gsub('Acc', 'Accelerometer', names(final_tidy_dataset))
names(final_tidy_dataset) <- gsub('Gyro', 'Gyroscope', names(final_tidy_dataset))
names(final_tidy_dataset) <- gsub('Mag', 'Magnitude', names(final_tidy_dataset))
names(final_tidy_dataset) <- gsub('BodyBody', 'Body', names(final_tidy_dataset))

The resulting dataset can then be written to a text file using write.table function.

## The final_tidy_dataset.txt is then written to the working directory
write.table(final_tidy_dataset,'final_tidy_dataset.txt',col.names = TRUE,row.names = FALSE)