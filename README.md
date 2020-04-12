# Getting-and-Cleaning-Data-Week-4-Assignment
Respository for Getting and Cleaning Data Week 4 Assignment

# The repository contains the code, output, Readme and Codebook for the Getting and Cleaning Data assignment from Week 4.

# Having the data files in your current working directory
The files needed are: X_test.txt (test data), X_train.txt (training data), y_test.txt (activity ids for test data), y_train.txt (acivity ids for training data), subject_test.txt (subject/volunteer id for test data), subject_train.txt (subject/volunteer id for training data), features.txt (561 variables), activity_labels.txt (descriptive names of activities). read.table function is used for this

The zip file from the assignment link can be downloaded, extracted into the working directory.

# Code for data manipulation and cleaning

data.table and dplyr packages are loaded.

Reading the above .txt files (8 in number) into appropriately named dataframes.

Both activity id dataframes (test and training) are given column name 'Activity Id'.

Both volunteer id dataframes (test and training) are given column name 'Volunteer Id'.

Both test and training dataframes are given column names corresponding to the values in features dataframe.

test and training activity dataframes are merged into one dataframe using rbind.

test and training volnteer (subject) dataframes are merged into one dataframe using rbind.

test and training data are merged into one dataframe using rbind. Let's call this merged dataframe
in this Readme file.

The merged dataframe columns are filtered for only mean() and std () {standard deviation} variables. These are 66 in number.

The combined activity dataframe, volunteer dataframe and the filtered dataframe are cbind with activity id being the first column, volunteer id being the second and then the 66 variables.

activity ids are matched with the activity label dataframe and the corresponding descriptive names are given to activity id column.

This final dataset is then grouped by activity id, volunteer id and then sorted on the grouped activity id. Finally a mean for all variables is calculated. This will result in 180 rows and 68 columns.

The resulting dataset can then be written to a text file using write.table function.
