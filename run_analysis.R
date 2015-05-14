
## Coursera.org, JHU, "Getting and Cleaning Data.".
## Course Project - Run analysis script.

library(dplyr)
library(stringr)
source("../read.features.R")
source("../read.dataset.R")

## Read the feature list, and subset by the mean and std variable names.
features <- read.table("features.txt",col.names=c("id","quantity"))
cols <- sort(c(grep(".*mean\\(.*",features$quantity),grep(".*std\\(.*",features$quantity)))
names <- as.character(filter(features, id %in% cols)$quantity)
activity_labels <- read.table("activity_labels.txt",col.names=c("activity_id","activity"))

## Read the test and training data sets.  Combine and sort them into a single data frame.
df_test <- read.dataset("./test/X_test.txt", "./test/subject_test.txt", "./test/y_test.txt", cols, names, activity_labels)
df_train <- read.dataset("./train/X_train.txt", "./train/subject_train.txt", "./train/y_train.txt", cols, names, activity_labels)
df <- bind_rows(df_test, df_train)
df <- arrange(df, subject_id, activity_id)
