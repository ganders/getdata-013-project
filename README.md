# Coursera - Getting and Cleaning Data - Course Project


#### Description
This project uses motion data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The run_analysis.R script downloads and uncompresses the data then proceeds to reshape that data into a single R dataframe that complies with the concepts of tidy data.  The script then creates a new dataset (newdf) that maintains tidy data conventions and summarizes the means of each observation by subject and activity type and finally saves that data in a text table called "q5_data.txt"


#### Requirements
* R (3.2.0+)
* R Package "dplyr"
* R Package "tidyr"

#### Usage
  The run_analysis.R script is self contained and will download, uncompress, and completely process all data in accordance with project instructions.
  
  To execute from a command prompt where R is installed:
  
  <i>$ R < run_analysis.R --no-save</i>

#### Notes

##### Please view code comments in run_analysis.R for very detailed notes on the process.

##### For more information data dictionary and operations performed to tidy the data please see CodeBook.md

