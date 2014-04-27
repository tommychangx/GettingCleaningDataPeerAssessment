CodeBook on Human Activity Recognition Using Smartphones Data Set  

1.  Description of data 
- 30 subjects 
- Number of Attributes: 561
- 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
- 2947 of test record
- 7352 of train record


2.  How the cleaning was performed

The cleaned data was transformed from the following files:

    "features.txt": we selected only those "mean" or "std" features
    "X_train.txt/X_test.txt" : The 561-feature vector we chose only those "mean" or "std" features
    "y_train.txt" and "y_test.txt": 6 training activity labels. These 79 feature vectors are mapped to the training activity labels in these files.
    "subject.test.txt" and "subject_train.test": the subjects
    "activity_labels.txt": 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 


