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
#plt.rcParams["figure.figsize"] = [20,20]          
matplotlib.rcParams.update(params)
params = {'mathtext.default': 'regular' }          
matplotlib.rcParams.update(params)
def main():
	
	def draw(temp,timefile,emgp_time):
		exact=[1 for i in range(20)]
		AS=[0 for i in range(20)]
		errorratio=[0 for i in range(20)]
		speedup=[0 for i in range(20)]
		with open(temp) as f:
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

		with open(timefile) as f:
			content=f.readlines()
			for index in range(len(content)):
				if (index==1):
					strlist = content[index].split()
					for i in range(len(speedup)):
						speedup[i]=float(strlist[i+1])


		for i in range(len(speedup)):
			speedup[i]=emgp_time/speedup[i]
		
		tick_params(which='major',width=8)
		xtick=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

		for i in range(len(exact)):
			errorratio[i]=abs(exact[i]-AS[i])/exact[i]*100

		speederror=[0 for i in range(20)]
		for i in range(len(exact)):
			speederror[i]=speedup[i]/errorratio[i]

		statistics=[]

		statistics.append(speedup)
		statistics.append(errorratio)
		statistics.append(speederror)
		return statistics
		#xtick=[1,2,3,4,5,6,7,8,9,10]




	emgp_time=11812.61



	fennel=draw("barplot1score1.txt","barplot1time1.txt",emgp_time)

	mappr=draw("barplot1score2.txt","barplot1time2.txt",emgp_time)	

	output="barplot1.png"
	limit=1000
	ww=0.3
	fig, ax = plt.subplots()
	plt.axis([0,21,0,1])
	pos=np.arange(1,21,1)
	plt.bar(pos, fennel[2],width=ww,color='green',label='Fennel')
	plt.bar(pos+ww, mappr[2],width=ww,color='orange',label='MAPPR')
	#plt.xticks([1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10])						
	plt.legend()
	#plt.legend(bbox_to_anchor=(0, 1.02, 1, 0.2), loc='lower left',ncol=3,frameon=False,fontsize=40)
	ax.set_ylim([1, limit])

	ax.set_yscale("log")
	plt.xticks([2,4,6,8,10,12,14,16,18,20],[2,4,6,8,10,12,14,16,18,20])
	



	label="Speedup per $1\%$ error"
		
	plt.ylabel(label)
	label="Iteration"
	plt.xlabel(label)

	plt.tight_layout()
	plt.savefig(output)
	plt.close()
	'''
	output=path1+"speedup.png"
	ww=0.2
	fig, ax = plt.subplots()
	plt.axis([0,20,0,1])
	pos=np.arange(1,21,1)
	plt.bar(pos, fennel[0],width=ww,color='green',label='Fennel')
	plt.bar(pos+ww, mappr[0],width=ww,color='purple',label='MAPPR')

	#plt.xticks([1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10])						
	plt.legend()
	ax.set_ylim([1, 10000])
	ax.set_yscale("log")
	plt.xticks([2,4,6,8,10,12,14,16,18,20],[2,4,6,8,10,12,14,16,18,20])
	plt.ylabel("Speedup")

	label="Speedup"
		
	plt.ylabel(label)
	label="Iteration"
	plt.xlabel(label)

	plt.tight_layout()
	plt.savefig(output)
	plt.close()	

	output=path1+"errorratio.png"
	ww=0.2
	fig, ax = plt.subplots()
	plt.axis([0,20,0,1])
	pos=np.arange(1,21,1)
	plt.bar(pos, fennel[1],width=ww,color='green',label='Fennel')
	plt.bar(pos+ww, mappr[1],width=ww,color='cyan',label='MAPPR')
	#plt.xticks([1,2,3,4,5,6,7,8,9,10],[1,2,3,4,5,6,7,8,9,10])						
	plt.legend()
	ax.set_ylim([1, 10000])
	ax.set_yscale("log")
	plt.xticks([2,4,6,8,10,12,14,16,18,20],[2,4,6,8,10,12,14,16,18,20])
	plt.ylabel("error ratio")

	label="error ratio"
		
	plt.ylabel(label)
	label="Iteration"
	plt.xlabel(label)

	plt.tight_layout()
	plt.savefig(output)
	plt.close()																				
	'''
if __name__ == "__main__":
	main()