
# GCD_TidyData
## Coursera, JHU, Getting and Cleaning Data - Course Project

> This file is the *Code Book* for the JHU Coursera "Getting and Cleaning Data" course project.

### Variables and Data
The data for this project is well-described by the following two files in the UCI HAR data set archive file.  
1. [README.txt](https://github.com/cbryant1000/GCD_TidyData/blob/master/UCI_HAR_Dataset/README.txt)  
2. [features_info.txt](https://github.com/cbryant1000/GCD_TidyData/blob/master/UCI_HAR_Dataset/features_info.txt)  

The data for this project is available here: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### Transformations
1. For each of the sets of data, test and training (read.features.R, read.dataset.R),
  + The accelerometer data files were read *line-by-line.*  
  + The columns for the mean and std were extracted from each line of data.  
  + The remaining columns were accumulated in a data frame.
2. The test and training data frames were combined into a single data frame (create.dataset.R)
  + The subject and activity data were added to the combined data frame.  
3. The combined data set was grouped by the subject and activity variables.
  + The mean was calculated on the grouped data.
  + The summarized data was written to a *tidy data* file.