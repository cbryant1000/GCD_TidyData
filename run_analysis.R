
## Coursera.org, JHU, "Getting and Cleaning Data.".
## Course Project - Run analysis script.

library(dplyr)
library(stringr)
source("../create.dataset.R")

start <- proc.time()
  # 1. Create a merged data frame containing all the relevant data.
  df <- create.dataset()
  # 2. Group the data by subject and activity.
  td <- group_by(df, subjectId, activityId, activity)
  # 3. Calculate the mean of the grouped data.
  td <- summarise_each(td, funs(mean))
  # 4. Write the summarized data to a file.
  write.table(td, file="../tidydata.txt", row.names=FALSE)
print(proc.time() - start)
