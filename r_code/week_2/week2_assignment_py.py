# -*- coding: utf-8 -*-
"""
Created on Thu Sep 17 14:06:12 2026

@author: Kristien
"""

#Python1

# Import libraries
import seaborn as sns
import matplotlib.pyplot as plt

# Load dataset
tips = sns.load_dataset("tips")

# Scatterplot of tips by total bill + regression line
tips_by_total = sns.regplot(x="total_bill", y="tip", data=tips)

# Increase size of the axis labels
tips_by_total.set_xlabel("Total Bill", size=20)
tips_by_total.set_ylabel("Tip", size=20)

# Show plot
plt.show()



#Python2

# Load dataset
diamonds = sns.load_dataset("diamonds")

# New data frame with only numeric variables
numeric_col = ["carat", "depth", "table", "price", "y", "z"]
diamonds_numeric = diamonds.loc[:, numeric_col]

# Heatmap of inter-correlations of variables as first subplot
plt.subplot(1, 2, 1)
sns.heatmap(diamonds_numeric.corr())

# Kdeplot of price by carat as second subplot
plt.subplot(1, 2, 2)
sns.kdeplot(x="carat", y="price", data=diamonds)

# Show plot
plt.show()



#Python3

# I removed the spaces before an after "=" for arguments in functions.
# I changed random variable name "x" to "numeric_col" to be more informative.