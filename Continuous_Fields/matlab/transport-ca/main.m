n=100; % size of grid
Dh=0.01; %spatial res
Dt=0.01; % temporal resolution
t=1000; % time  selection

global nextconfig;
global config;

[xvalues, yvalues] = meshgrid(0:Dh:1,0:Dh:1);
f= exp(-((xvalues-0.5).^2 + (yvalues-0.5).^2)./(0.2.^2));
mesh(f)
initialize(f)

%observe(xvalues,yvalues, nextconfig,f)

for s=0:t
    %w = waitforbuttonpress;
    %if w == 0
update(n)
imagesc(config);
fn=['img_',num2str(s),'.png'];
fullFileName= fullfile('C:\Users\Matti\Google Drive\Paul_3D\Continuous_Fields\matlab\transport-ca\img',fn);
imwrite(config,fullFileName,'png'); 
fname=['u_',num2str(s),'.dat']; %filename string: xx_1.dat for the first time step
fullFileNameD= fullfile('C:\Users\Matti\Google Drive\Paul_3D\Continuous_Fields\matlab\transport-ca\dat',fname);
save(fullFileNameD, 'u' , '-ascii');
pause(time_pause) 
        %observe(xvalues,yvalues, nextconfig,f)
    %end
end
close(gcf)
  

