# Codebook for Getting and Cleaning Data project


#### Input Data
The data used in this project is from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and can be downloaded at:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##### Notes:
Please view the following files in the source data archive for information on source data format, variables, etc.

* UCI HAR Dataset/README.txt
* UCI HAR Dataset/features_info.txt

The source contains two sets of data, a training set, and a testing set.

#### Changes to Data

1.  The column names, or features, are first tidied up by expanding most abbreviations to full words, adding appropriate separations, removing punctuations and other characters that are inappropriate.

2.  The "subject_id" and "activity" columns are then added to the test and training datasets.

3.  The training and test datasets are concatenated into a complete dataset containing all observations.

4.  A new dataset (newdf) is created extracting all columns that contain "mean" or "std"

5.  This dataset is then populated by calculating the mean for all observations by the subject_id AND activity

6.  The new dataset is written out to a plaintext table, "q5_data.txt" per project instructions.

#### Notes

##### For a far more detailed explanation of the tasks performed please view the code comments in run_analysis.R