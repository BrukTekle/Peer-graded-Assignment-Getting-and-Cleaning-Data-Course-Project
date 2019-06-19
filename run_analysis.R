
library(dplyr)
#read the orginal data in the "getdata_projectfiles_UCI HAR Dataset" test and train folder
y_train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
x_train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/x_train.txt")
subject_train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

x_test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

features_txt<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

test_bind<-cbind(subject_test, y_test,x_test)#combine subject_test, y_test and x_test based on their column

train_bind<-cbind(subject_train, y_train,x_train)#combine subject_train, y_train and x_train based in their column

data_all<-rbind(test_bind,train_bind)#combining the two data set based on the row

#extracting cleaned column 2 of features_txt by removing symbols and replacing letters to make it more readable
cleaned_name<-data.frame()
cleaned_name<-features_txt[,2] %>% gsub("-","",.) %>% 
    gsub("\\(","",.) %>% gsub("\\)","",.) %>% 
    gsub("^t","time",.) %>% gsub("^f","freq",.)%>%
      gsub(",","",.)

#replacing the varible names of the combined data with the cleaned variable names
colnames(data_all)[3:563]<-cleaned_name
colnames(data_all)[1:2]<-c("subject", "activity")

#extracting coiumns with "mean" or "std" in them
mean_col<-grep("mean",features_txt$V2)+2
sd_col<-grep("std",features_txt$V2)+2
filter_data<-data_all[,c(1,2,mean_col,sd_col)]

#relacing variable activity (column 2) the cooresponding names in the activity_labels.txt file
activity_labels<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
activitie_factor<-factor(activity_labels[,2],levels = c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING","STANDING", "LAYING"))
filter_data[,2]<-activitie_factor[filter_data[,2]]

#grouping the data based on the subject and activity column and then finding the average for each unique combination
grouped_data<-filter_data %>% 
  group_by(filter_data$subject, filter_data$activity) %>% 
  summarize_at(vars(-subject,-activity),mean) 

#replacing the variables with descriptive names
new_names<-c("Subject", "Activity",paste0("Avg", names(grouped_data[c(-1,-2)])))
tidy_data<-as.data.frame(grouped_data)
names(tidy_data)<-new_names

#writing the code into a new text file in the same directory
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)