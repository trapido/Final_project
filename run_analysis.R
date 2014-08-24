#Reading in the data
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
features_file <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)

#Creating the vector that will be used for feature names
feature_names <- features_file[,2]

#Putting the data together
subjects <- rbind(subject_train, subject_test)
activities <- rbind(y_train, y_test)
features <- rbind(x_train, x_test)
my_data <- data.frame(subjects, activities, features)
col_names <- c("subject", "activity", feature_names)
colnames(my_data) <- col_names

#Adding descriptive activity names 
activity_labels <- c("walking", "walking.upstairs","walking.downstairs","sitting","standing","laying")
my_factors <- factor(my_data$activity, labels=activity_labels)
my_data$activity <- my_factors

#Extracting the measurements on the mean and standard deviation for each measurement
pattern <- '(std|mean)()'
names_needed <- names(my_data)[grepl(pattern, names(my_data))]
my_subset <- my_data[,names_needed]

#Adding descriptive variable labels
new_names <- gsub("-|\\()", "", names(my_subset)) #removes hyphens and brackets
new_names <-gsub("^t","Time", new_names) #replaces prefix -t- with Time
new_names <-gsub("^f","Frequency", new_names) #replaces prefix -f- with Frequency
new_names <-gsub("mean","Mean", new_names)
new_names <-gsub("std","Std", new_names)
new_names <- gsub("BodyBody", "Body", new_names)
colnames(my_subset) <- new_names

#Creating the first dataset
tidy_dataset1 <- data.frame("Subjects" = my_data$subject, "Activities" = my_data$activity, my_subset)

#Creating the second dataset
tidy_dataset2 <- aggregate(tidy_dataset1[,3:81], by=list(tidy_dataset1$Subjects,tidy_dataset1$Activities), FUN = mean, na.remove = TRUE)
#Renaming the first two columns
colnames(tidy_dataset2)[1:2] <- c("Subjects","Activities")

#Writing the first data set to a file
write.table(tidy_dataset1, file = "./data/dataset1.txt", row.names = FALSE,col.names = TRUE)

#returning the second data set
tidy_dataset2





