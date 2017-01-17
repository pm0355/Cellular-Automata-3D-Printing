n=100; % size of grid
Dh=0.01; %spatial res
Dt=0.01; % temporal resolution
t=10000; % time  selection
global nexta;
global nextb;
[xvalues, yvalues] = meshgrid(0:Dh:1,0:Dh:1);

a= exp(-((xvalues-0.45).^2 + (yvalues-0.45).^2)./(0.3.^2));
b= exp(-((xvalues-0.55).^2 + (yvalues-0.55).^2)./(0.1.^2));

initialize(a,b)
hold on
observe(xvalues,yvalues, nexta,a)
observe(xvalues,yvalues, nextb,b)
hold off
for s=0:t

        update(n)
imagesc(nexta);
fn=['img_',num2str(s),'.png'];
fullFileName= fullfile('C:\Users\Matti\Google Drive\Paul_3D\Continuous_Fields\matlab\transport-escape\img',fn);
imwrite(config,fullFileName,'png'); 
fname=['u_',num2str(s),'.dat']; %filename string: xx_1.dat for the first time step
fullFileNameD= fullfile('C:\Users\Matti\Google Drive\Paul_3D\Continuous_Fields\matlab\transport-escape\dat',fname);
save(fullFileNameD, 'u' , '-ascii');
pause(time_pause) 

end

  

