
## Coursera.org, JHU, "Getting and Cleaning Data.".
## Course Project - Create a merged data set script.

source("../read.dataset.R")

create.dataset <- function() {

  ## Read the feature list, and subset by the mean and std variable names.
  featureNames <- read.table("features.txt", col.names=c("id","quantity"), stringsAsFactors=FALSE)$quantity
  cols <- grep(".*mean\\(.*|.*std\\(.*", featureNames,value=FALSE)
  names <- featureNames[cols]
  activityLabels <- read.table("activity_labels.txt", col.names=c("activityId","activity"), stringsAsFactors=FALSE)
  
  ## Read the test and training data sets.  Combine and sort them into a single data frame.
  df <- read.dataset("test", cols, names, activityLabels)
  df <- bind_rows(df, read.dataset("train", cols, names, activityLabels))
  arrange(df, subjectId, activityId)
}
