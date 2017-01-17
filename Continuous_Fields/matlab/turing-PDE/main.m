n=100; % size of grid
Du=.0001; %spatial res
Dv=.0006; % temporal resolution
Dt=.02;
f=1000;
t=5000; % time  selection
global u;
global nextu;
global v;
global nextv;
[xvalues, yvalues] = meshgrid(0:.01:1,0:.01:1);


initialize(u,v,n)
for s=0:t

update(n)
imagesc(nextu);
%{
fn=['img_',num2str(s),'.png'];
fullFileName= fullfile('D:\res\turing-PDE\img',fn);
imwrite(nextu,fullFileName,'png'); 
fname=['u_',num2str(s),'.dat']; %filename string: xx_1.dat for the first time step
fullFileNameD= fullfile('D:\res\turing-PDE\dat',fname);
save(fullFileNameD, 'u' , '-ascii');
%}

pause(.1) 
end

  

