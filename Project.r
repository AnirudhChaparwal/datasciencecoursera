## Loading the training dataset

train<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

trainLabel<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

trainSubject<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

## Loading the test dataset

test<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

testLabel<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

testSubject<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

## Appropriately labeling the data set with descriptive variable names

x<-names(train)
y<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
y2<-y[,2]
y2<-as.vector(y2)

for(i in 1:561) names(train)[names(train)==x[i]]=y2[i]

for(i in 1:561) names(test)[names(test)==x[i]]=y2[i]

## Appropriately labeling descriptive activity names to name the activities in the data set

z<-read.table(file="C:/Users/Anirudh/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
z1<-z[,2]
z1<-as.vector(z1)

trainLabel$V1[which(trainLabel$V1==1)]<-z1[1]
trainLabel$V1[which(trainLabel$V1==2)]<-z1[2]
trainLabel$V1[which(trainLabel$V1==3)]<-z1[3]
trainLabel$V1[which(trainLabel$V1==4)]<-z1[4]
trainLabel$V1[which(trainLabel$V1==5)]<-z1[5]
trainLabel$V1[which(trainLabel$V1==6)]<-z1[6]

testLabel$V1[which(testLabel$V1==1)]<-z1[1]
testLabel$V1[which(testLabel$V1==2)]<-z1[2]
testLabel$V1[which(testLabel$V1==3)]<-z1[3]
testLabel$V1[which(testLabel$V1==4)]<-z1[4]
testLabel$V1[which(testLabel$V1==5)]<-z1[5]
testLabel$V1[which(testLabel$V1==6)]<-z1[6]

## Changing the column names of the data set 

colnames(trainSubject)<-"Subject"
colnames(testSubject)<-"Subject"
colnames(trainLabel)<-"Activity"
colnames(testLabel)<-"Activity"

## By using cbind() I am adding the Subject and Activity column to the training and testing data sets

train<-cbind(trainSubject,trainLabel,train)
test<-cbind(testSubject,testLabel,test)

## Combining training and testing data sets

DataSet<-rbind(train,test)

## Extracts only the measurements on the mean and standard deviation for each measurement

Newds<-DataSet[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,347,348,349,350,351,352,426,427,428,429,430,431,505,506,518,519,531,532,544,545)]

## Tidy data set with the average of each variable for each activity and each subject

