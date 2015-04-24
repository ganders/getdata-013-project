# Codebook for Getting and Cleaning Data project

#### Requirements
* R
* R Package "dplyr"
* R Package "tidyr"

#### Input Data
The data used in this project is from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and can be downloaded at:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##### Notes:
Please view the following files in the source data archive for information on source data format, variables, etc.

* UCI HAR Dataset/README.txt

The source contains two sets of data, a training set, and a testing set.  These are concatenated as part of the processing of this script (see below)

#### Usage
  The run_analysis.R script is self contained and will download, uncompress, and completely process all data in accordance with project instructions.
  
  To execute from a command prompt where R is installed:
  
  <i>$ R < run_analysis.R --no-save</i>
  
#### Process

The primary function is to load the raw data and construct a dataset that complies with tidy data principles and then use this dataset to generate a derivative dataset showing the arithmatic mean for each set of observations by subject and activity.

##### Please view code comments in run_analysis.R for very detailed notes on the process. 

#### Output
A new dataset (q5_data.txt) is created with the following:

* subject_id : identifyies which of the 30 participants the observations represent.
* activity : represents which of the 6 activities the following observations represent.
* tbodyacc-mean-x . . . :  Please see the source data notes for definitions of observation variables.
