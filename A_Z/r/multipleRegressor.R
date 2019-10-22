dataSet <- read.csv("../data/50_Startups.csv")

#encode categorical data

dataSet$State <- factor(dataSet$State,
                        levels = c("New York", "California", "Florida"),
                        labels = c(1, 2, 3))
library(caTools)
set.seed(123)

split <- sample.split(dataSet$Profit, SplitRatio = .8)
training_set <- subset(dataSet, split==TRUE)
test_set <- subset(dataSet, split==FALSE)
regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = training_set)
regressor <- lm(formula = Profit ~ .,
                data = training_set)
summary(regressor)


#regressor <- lm(formula = Profit ~ R.D.Spend , data = training_set)
#summary(regressor)

y_pred <- predict(regressor, newdata = test_set)
y_pred
test_set

#back plop


regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = training_set)
summary(regressor)

regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend , data = training_set)
summary(regressor)

regressor <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend , data = training_set)
summary(regressor)

