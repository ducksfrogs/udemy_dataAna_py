#Logistic Regression


dataset <- read.csv('../data/Social_Network_Ads.csv')

dataset <- dataset[, 3:5]

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio=0.75)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

#Feature scaling

training_set[, 1:2] = scale(training_set[,1:2])
test_set[, 1:2] = scale(test_set[,1:2])

classifier <- glm(formula = Purchased ~.,
                  family = binomial,
                  data = training_set)
summary(classifier)

prob_pred <- predict(classifier, type= 'response', newdata = test_set[-3])
prob_pred

y_pred = ifelse(prob_pred > 0.5, 1, 0)

cm = table(test_set[,3], y_pred)
cm
