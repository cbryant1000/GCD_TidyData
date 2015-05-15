
## Coursera.org, JHU, "Getting and Cleaning Data.".
## Course Project - Run analysis script.

library(dplyr)
library(stringr)
source("../create.dataset.R")

## 1. Create a merged data frame containing all the relevant data.
## 2. Group the data by subject and activity.  Calculate the mean of the grouped data.
## 3. Write the summarized data to a file.
start <- proc.time()
  df <- create.dataset()
  td <- group_by(df, subjectId, activityId, activity)
  td <- summarise_each(td, funs(mean))
  write.table(td, file="../tidydata.txt", row.names=FALSE)
print(proc.time() - start)
