# -*- coding: utf-8 -*-
"""
Created on Thu Jun 23 12:00:35 2016

@author: Matti
"""
from pylab import *
xvalues, yvalues = meshgrid(arange(-3, 3.1, 0.1), arange(-3, 3.1, 0.1))
vx = 2 * xvalues 
vy = yvalues - xvalues
streamplot(xvalues, yvalues, vx, vy)
show()