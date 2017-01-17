# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""


import numpy as np
import matplotlib.pyplot as plt
from random import randint


n = 100 # size of grid: n * n 
Dh = 1. / n # spatial resolution, assuming space is [0,1] * [0,1] 
Dt = 0.02 # temporal resolution
a, b, c, d, h, k = 1., -1., 2., -1.5, 1., 1. #parameter values
eps=.05
q=.002
f=2.5
Du = 1 #diffusion constant of u 
Dv = 0.000 # diffusion constant of v
global u, v, nextu, nextv 

def initialize(): 
    global u, v, nextu, nextv 
    u = np.zeros([n, n]) 
    v = np.zeros([n, n]) 
    nextu = np.zeros([n, n])
    nextv = np.zeros([n, n])
for x in xrange(n):
    for y in xrange(n):        
        if (y>(float)(n/1.6)) and x>(float)(n/3.71) and x<(float)(y/2.6):
            u[x,y]=1
            v[x,y]=1
        else:
            u[x,y]=0
            v[x,y]=0 
        
def observe(): 
    global u, v, nextu, nextv 
    fig, ax = plt.subplots()
    ax.imshow(u, extent=[0,100,0,100])
    plt.title('u')    
    plt.show()
   
    
    fig, ax = plt.subplots()
    ax.imshow(v, extent=[0,100,0,100])
    plt.title('v')
    plt.show()
 

def update():
	global u, v, nextu, nextv, eps, f
	for x in xrange(n): 
		for y in xrange(n): 
		#state-transition function 
			uC, uR, uL, uU, uD = u[x,y], u[(x+1)%n,y], u[(x-1)%n,y], u[x,(y+1)%n], u[x,(y-1)%n] 
			vC, vR, vL, vU, vD = v[x,y], v[(x+1)%n,y], v[(x-1)%n,y], v[x,(y+1)%n], v[x,(y-1)%n] 
			uLap = (uR + uL + uU + uD - 4 * uC) / (Dh**2) 
			vLap = (vR + vL + vU + vD - 4 * vC) / (Dh**2) 
			nextu[x,y] = (uC + (uC*(1-uC) - f*vC*((uC-q)/(uC+q)) + (Du*uLap))*Dt )/eps
			nextv[x,y] = vC + ((uC-vC) + Dv*vLap)*Dt
	u, nextu = nextu, u 
	v, nextv = nextv, v

initialize()
observe()

