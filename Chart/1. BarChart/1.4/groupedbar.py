import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import sys
from xlrd import open_workbook 
import xlwt  
import numpy as np


def hybridbar(datalist):
	xlabels = ['0.1','0.3','0.5','0.7','0.9']
	x = [1, 2, 3, 4, 5]
	barWidth = 0.2 # bar width

	a1 = datalist[0]
	b1 = datalist[1]
	a2 = datalist[2]
	b2 = datalist[3]

	r = np.arange(len(a1))
	r1 = [x - 2*barWidth+0.2 for x in r]
	r2 = [x - barWidth+0.2 for x in r]
	r3 = [x + barWidth for x in r]
	r4 = [x + 2*barWidth for x in r]

	
	fig, ax = plt.subplots()

	# create bar
	plt.bar(r1, a1, color='#FF5511', width=barWidth, edgecolor='white')
	plt.bar(r2, b1, color='#FF5511', width=barWidth, edgecolor='white', hatch="x")
	plt.bar(r3, a2, color='#32CD32', width=barWidth, edgecolor='white', hatch="\\\\")
	plt.bar(r4, b2, color='#32CD32', width=barWidth, edgecolor='white',hatch="+")

	plt.xticks([r + barWidth for r in range(len(a1))], xlabels, fontsize=25)
	plt.yticks(fontsize=25)
	plt.xlabel('$\\alpha$',fontsize=25)
	plt.ylabel('$\mathcal{R}$',fontsize=25)

	# create legend
	labels = ['$\mathcal{R}_1$(A)', '$\mathcal{R}_1$(B)'] 
	labels1 = ['$\mathcal{R}_2$(A)', '$\mathcal{R}_2$(B)']  
	color = ['#FF5511', '#32CD32']
	pat1 = mpatches.Patch(color=color[0], label="{:s}".format(labels[0]))
	pat2 = mpatches.Patch(facecolor=color[0], edgecolor='white', hatch="x", label="{:s}".format(labels1[0]))
	pat3 = mpatches.Patch(facecolor=color[1], edgecolor='white', hatch="\\\\",label="{:s}".format(labels[1]))
	pat4 = mpatches.Patch(facecolor=color[1], edgecolor='white', hatch="+", label="{:s}".format(labels1[1]))
	leg = plt.legend(loc='best', handles=[pat1, pat2, pat3, pat4], ncol=2, fontsize=12) #generate legend
	leg.get_frame().set_linewidth(0.0)
    

	fig.tight_layout()
	cfig = plt.gcf() # 'get current figure'
	cfig.savefig('groupedbar.pdf', format='pdf', dpi=1000)
	plt.show()

workbook = open_workbook(r'groupedbar.xlsx')  # open xls file
sheet = workbook.sheet_by_index(0)  # read sheet according to sheet name
num_rows = sheet.nrows
num_cols = sheet.ncols

datalist = np.zeros((num_rows-1,num_cols))

for i in range(num_rows-1):
		datalist[[i], :] = sheet.row_values(i+1)

hybridbar(datalist)