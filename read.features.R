
## Coursera.org, JHU, "Getting and Cleaning Data."
## Course Project - read.features script.

## Acknowledgements:
## 1. StackOverflow: "What is a good way to read line-by-line in R?"
##    http://stackoverflow.com/questions/4106764/what-is-a-good-way-to-read-line-by-line-in-r

read.features <- function(fileName, cols) {

  df <- data.frame()
  con  <- file(fileName, open = "r")
  
  while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
    line <- as.numeric(substring(line,  seq(1, nchar(line)-15, 16), seq(16, nchar(line), 16)))[cols]
    #line <- unlist(strsplit(line," "))
    #line <- as.numeric(line[line != ""])
    #line <- line[cols]
    df <- bind_rows(df, data.frame(t(line)))
  } 
  
  close(con)
  df
}
