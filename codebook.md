##title: codebook.md
author: Randy Catoe
date: June-22-2014
###Project attribution
This work is submitted as the course project for  the "Getting and Cleaning Data" course offered on Coursera and created by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD in association with the Johns Hopkins Blomberg School of Public Health'</P>
The project uses data from the Human Activity Recognition Using Smartphones Data Set created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
www.smartlab.ws 
###Data description
For a description of the source data see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
###Project Goals:
To combine the training and test data from the above datasets and produce a tidy data set that contains the mean values for all data in the combined test and training data set where the variables are means or standard deviations of observed data, by subject and activity. 
###Success Criteria
The resulting file, tidy.txt can be imported in R using "read.table" It meets the criteria for tidiness as described in http://vita.had.co.nz/papers/tidy-data.pdf

  1. Each variable forms a column.
  2. Each observation forms a row.
  3. Each type of observational unit forms a table.
  
###Assumptons:
  1. the target subset of variables from those contained in the features.txt file contain either the string "mean()" or the string "std()" and other variables that contain "mean" or "std" have been eliminated from the results.
  2. the correction of typographical errors in the variable names is not a desired outcome due to the resulting lack of traceability to the original work
  3. A "narrow" tidy data base is preferred for this data because of the ease of viewing a 3 column table versus a table with more columns than can be easily viewed side-by-side (see https://class.coursera.org/getdata-004/forum/thread?thread_id=262)

###Data Descriptions
The file tidyNarrow.txt has three columns as described below:

1. Subject_Activity - the script creates this variable by combining the source files with names subject_{instance}.txt and y_{instance}.txt where {instance} values comprise "test" and "train". Thus subject_test.txt values combine pairwise with y_test.txt values and subject_train.txt values combine pairwise with y_train.txt values. The index for each y_<instance> value has been replaced with the corresponding activity name from the file activity_labels.txt The resulting values, for example "10_LAYING" thus refer to the number of the subject and the name of the activity the subject when the observations were captured. In this example the group of all measurements for each variable have been grouped to calculate a mean over the group of measurements.
2. Variables - the values in the variables column represent the names of mean and standard deviation measurements from the file "features.txt" whose names have been selected because they contain 'mean()' or 'std()'. The values in variables have been made consistent with use as R variable names by removing '()' and replacing '-' with '_'. See <> for the description of these variables.
3. means - this column contains the arithmetic means of all values for each Variable value grouped by Subject_Activity.
