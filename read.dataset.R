
## Coursera.org, JHU, "Getting and Cleaning Data."
## Course Project - read.dataset script.

## Reads a particular 'type' of data set (test or training) into a data frame.
## Combines the accelerometer, subject, and activity data into a single data frame.
read.dataset <- function(dataType, cols, names, activity_labels) {
  df <- read.features(getFileName(dataType, "X"), cols, names)
  subjects  <- read.table(getFileName(dataType, "subject"),col.names=c("subject_id"))
  activities <- read.table(getFileName(dataType, "y"),col.names=c("activity_id"))
  activities <- inner_join(activities, activity_labels, by="activity_id")
  df <- bind_cols(bind_cols(subjects, activities), df)
}

getFileName <- function(dataType, fileType) {
  paste("./",dataType,"/",fileType,"_",dataType,".txt",sep="")
}
