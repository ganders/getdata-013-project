library(dplyr)
library(tidyr)

if (!file.exists("data")) {
  dir.create("data")
}

if (!file.exists("data/UCI HAR Dataset")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = "data/UCI HAR Dataset.zip",
                method = "curl")
  unzip("data/UCI HAR Dataset.zip", exdir="data/")
  download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names",
                destfile = "data/dataset_names.txt",
                method = "curl")
}

# read feature names into table turn column 2 into a vector of names
feature_names <- read.table("data/UCI HAR Dataset/features.txt")
feature_names <- as.vector(feature_names$V2)

# remove annoying () and in column names
feature_names <- gsub("[\\(\\)]", "", feature_names)

# replace dashes and commas in names with underscore
feature_names <- gsub("[\\-\\,]","_", feature_names)

# I don't like it, but it seems they want variables in lower case
feature_names <- tolower(feature_names)

# get the column names containing "mean" or "std".
filtered_names <- grep("mean|std", feature_names, value = TRUE)

# read X Training data into table
x_train_data <- read.table("data/UCI HAR Dataset/train/X_train.txt")

# read X Test data into table
x_test_data <- read.table("data/UCI HAR Dataset/test/X_test.txt")

###### SATISFIES #4 ######
# apply column names to x_train_data and x_test_data
names(x_train_data) <- feature_names
names(x_test_data) <- feature_names

###### SATISFIES #2 ######
# filter for only needed columns (remove all but mean and std)
# resorting to old fashioned techniques to avoid dplyr frustations
x_train_data <- x_train_data[,filtered_names]
x_test_data <- x_test_data[,filtered_names]

# Now let's load the y_tests (activity)
y_train_data <- read.table("data/UCI HAR Dataset/train/y_train.txt")
y_test_data <- read.table("data/UCI HAR Dataset/test/y_test.txt")

# Add variable names
names(y_train_data) <- c("activity")
names(y_test_data) <- c("activity")

# And the subject IDs
train_subject_id <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
test_subject_id <- read.table("data//UCI HAR Dataset/test/subject_test.txt")

# Variable name
names(train_subject_id) <- c("subject_id")
names(test_subject_id) <- c("subject_id")

# Add the 2 new columns to the dataframes
train_df <- cbind(y_train_data, x_train_data)
train_df <- cbind(train_subject_id, train_df)

test_df <- cbind(y_test_data, x_test_data)
test_df <- cbind(test_subject_id, test_df)

###### SATISFIES #1 ######
# Merge the two dataframes
mydf <- rbind(train_df, test_df)

# sort it to make it pretty
mydf <- arrange(mydf, subject_id, activity)

###### SATISFIES #3 ######
# Create factor for activities
activities <- read.table("data/UCI HAR Dataset/activity_labels.txt")
activity_factor <- factor(activities$V2, levels = activities$V2)
mydf <- mutate(mydf, activity = activity_factor[activity])

###### SATISFIES #5 ######
# create new dataframe of same data grouped by subject_id and activity
# new dataframe contains summary of all means by above groups
newdf <- group_by(mydf, subject_id, activity)
newdf <- summarise_each(newdf, funs(mean))

write.table(newdf, "q5_data.txt", row.name=FALSE)