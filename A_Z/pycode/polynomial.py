import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv('../data/Position_Salaries.csv')

X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

"""from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)
"""

#Fitting Liniar Region

from sklearn.linear_model import LinearRegression

lin_reg = LinearRegression()
lin_reg.fit(X, y)

#polynomial Regression

from sklearn.preprocessing import PolynomialFeatures

poly_leg = PolynomialFeatures(degree=4)
X_poly = poly_leg.fit_transform(X)
lin_reg2 = LinearRegression()

lin_reg2.fit(X_poly, y)

#plt.scatter(X, y, color='red')
#plt.plot(X, lin_reg.predict(X), color='blue')
#plt.title("Truth or bruff")
#plt.xlabel('Postition')
#plt.ylabel("salary")
#plt.show()


print(lin_reg.predict([6.5]))
plt.scatter(X, y, color='red')
plt.plot(X, lin_reg2.predict(poly_leg.fit_transform(X)), color='blue')
plt.title("Truth or bruff")
plt.xlabel('Postition')
plt.ylabel("salary")
plt.show()
