
## Coursera.org, JHU, "Getting and Cleaning Data.".
## Course Project - Run analysis script.

library(dplyr)
library(stringr)
source("../read.features.R")
source("../read.dataset.R")
source("../create.dataset.R")

## 1. Create a merged data frame containing all the relevant data.
## 2. Group the data by subject and activity.  Calculate the mean of the grouped data.
## 3. Write the summarized data to a file.
start <- proc.time()
df <- create.dataset()
tidyData <- df %>% group_by(subject_id, activity) %>% summarise_each(.,funs(mean))
write.table(tidyData, file="../tidydata.txt")
print(proc.time() - start)