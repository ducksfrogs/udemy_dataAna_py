#SVR

dataset  <- read.csv("../data/Position_Salaries.csv", header = T)
dataset <- dataset[2:3]

#Fit Simple Linear Reggression
install.packages('e1071')
library(e1071)

regressor <- svm(formula= Salary~ ., data = dataset,
                type='eps-regression')

y_pred = predict(regressor, data.frame(Level=6.5))

library(ggplot2)
ggplot() + 
  geom_point(aes(x=dataset$Level, y= dataset$Salary),
             color='red') +
  geom_line(aes(x = training_set$YearsExperience, y=predict(regressor, newdata = training_set)), 
            color= 'blue') +
  ggtitle("Salary vs Experience(Training set)") +
  xlab('Years of experience') +
  ylab('Salary')

ggplot() + 
  geom_point(aes(x=dataset$Level, y= dataset$Salary),
             color='red') +
  geom_line(aes(x = dataset$Level, y=predict(regressor, newdata = dataset)), 
            color= 'blue') +
  ggtitle("Truth or Bluff(SVR)") +
  xlab('Years of experience') +
  ylab('Salary')
