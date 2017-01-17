# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

from pylab import *
xvalues, yvalues = meshgrid(arange(-5, 5.5, 0.05), arange(-5, 5.5, 0.05)) 
zvalues = sin(sqrt(xvalues**2 + yvalues**2))
imshow(zvalues)
show()