import matplotlib.pyplot as plt
import matplotlib
import numpy as np
import os
from pylab import *
font = {'size':20}
matplotlib.rc('font', **font)
matplotlib.use('Agg')
params = {'legend.fontsize': 12,
          'legend.handlelength': 4}
matplotlib.rcParams.update(params)
params = {'mathtext.default': 'regular' }          
matplotlib.rcParams.update(params)
def main():
	
	def draw(inputfile,outputfile):
		exact=[1 for i in range(20)]
		AS=[0 for i in range(20)]
		US=[0 for i in range(20)]

		with open(inputfile) as f:
			content=f.readlines()
			for index in range(len(content)):

				if (index==0):
					strlist = content[index].replace(',',' ').split()
					for i in range(len(exact)):
						exact[i]=round(float(strlist[3]),2)
				if (index==1):
					strlist = content[index].split()
					for i in range(len(AS)):
						AS[i]=float(strlist[i+1])
				if (index==2):
					strlist = content[index].split()
					for i in range(len(US)):
						US[i]=float(strlist[i+1])
		tick_params(which='major',width=8)
		xtick=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

		plt.plot(xtick,exact,label='EMGP',linestyle='--',linewidth=5,color='red')	
		plt.axis([1,20,0,1])				
		plt.plot(xtick,US,label='SMGP',marker='o',markersize=12,color='green')
		plt.plot(xtick,AS,label='SMGP+',marker='v',markersize=12,color='blue')	
		#plt.xticks([1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10])						
		plt.xticks([2,4,6,8,10,12,14,16,18,20],[2,4,6,8,10,12,14,16,18,20])



		label="Modularity"
		plt.ylabel(label)
		label="Iteration"  #on motif "+str(self.motif)+",(s="+str(args.samplesRate)+")"
		plt.xlabel(label)

		plt.legend(numpoints=1)
		plt.legend(fancybox=True, framealpha=0.5)
		plt.tight_layout()
		plt.savefig(outputfile)
		plt.close()


	inputfile="lineplot1.txt"
	outputfile="lineplot1.png"
	print ("draw")
	draw(inputfile,outputfile)

if __name__ == "__main__":
	main()