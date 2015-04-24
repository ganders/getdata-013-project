# Getting and Cleaning Data - Project Repository

This project retrieves motion data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  

The run_analysis.R script then proceeds to reshape that data into a single R dataframe that complies with the concepts of tidy data.  The script then creates a new dataset (newdf) that maintains tidy data property and summarizes the means of each observation by subject and activity type.

For more information on the data please see CodeBook.md

