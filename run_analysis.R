##need these packages for sumarization
require(dplyr)
require(reshape2)
## Download files and record time
## <>
##
##set the directory to the main level
##
setwd("~/Documents/CourseraData ScienceHopkins/UCI HAR Dataset")
##
##get the feature names
##
features<-read.table("features.txt")
##
## get the index for the subset of columns that contain 'mean()' or 'std()
##
cni<-getTgtColNames(as.character(features[,2]))
##
##clean up the names by removing parentheses
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
## create a vector combining the Subject ID and the Activity Name
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
CDMelted<-melt(CD, id.var='Subject_Activity')
dmg<-group_by(CDMelted, Subject_Activity, variable); 
tidy<-summarise(dmg, means=mean(value))
write.table(tidy,"tidy")
