
## Coursera.org, JHU, "Getting and Cleaning Data.".
## Course Project - Create a merged data set script.

create.dataset <- function() {

  ## Read the feature list, and subset by the mean and std variable names.
  features <- read.table("features.txt",col.names=c("id","quantity"))
  cols <- sort(c(grep(".*mean\\(.*",features$quantity),grep(".*std\\(.*",features$quantity)))
  names <- as.character(filter(features, id %in% cols)$quantity)
  activity_labels <- read.table("activity_labels.txt",col.names=c("activity_id","activity"))
  
  ## Read the test and training data sets.  Combine and sort them into a single data frame.
  df <- read.dataset("test", cols, names, activity_labels)
  df_train <- read.dataset("train", cols, names, activity_labels)
  df <- bind_rows(df, df_train)
  df <- arrange(df, subject_id, activity_id)
}
