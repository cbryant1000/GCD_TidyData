
## Coursera.org, JHU, "Getting and Cleaning Data."
## Course Project - read.features script.

## Acknowledgements:
## 1. StackOverflow: "What is a good way to read line-by-line in R?"
##    http://stackoverflow.com/questions/4106764/what-is-a-good-way-to-read-line-by-line-in-r

read.features <- function(fileName, cols, names) {

  df <- data.frame()
  con_X  <- file(fileName, open = "r")
  
  while (length(line_X <- readLines(con_X, n = 1, warn = FALSE)) > 0) {
    line_X <- unlist(strsplit(line_X," "))
    line_X <- as.numeric(line_X[line_X != ""])
    line_X <- line_X[cols]
    df <- bind_rows(df, data.frame(t(line_X)))
  } 
  
  close(con_X)
  names(df) <- names
  df
}
