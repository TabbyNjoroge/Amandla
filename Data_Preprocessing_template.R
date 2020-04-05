#Data Processing

#Import the dataset
dataset=read.csv('Data.csv')
dataset=dataset[, 2:3]

# installing/loading the latest installr package:
install.packages("installr"); library(installr)

#splitting dataset into training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split=sample.split(dataset$Purchased,SplitRatio = 0.8)
training_set=subset(dataset, split==TRUE)
test_set=subset(dataset,split==FALSE)

#feature scaling
# training_set[,2:3]=scale(training_set[,2:3])
# test_set[,2:3]=scale(test_set[,2:3])