import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sys
from xlrd import open_workbook 
import xlwt  

workbook = open_workbook(r'box.xlsx')  # open xls file

sheet0 = workbook.sheet_by_index(0)  # read sheet according to sheet name
list1 = []
for i in range(sheet0.nrows):
	list1.append(sheet0.row_values(i)[0])
sheet1 = workbook.sheet_by_index(1)  # read sheet according to sheet name
list2 = []
for i in range(sheet1.nrows):
	list2.append(sheet1.row_values(i)[0])
sheet2 = workbook.sheet_by_index(2)  # read sheet according to sheet name
list3 = []
for i in range(sheet2.nrows):
	list3.append(sheet2.row_values(i)[0])

# transfer data structure as dataframe
s1 = pd.Series(np.array(list1))
s2 = pd.Series(np.array(list2))
s3 = pd.Series(np.array(list3))

data = pd.DataFrame({"A": s1, "B": s2, "C": s3})
data.boxplot(showfliers=False, notch=False,medianprops={'color':'black','linewidth':'3.0'}, boxprops = {'color':'black','linewidth':'3.0'},capprops={'color':'black','linewidth':'3.0'})  
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.ylabel('distance (km)',fontsize=20)
plt.grid(linestyle=" ", alpha=0.8)
cfig = plt.gcf() # 'get current figure'
cfig.savefig('box.pdf', format='pdf', dpi=1000)
plt.show()