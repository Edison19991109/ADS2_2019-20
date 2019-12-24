# -*- coding: utf-8 -*-
"""
Created on Sun Oct 13 16:42:54 2019

@author: KANG Jianning
"""

from sklearn import linear_model, datasets
from matplotlib import pyplot as plt
n_samples = 1000
X, y, coef = datasets.make_regression (n_samples=n_samples ,
n_features =1, n_informative =1, noise =10, coef=True , random_state=0)
plt.scatter (X, y, color='yellowgreen' , marker='.' )
plt.show ( )