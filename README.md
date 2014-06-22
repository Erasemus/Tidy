---
#title: "Readme.MD"
author: "Randy Catoe"
date: "June 22, 2014""

### Purpose of this document
This document describes the associated files run_analyses.R, tidy.txt and codebook.md
###File Desciptions:
run_analyses.R -- r source that performs all steps to produce the file tidy.txt
tidy.txt - A tidy data file that contains the project results. This file can be inported in R using "read.table"
Codebook.txt - a description of the variables in tidy.txt
###Project attribution
The files are submitted as the course project for  the "Getting and Cleaning Data" course offered on Coursera and created by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD in association with the Johns Hopkins Blomberg School of Public Health'</P>
The project uses data from the Human Activity Recognition Using Smartphones Data Set created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
www.smartlab.ws 
###Data description
For a description of the data see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
###Project Goals:
To combine the training and test data from the above datasets and produce a tidy data set that contains the mean values for all data in the combined test and training data set where the variables are means or standard deviations of observed data, by subject and activity. 
###Success Criteria
The resulting file, tidy.tx can be read inported in using "read.table" It meets the criteria for tidiness as described in http://vita.had.co.nz/papers/tidy-data.pdf

  1. Each variable forms a column.
  2. Each observation forms a row.
  3. Each type of observational unit forms a table.
  
###Assumptons:
  1. the target subset of variables from those contained in the features.txt file contain either the string "mean()" or the string "std()" and other variables that contain "mean" or "std" have been eliminated from the results.
  2. the correction of typographical errors in the variable names is not a desired outcome due to the resulting lack of traceability to the original work
  3. A "Narrow" tidy data base is preferred for this data because of the ease of viewing a 3 column table versus a table with more columns than can be easily viewed side-by-side (see https://class.coursera.org/getdata-004/forum/thread?thread_id=262)
  
###Approach: (as demonstrated in run_analyses,R)
 
  1. get an index to the columns that contain the target variables  
  2. create and clean up a vector of column names for the set of selected columns
  3. get the activity labels from the file activity_labels.txt
  4. create dataframe from the test data observations in X_test.txt
  5. create a dataframe for the activity indexes in y_test.txt
  6. create a dataframe from the subject ids for the test data from file subject_test.txt
  7. create the dataframe test by selecting the columns in the X test data that match the name criteria as recorded in the index cni
  8. create a vector, Subject_Activity,  that for each observation combines the subject id and the activity name
  9. use cbind to combine Subject_Activity vector as a column with the observation data in data frame test
  10. add the name Subject_Activity to the column names in (cn)
  11. apply the updated column names in cn to the dataframe test
  12. repeat steps 4-9 for the training data
  13. repeat step 11 for the dataframe named train produce in step 14
  14. use rbind to merge the training and test dataframes into dataframe CD
  15. Summarize CD by using dplyr and reshape2 to create a narrow tidy file by first melting CD by Subject_Activity, then grouping by Subject_activity and using summarize to apply the mean function to the grouped values
  
