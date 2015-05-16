
# GCD_TidyData
## Coursera, JHU, Getting and Cleaning Data - Course Project

![](readme.scripts.png)

#### R Scripts for this Project
  
Script | Description | Calls
------ | ----------- | -----
run_analysis.R | This is the top-level R script to perform the analysis for this project. Creates a merged data frame containing all the relevant data. Groups the data by subject and activity.  Calculates the mean of the grouped data.  Writes the summarized data to a file.| create.dataset.R 
create.dataset.R | Reads the feature list, and determines the subset indices for the mean and std variables.  Reads and combines the test and training data frames. | read.dataset.R
read.dataset.R | Reads a particular 'type' of data set (test or training) into a data frame.  Combines the accelerometer, subject, and activity data into a single data frame. | read.features.R, getFileName
read.features.R | Reads the accelerometer data, line by line.  Subsets by the mean and std variable names, and stores the results in a data frame. | &lt;_None_&gt;  

**Note:** The test and training data sets are so large, that R and RStudio crashed, when I tried to read in the accelerometer data.  That is the reason for the line-by-line approach.  

I later learned (from the forums), that read.table can read the file.  I tried a read.fwf solution.  But, the line-by-line approach has turned out to be the fastest, so far.
