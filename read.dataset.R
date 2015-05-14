
## Coursera.org, JHU, "Getting and Cleaning Data."
## Course Project - read.dataset script.

read.dataset <- function(featureFile, subjectFile, activityFile, cols, names, activity_labels) {
  df <- read.features(featureFile, cols, names)
  subjects  <- read.table(subjectFile,col.names=c("subject_id"))
  activities <- read.table(activityFile,col.names=c("activity_id"))
  activities <- inner_join(activities, activity_labels, by="activity_id")
  df <- bind_cols(bind_cols(subjects, activities), df)
}
