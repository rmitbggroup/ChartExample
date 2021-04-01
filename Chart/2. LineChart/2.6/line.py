import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import sys
from xlrd import open_workbook 
import xlwt  
import numpy as np
#import handcalcs

def line(datalist):
	xlabels = ['2', '3','4','5','6']
	x = [1, 2, 3, 4, 5]

	y1 = datalist[0]
	y2 = datalist[1]
	y3 = datalist[2]
	y4 = datalist[3]
	
	fig, ax = plt.subplots()

	plt.plot(x, y1, color='red', marker='o', mfc = 'white', mew = '2', ms =16, linewidth=3)
	plt.plot(x, y2, color='blue', marker='s', mfc = 'white', mew = '2', ms =16, linewidth=3)   
	plt.plot(x, y3, color='green', ls = '--', marker='*', ms=20, linewidth=3)
	plt.plot(x, y4, color='darkorange', ls = '-.', marker='^', ms=18, linewidth=3)           
	# add x-axis
	plt.xlim((1, 5))
	plt.xticks(x, xlabels, fontsize=25)
	plt.yticks(fontsize=25)
	plt.xlabel('$|W| \\times 10^3$',fontsize=25)
	plt.ylabel('update time (ms)',fontsize=25)

	# create legend
	x = []
	y1 = []
	y2 = []
	y3 = []
	y4 = []
	labels = ['A', 'A1', 'B', 'B1'] 
	color = ['red', 'blue']
	pat1, = plt.plot(x, y1, color='red', marker='o', mfc = 'white', mew = '2', ms =10, linewidth=2)
	pat3, = plt.plot(x, y2, color='blue', marker='s', mfc = 'white', mew = '2', ms =10, linewidth=2)   
	pat2, = plt.plot(x, y3, color='green', ls = '--', marker='*', ms=16, linewidth=2)
	pat4, = plt.plot(x, y4, color='darkorange', ls = '-.', marker='^', ms=10, linewidth=2)  
	#legend location
	leg = plt.legend(loc='best', handles=[pat1, pat2, pat3, pat4], labels = labels, ncol=4, fontsize=12) #生成legend
	leg.get_frame().set_linewidth(0.0)

	fig.tight_layout()
	cfig = plt.gcf() # 'get current figure'
	cfig.savefig('line.pdf', format='pdf', dpi=1000)
	plt.show()


workbook = open_workbook(r'line.xlsx')  # open xls file
sheet = workbook.sheet_by_index(0)  # read sheet according to sheet name

num_rows = sheet.nrows
num_cols = sheet.ncols
datalist = np.zeros((num_rows-1,num_cols))


for i in range(num_rows-1):
	datalist[[i], :] = sheet.row_values(i+1)

line(datalist)