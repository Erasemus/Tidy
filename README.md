---
#title: "Readme.MD"
author: "Randy Catoe"
date: "June 22, 2014"
output: html_document

### Purpose of this document
This document describes the associated files run_analyses.R, tidy.txt and codebook.md
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
  1. download the zipped data files from the archive
  2. get the time of download for reference
  3. get an index to the columns that contain the target variables using  the function trgtNames , created for this purpose 
  4. 
###File Desciptions:
run_analyses.R -- 