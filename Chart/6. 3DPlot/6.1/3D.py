# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
from sklearn import mixture
 
fig = plt.figure()
ax = fig.gca(projection="3d")
 
# prepare data
delta = 0.5
#x = np.arange(0, 9, delta)    
#y = np.arange(0, 9, delta)
x = np.arange(0, 9, delta)
y = np.arange(0, 9, delta)
x, y = np.meshgrid(x,y)
# set function for generating z  
r = np.sqrt(x ** 2 + y ** 2)
z = np.sin(r)*10
 
surf = ax.plot_surface(x, y, z, cmap=cm.coolwarm)  # cmap means color map
 
 
 
#add color card
fig.colorbar(surf, shrink=0.4, aspect=7)  
# shrink represents the shrinkage ratio，aspect affects the width of bar, the larger aspect is，the narrow bar is

fig.tight_layout()
cfig = plt.gcf() # 'get current figure'
cfig.savefig('3D.pdf', format='pdf', dpi=1000)
plt.show()