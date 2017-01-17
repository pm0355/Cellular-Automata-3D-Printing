mymap=[1,0,0;0,1,0]; 
colormap(mymap); 

time_pause=0.1;
size=256;
T=80000;
dx=.5;
dt=0.022;
n=[1 1:(size-1)];
s=[2:size size];
e=n;
w=s;
diffcoff=1;
x1=0.0026;
x2=0.837;
y1=1.8;
silon1=1/75;
silon2=1;
silon3=0.3;
c1=20;
c2=3;
c3=15;
a=0.06;
k1=3.0;

u=zeros(size,size);
v=zeros(size,size);
u(1:size,1:2)=1;

j1=1;
for i1=1:T,
if(i1==800)
	u(64:size,1:size)=0.0;
end

spat=diffcoff*(u(n,:)+u(s,:)+u(:,e)+u(:,w)-4*u)/(dx*dx);

del_u_1= -c1*0.5*u.*(1-sign(u-x1));
del_u_2= 0.5*(1-sign(u-x1).*sign(u-x2)).*(c2*u-a);
del_u_3= -0.5*c3*(1-sign(x2-u)).*(u-1);
del_u=del_u_1+del_u_2+del_u_3-v;

del_v_1= silon3*0.5*(1+sign(sign(x1-u)+sign(y1-v)-0.5)).*(k1*u-v);
del_v_2= silon1*0.25*(1-sign(del_v_1-0.0001)).*(1-sign(u-x2)).*(k1*u-v);
del_v_3= silon2*0.5*(1-sign(x2-u)).*(k1*u-v);

del_v=del_v_1+del_v_2+del_v_3;

unew=u+dt*(spat+del_u);
vnew=v+dt*del_v;

if(i1==100*(j1-1)+1)

imagesc(unew), caxis([-0.2 1.2])  
fn=['img_',num2str(i1),'.png'];
fullFileName= fullfile('C:\Users\matti\Downloads\panfilov\',fn);

imwrite(unew,mymap,fullFileName,'png'); 
%fname=['u_',num2str(i1),'.dat']; %filename string: xx_1.dat for the first time step
%fullFileNameD= fullfile('C:\Users\Matti\Google Drive\Paul_3D\Continuous_Fields\matlab\panfilov_model_spiral\',fname);
%save(fullFileNameD, 'u' , '-ascii');
pause(time_pause)  
j1=j1+1;
    
end
	u=unew;
	v=vnew;
end

