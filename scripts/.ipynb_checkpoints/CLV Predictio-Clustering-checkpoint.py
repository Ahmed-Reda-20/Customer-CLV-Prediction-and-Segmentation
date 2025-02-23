import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
#reading my data then using numpy log method to log transform all my 
M = r"c:\Users\Ahmed\Desktop\Project Mats\Metrics.csv"
df = pd.read_csv(M)

#creating a new column for log transformation for better distribution 
df['Log_CLV'] = np.log1p(df['CLV'])

##used neccesary libs to build histogram distribution
plt.figure(figsize=(16, 6))
sns.histplot(df['Log_CLV'], bins=30, kde=True)
plt.title('Distribution of Log(CLV)')
#use "plt.show()" to show the histogram

#ML SOOOOOOOOOOOOOOOON
