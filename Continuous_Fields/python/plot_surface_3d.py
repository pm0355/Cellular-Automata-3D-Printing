# -*- coding: utf-8 -*-
"""
Created on Thu Jun 23 11:53:22 2016

@author: Matti
"""

from pylab  import * 
from mpl_toolkits.mplot3d import Axes3D
import numpy 
from stl import mesh

xvalues, yvalues = meshgrid(arange(-5, 5.5, 0.05), arange(-5, 5.5, 0.05)) 
zvalues = sin(sqrt(xvalues**2 + yvalues**2))
ax = gca(projection='3d')
ax.plot_surface(xvalues, yvalues, zvalues)
show()
your_mesh = mesh.Mesh({xvalues,yvalues,zvalues}, remove_empty_areas=False)
your_mesh.save('new_stl_file.stl')