#Polynomial Regression

data <- read.csv("../data/Position_Salaries.csv")

dataset = data[2:3]

#library(caTools)
#set.seed(123)
#split = sample.split(dataset$Salary, SplitRatio = 2/3)
#training_set = subset(data, split== TRUE)
#test_set = subset(data, split==FALSE)

plot(dataset)
lin_reg <- lm(Salary ~ ., 
              data = dataset)
summary(lin_reg)

#Poly
dataset$Level2 <- dataset$Level^2
dataset$Level3 <- dataset$Level^3
ploy_reg <- lm(formula = Salary ~ .,
               data = dataset)
summary(ploy_reg)
               
library(ggplot2)

ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color = 'red') +
  geom_line(aes(x=dataset$Level, y=predict(lin_reg, newdata = dataset)),
            color= 'blue') +
  ggtitle("Truth or Bruff(Linear Regression") +
  xlab('Level') +
  ylab('Salary')

  
ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color = 'red') +
  geom_line(aes(x=dataset$Level, y=predict(ploy_reg, newdata = dataset)),
            color= 'blue') +
  ggtitle("Truth or Bruff(Linear Regression") +
  xlab('Level') +
  ylab('Salary')

y_pred <- predict(lin_reg, data.frame(Level=6.5))
y_pred <- predict(ploy_reg, data.frame(Level=6.5,
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3))
