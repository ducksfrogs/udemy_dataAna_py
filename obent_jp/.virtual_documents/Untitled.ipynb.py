import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression as LR


train = pd.read_csv('obent/train.csv')
test = pd.read_csv('obent/test.csv')
sample = pd.read_csv('obent/sample.csv', header=None)


trainX = train['temperature']
y = train['y']


y


testX = test['temperature']


trainX = trainX.values.reshape(-1,1)
testX = testX.values.reshape(-1,1)


model1 = LR()


model1.fit(trainX, y)


model1.coef_


model1.intercept_


predicted = model1.predict(testX)


predicted


sample.head()



sample[1] = predicted


sample.head()


sample.to_csv("submit.csv", header=None, index=None)


train['week'].value_counts()


train['week'].unique()


pd.get_dummies(train['week'])


trainX = pd.get_dummies(train[['week', 'temperature']])
testX = pd.get_dummies(test[['week','temperature']])


trainX.head()


y = train['y']


model2 = LR()


model2.fit(trainX, y)


model2.coef_


model2.intercept_


predicted = model2.predict(testX)



