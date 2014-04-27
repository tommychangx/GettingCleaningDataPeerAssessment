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


Run 'run_analysis.R' to performs cleaning up the data:

    1. Merges the training and test sets to create one data set
	import and merge "X_train.txt/X_test.txt"
    import and merge "y_train.txt/y_test.txt"  
    import and merge "subject.test.txt/subject_train.test" 

	* 10299 records are obtained
	
    2. Extracts only the measurements on the mean and standard deviation for each measurement.

	* Chooise only "mean" or "std" features from "features.txt":
	* 66 attributes are obtained as only 66 attributes are with "-mean", "-std" 

	
    3. Applies descriptive activity names to name the activities in the data set:

	* Reads activity_labels.txt
	* Use merge function to extract activity names 	

    4.  Appropriately labels the data set with descriptive activity names. 
	* Done

    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	The result is saved as data.txt, a 180x68 data frame, the first column contains subject, the second column contains activity names, and then the averages for each of the 66 attributes are in the other cols
	