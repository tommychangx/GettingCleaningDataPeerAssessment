run_analysis <- function() {
  
  ## 1. Merges the training and the test sets to create one data set.  
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F)
  X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=F)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=F)
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F)
  X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=F)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=F)
  
  subject <- rbind(subject_train, subject_test) 
  X <- rbind(X_train, X_test)
  y <- rbind(y_train, y_test)

  
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  features <- read.table("UCI HAR Dataset/features.txt", header=F)
  colnames(X) <- features[, 2] 
  reqIndex <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
  X <- X[, reqIndex]
  colnames(X) <- gsub('\\(|\\)',"",names(X), perl = TRUE)
  colnames(X) <- gsub('\\-',"",names(X), perl = TRUE)
  colnames(X) <- gsub('\\,',"",names(X), perl = TRUE)
  
  
  ## 3. Uses descriptive activity names to name the activities in the data set
  
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)
  colnames(activity_labels) <- c("ActivityCode", "Activity")

  ## Create a seq # for Activity data, named the new col as 'Index'  
  y1 <- cbind(1:nrow(y), y)
  colnames(y1) <- c("Index", "ActivityCode")

  ## Merge it to get the activity names, cols are 'ActivityCode', 'Index', 'Activity'
  y2 <- merge(y1, activity_labels, all=TRUE)
  ## Get the Activty Col Only, and sort it in the original order by 'Index'
  activity <- y2[order(y2$Index), c(3)] 
  

  ## 4. Appropriately labels the data set with descriptive activity names. 
  colnames(subject) <- c("subject")
  resultdata <- cbind(subject, activity, X)
  
  ### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  library(data.table)
  dt <- data.table(resultdata)
  meanData <- dt[, lapply(.SD, mean), by=c("subject", "activity")]
  meanData <- meanData[order(meanData$subject),]

  write.table(meanData, "Data.txt", sep="\t")
  
  return (meanData)
 
}