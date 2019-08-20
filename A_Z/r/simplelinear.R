data <- read.csv("../data/Salary_Data.csv", header = T)
#Simple Linear Regression

library(caTools)
set.seed(123)
split = sample.split(data$Salary, SplitRatio = 2/3)
training_set = subset(data, split== TRUE)
test_set = subset(data, split==FALSE)

#Fit Simple Linear Reggression

regressor <- lm(formula = Salary ~ YearsExperience, data = training_set)
summary(regressor)
