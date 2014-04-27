CodeBook on Human Activity Recognition Using Smartphones Data Set  

1.  Description of data 

The data is downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In the data, 
- 30 subjects (30 volunteers)
- Number of Attributes: 561
- 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
- 7352 of train records
- 2947 of test records


2.  How the cleaning was performed

The cleaned data was transformed from :

    "activity_labels.txt": The mapping of activities code to values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
    "features.txt": choose only "mean" or "std" features
    "X_train.txt/X_test.txt" : The 561-feature vector but we chose only those "mean" or "std" features
    "y_train.txt/y_test.txt" : Activity label 
    "subject.test.txt/subject_train.test" : An identifier of the subject who carried out the experiment


