# Getting and cleaning data course project

This repository contains the following files:

* run_analysis.R
* codebook.md
* README.md

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below,
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

Run the R run_analysis.R script to perform the following actions over the UCI HAR Dataset:

* Merge test and train from x,y and subject data
* Extract only the mean and standard deviation for each measurement
* Appropriately labels the dataset with descriptive variable names
* Uses descriptive activity names to name the activities in the data set
* Group by activity and subject, aggregate by average and create a tidy csv from the result
