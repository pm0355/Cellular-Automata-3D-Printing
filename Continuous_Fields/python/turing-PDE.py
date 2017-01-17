
import numpy as np
import matplotlib.pyplot as plt


n = 100 # size of grid: n * n 
Dh = 1. / n # spatial resolution, assuming space is [0,1] * [0,1] 
Dt = 0.02 # temporal resolution
a, b, c, d, h, k = 1., -1., 2., -1.5, 1., 1. #parameter values
Du = 0.0001 #diffusion constant of u 
Dv = 0.0006 # diffusion constant of v
global u, v, nextu, nextv 

def initialize(): 
	global u, v, nextu, nextv 
	u = zeros([n, n]) 
	v = zeros([n, n]) 
	for x in xrange(n): 
		for y in xrange(n): 
			u[x, y] = 1. + uniform(-0.03, 0.03) #small noise is added 
			v[x, y] = 1. + uniform(-0.03, 0.03) #small noise is added 
	nextu = zeros([n, n])
	nextv = zeros([n, n])

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
	global u, v, nextu, nextv 
	for x in xrange(n): 
		for y in xrange(n): 
		#state-transition function 
			uC, uR, uL, uU, uD = u[x,y], u[(x+1)%n,y], u[(x-1)%n,y], u[x,(y+1)%n], u[x,(y-1)%n] 
			vC, vR, vL, vU, vD = v[x,y], v[(x+1)%n,y], v[(x-1)%n,y], v[x,(y+1)%n], v[x,(y-1)%n] 
			uLap = (uR + uL + uU + uD - 4 * uC) / (Dh**2) 
			vLap = (vR + vL + vU + vD - 4 * vC) / (Dh**2) 
			nextu[x,y] = uC + (a*(uC-h) + b*(vC-k) + Du * uLap) * Dt 
			nextv[x,y] = vC + (c*(uC-h) + d*(vC-k) + Dv * vLap) * Dt
	u, nextu = nextu, u 
	v, nextv = nextv, v

def main():
    i=0
    initialize()
    while(i<50):    
        observe()
        update()
        i+=1

