import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


dataset = pd.read_csv('../data/Social_Network_Ads.csv')
X = dataset.iloc[:, [2,3]].values
y = dataset.iloc[:, 4].values

from sklearn.model_selection import train_test_split


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size= 0.25, random_state = 0)


from sklearn.preprocessing import StandardScaler


sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.fit_transform(X_test)

