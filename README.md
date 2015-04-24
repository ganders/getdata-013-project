# Getting and Cleaning Data - Project Repository

This project uses motion data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The run_analysis.R script downloads and uncompresses the data then proceeds to reshape that data into a single R dataframe that complies with the concepts of tidy data.  The script then creates a new dataset (newdf) that maintains tidy data conventions and summarizes the means of each observation by subject and activity type and finally saves that data in a text table called "q5_data.txt"

For more information on the process used to tidy the data please review code comments in run_analysis.R

### For more information on requirements, usage, process, and output, please see CodeBook.md

