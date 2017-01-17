# -*- coding: utf-8 -*-
"""
Created on Thu Jun 23 11:56:45 2016

@author: Matti
"""

from pylab import *
xvalues, yvalues = meshgrid(arange(-5, 5.5, 0.05), arange(-5, 5.5, 0.05))
zvalues = sin(sqrt(xvalues**2 + yvalues**2))
cp = contour(xvalues, yvalues, zvalues) 
clabel(cp)
show()