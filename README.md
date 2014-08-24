=================================================================
Course project for Courser Course "Getting and Cleaning Data"
by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
==================================================================
In order for the script to work correctly, the data should be downloaded
from the following link, unzipped and saved in the "data" folder on the local hard drive:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

==================================================================
The R script entitled "run_analysis.R" performs the following steps:
-reads in the data
- merges the training and the test sets to create one data set
-extracts only the measurements on the mean and standard deviation for each measurement
-uses descriptive activity names to name the activities in the data set
-labels the data set with descriptive variable names
-writes the first tidy data set into the "data" folder
-creates and outputs a second, independent tidy data set with the average of each variable for each activity and each subject

The final set is tidy because it contains one observation per row, one variable per column.

=========================================

The dataset includes the following files:

- 'README.md'

- 'CODE BOOK.docx'

- 'run_analysis.R'
=========================================