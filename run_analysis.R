
## Coursera.org, JHU, "Getting and Cleaning Data.".
## Course Project - R Analysis Script.

## Acknowledgements:
## 1. StackOverflow: "What is a good way to read line-by-line in R?"
##    fehttp://stackoverflow.com/questions/4106764/what-is-a-good-way-to-read-line-by-line-in-r

library(dplyr)
library(stringr)

features <- read.table("features.txt",col.names=c("id","quantity"))
cols <- sort(c(grep(".*mean\\(.*",features$quantity),grep(".*std\\(.*",features$quantity)))
feature_names <- as.character(filter(features, id %in% cols)$quantity)
names <- c("subject","activity",feature_names)
activities <- read.table("activity_labels.txt",col.names=c("id","label"))

con_X  <- file("./test/X_test.txt", open = "r")
con_sub  <- file("./test/subject_test.txt", open = "r")
con_y  <- file("./test/y_test.txt", open = "r")

df <- data.frame()

while (length(line_X <- readLines(con_X, n = 1, warn = FALSE)) > 0) {
  line_X <- unlist(strsplit(line_X," "))
  line_X <- as.numeric(line_X[line_X != ""])
  line_X <- line_X[cols]
  line_sub <- readLines(con_sub, n = 1, warn = FALSE)
  line_y <- readLines(con_y, n = 1, warn = FALSE)
  row <- data.frame(line_sub, line_y, t(line_X))
  df <- bind_rows(df, row)
} 

names(df) <- names

close(con_X)
close(con_sub)
close(con_y)
