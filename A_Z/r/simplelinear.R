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

y_pred = predict(regressor, newdata = test_set)

library(ggplot2)
ggplot() + 
  geom_point(aes(x=training_set$YearsExperience, y= training_set$Salary),
             color='red') +
  geom_line(aes(x = training_set$YearsExperience, y=predict(regressor, newdata = training_set)), 
            color= 'blue') +
  ggtitle("Salary vs Experience(Training set)") +
  xlab('Years of experience') +
  ylab('Salary')

ggplot() + 
  geom_point(aes(x=test_set$YearsExperience, y= test_set$Salary),
             color='red') +
  geom_line(aes(x = training_set$YearsExperience, y=predict(regressor, newdata = training_set)), 
            color= 'blue') +
  ggtitle("Salary vs Experience(Test set)") +
  xlab('Years of experience') +
  ylab('Salary')
