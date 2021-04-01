import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import sys
from xlrd import open_workbook 
import xlwt  
import numpy as np


def hybridbar(datalist):
	xlabels = ['2', '3','4','5','6']
	x = [1, 2, 3, 4, 5]
	barWidth = 0.25 # bar width

	a1 = datalist[0]
	b1 = datalist[1]
	a2 = datalist[2]
	b2 = datalist[3]
	a3 = datalist[4]
	b3 = datalist[5]

	r1 = np.arange(len(a1))
	r2 = [x + barWidth for x in r1]
	r3 = [x + barWidth for x in r2]

	fig, ax = plt.subplots()

	# create bar
	plt.bar(r1, a1, color='#FF5511', width=barWidth, edgecolor='white')
	plt.bar(r1, b1, color='#FF5511', width=barWidth, edgecolor='white', bottom=a1, hatch="x")
	plt.bar(r2, a2, color='#32CD32', width=barWidth, edgecolor='white', hatch="\\\\")
	plt.bar(r2, b2, color='#32CD32', width=barWidth, edgecolor='white', bottom=a2, hatch="+")
	plt.bar(r3, a3, color='#8B008B', width=barWidth, edgecolor='white')
	plt.bar(r3, b3, color='#8B008B', width=barWidth, edgecolor='white', bottom=a3, hatch="//")

	plt.xticks([r + barWidth for r in range(len(a1))], xlabels, fontsize=25)
	plt.yticks(fontsize=25)
	plt.xlabel('$|W| \\times 10^3$',fontsize=25)
	plt.ylabel('$\mathcal{R}$',fontsize=25)

	# create legend
	labels = ['$\mathcal{R}_1$(A)', '$\mathcal{R}_1$(B)', '$\mathcal{R}_1$(C)'] 
	labels1 = ['$\mathcal{R}_2$(A)', '$\mathcal{R}_2$(B)', '$\mathcal{R}_2$(C)'] 
	color = ['#FF5511', '#32CD32', '#8B008B']
	pat1 = mpatches.Patch(color=color[0], label="{:s}".format(labels[0]))
	pat2 = mpatches.Patch(facecolor=color[0], edgecolor='white', hatch="x", label="{:s}".format(labels1[0]))
	pat3 = mpatches.Patch(facecolor=color[1], edgecolor='white', hatch="\\\\",label="{:s}".format(labels[1]))
	pat4 = mpatches.Patch(facecolor=color[1], edgecolor='white', hatch="+", label="{:s}".format(labels1[1]))
	pat5 = mpatches.Patch(color=color[2],label="{:s}".format(labels[2]))
	pat6 = mpatches.Patch(facecolor=color[2], edgecolor='white', hatch="//", label="{:s}".format(labels1[2]))
	leg = plt.legend(loc='best', handles=[pat1, pat3, pat5, pat2, pat4, pat6], ncol=2, fontsize=12) #generate legend
	leg.get_frame().set_linewidth(0.0)
    

	fig.tight_layout()
	cfig = plt.gcf() # 'get current figure'
	cfig.savefig('hybridbar.pdf', format='pdf', dpi=1000)
	plt.show()

workbook = open_workbook(r'hybridbar.xlsx')  # open xls file
sheet = workbook.sheet_by_index(0)  # read sheet according to sheet name
num_rows = sheet.nrows
num_cols = sheet.ncols

datalist = np.zeros((num_rows-1,num_cols))

for i in range(num_rows-1):
		datalist[[i], :] = sheet.row_values(i+1)

hybridbar(datalist)