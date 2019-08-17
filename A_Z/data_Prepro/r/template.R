# Importing the dataset
# Importing the dataset
dataset = read.csv('../data/Data.csv')
#dataset = dataset[, 2:3]
library(catools)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == T)
test_set = subset(dataset, split == F)
#training_set[,2:3] <- scale(training_set[,2:3])
#test_set[,2:3] <- scale(test_set[,2:3])
