##need these packages for summarization
require(dplyr)
require(reshape2)
## Download files and record time
## location of data
dlink<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##
## download and unzip the file
##
#
## Create a temporary directory to hold the zipfile
##
temp <- tempfile()
## 
zipdest<-paste(temp,"data.zip",sep="/")
## Download the file
##
print("Downloading Zip file")
## 
download.file(dlink,zipdest,method="curl")
zipfile <- list.files(temp)
##
##Create a name for the dir where we'll unzip
##
zipdir <- tempfile()
##
##Create the dir using the temp name
##
dir.create(zipdir)
# Unzip the file into the dir
unzip(zipfile, exdir=zipdir)
unlink(temp)
print(zipfile)
##
##set the directory to the main level
##
##setwd("~/Documents/CourseraData ScienceHopkins/UCI HAR Dataset")
##
##get the feature names
##
features<-read.table("features.txt")
##
## get the index for the subset of columns that contain 'mean()' or 'std()
##
cni<-getTgtColNames(as.character(features[,2]))
##
## create the column names variable (cn) from the chosen columns in the column index and
## clean up the names by removing parentheses 
##
cn<-gsub("\\(\\)","",features[cni,2])
##
##change dashes to underscores
##
cn<-gsub("\\-","_",cn)
##
##get the activity labels 
##
aLabels<-read.table("activity_labels.txt")
##
## get the test x and y (y is the activity type) data
##
setwd("test")
test_x<-read.table("X_test.txt")
test_y<-read.table("y_test.txt")
##
## get the subject ID 
##
testSub_id<-read.table("subject_test.txt")
##
## get the target columns
##
test<-test_x[,cni]
##
## create a vector combining the Subject ID and the Activity Name
##  
Subject_Activity<-paste(testSub_id$V1,aLabels[test_y$V1,2],sep="_")
##
##bind the columns for the subject and the activity 
##
test<-cbind(as.factor(Subject_Activity),test)
##
## add name for the first column
##
cn<- c("Subject_Activity",cn)
## add the column names
colnames(test)<-cn
##
##get the training data and perform the same steps as above for the test data
##
##
## get the training x and y (y is the activity type) data
##
setwd("../train")
train_x<-read.table("X_train.txt")
train_y<-read.table("y_train.txt")
##
## get the subject ID 
##
trainSub_id<-read.table("subject_train.txt")
##
## get the target columns
##
train<-train_x[,cni]
##
## create a vector combining the Subject ID and the Activity Name
##
Subject_Activity<-paste(testSub_id$V1,aLabels[train_y$V1,2],sep="_")
##
##bind the columns for the subject and the activity 
##
train<-cbind(as.factor(Subject_Activity),train)
##
##add column names
##
colnames(train)<-cn
##
## Combine the training and the test data
##  
CD<- rbind(test,train)
##
##Summarize the Data to create a narrow tidy data frame
## inspired by  http://stackoverflow.com/questions/21295936/can-dplyr-summarise-over-several-variables-without-listing-each-one
##
## melt the combined data
##
CDMelted<-melt(CD, id.var='Subject_Activity')
##
## Group the data by Subject_Activity
grouped<-group_by(CDMelted, Subject_Activity, variable); 
##
## Apply the mean function to the grouped data 
##
tidy<-summarise(grouped, means=mean(value))
##
## Prepare to write results
##
## write out the narrow results -
##
write.table(tidy,"tidyNarrow.txt",row.names= FALSE)
## 
## create the wide version
widy<-dcast(tidy, Subject_Activity~variable)
##
## Write out the wide results
##
write.table(widy,"tidyNarrow.txt",row.names= FALSE)
##
##Function getTgtColNames - Returns a sorted vector of the matches for the strings 
## 'mean()' and 'std()'
## in the input vector
#
getTgtColNames<- function(cols) {
  sstr<-"mean\\(\\)"
  cn1<-grep(sstr,cols)
  sstr<-"std\\(\\)"
  cn2<-grep(sstr,cols)
  cols<-c(as.numeric(cn1), as.numeric(cn2))
  cols<-sort(cols)
}
read.zip <- function(url,zipfile, row.names=NULL, dec=".") {
  ##
  ## Create a temporary directory to hold the zipfile
  ##
  temp <- tempfile()
  ## 
  ## Download the file
  ##
  print("Downloading Zip file")
  ## 
  download.file(url,temp)
  zipfile <- list.files(temp)
  ##
  ##Create a name for the dir where we'll unzip
  ##
  zipdir <- tempfile()
  ##
  ##Create the dir using the temp name
  ##
  dir.create(zipdir)
  # Unzip the file into the dir
  unzip(zipfile, exdir=zipdir)
  unlink(temp)
  print(zipfile)
  return(zipfile)
}