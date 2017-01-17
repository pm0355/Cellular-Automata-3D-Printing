n=100; % size of grid
t=1500; % time  selection
global nextu;
global nextv;
global u;
global v;
[xvalues, yvalues] = meshgrid(0:.01:1,0:.01:1);

initialize(n)
for s=1:t
        update();
imagesc(nextu);
%fn=['img_',num2str(s),'.png'];
%fullFileName= fullfile('D:\res\turing-grayscott\img',fn);
%imwrite(nextu,fullFileName,'png'); 
%fname=['u_',num2str(s),'.dat']; %filename string: xx_1.dat for the first time step
%fullFileNameD= fullfile('D:\res\turing-grayscott\dat',fname);
%save(fullFileNameD, 'u' , '-ascii');
pause(.1) 
end


  

