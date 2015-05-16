
## Coursera.org, JHU, "Getting and Cleaning Data."
## Course Project - read.features script.

## Acknowledgements:
## 1. StackOverflow: "What is a good way to read line-by-line in R?"
##    http://stackoverflow.com/questions/4106764/what-is-a-good-way-to-read-line-by-line-in-r

read.features <- function(fileName, cols, names) {

  df <- data.frame()
  con  <- file(fileName, open = "r")
  
  while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
    v <- sapply(16*cols, function(col) { as.numeric(substr(line, col-15, col)) })
    df <- bind_rows(df, data.frame(t(v)))
  } 
  
  close(con)
  names(df) <- names
  df
}
