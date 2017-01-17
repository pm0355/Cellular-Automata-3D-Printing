clear all;
n=256; % size of grid
t=100; % time  selection
global x;
global y; 
global z;
global u;
global nextu;
global v;
global nextv;
global filam;
global f0;
global fm;
global l;

zvalues = meshgrid(0:.01:1);
f0=2.5;
fm=.2;
l=.8;
filam= f0+fm*cos(2*pi*zvalues/l);
zvec=zeros(n,n);
zvec(1:101,1:101)=filam;
    
    
[xvalues, yvalues] = meshgrid(0:.01:1,0:.01:1);
tvec=meshgrid(0:.01:2.55);

initialize(u,v,n);
tic
for s=0:t
    
%
w= waitforbuttonpress;
if w==0
      observe(nextu,nextv,zvec);
end
%}
update();
%}  
end
  observe(nextu,nextv,zvec);
toc
  

