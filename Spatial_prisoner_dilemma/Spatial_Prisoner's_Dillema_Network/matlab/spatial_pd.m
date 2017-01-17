%%%prisoner dillemma%%% 
%spatial_pd .m
clear all 
Nstp=100; 
Dim=100; %10 by 10 grid with 100 cells
xx=zeros(Dim,Dim); 
xx=round(rand(Dim,Dim)); 
%xx(round(Dim/2),round(Dim/2))=1; 
mymap=[0,0,1;0,1,0;1,1,0;1,0,0];
colormap(mymap); 
%caxis ([0 3]) 
%caxis manual 
%imagesc(xx) 
for tt =1:Nstp 
	for ii =1:Dim 
		for jj =1:Dim 
			sum1=0; 
			for nx= -1:1 
				for ny= -1:1 
					indx=pBC(ii+nx ,Dim); 
					indy=pBC(jj+ny ,Dim); 
					sum1=sum1+payoff(xx(ii,jj) ,xx(indx, indy)); 
				end 
			end 
			xx_p(ii,jj)=sum1; 
		end 
	end 
	sum1=0;
for ii =1:Dim 
	for jj =1:Dim 
		pmax=xx_p(ii ,jj); 
		mx=ii ; 
		my=jj ; 
		for nx= -1:1 
			for ny= -1:1 
				indx=pBC(ii+nx ,Dim); 
				indy=pBC(jj+ny ,Dim); 
				if pmax<xx_p(indx , indy) 
					pmax=xx_p(indx , indy); 
					mx=indx ; my=indy ; 
				end 
			end 
		end 
		xx_n(ii , jj)=xx(mx,my); 
	end 
end 

xxcol=xx_n*2+xx ; 
c=imagesc( xxcol );
fn=['C:\Users\matti\Downloads\network\img',num2str(tt),'.png'];

%imwrite(xxcol,mymap,fn,'png'); 
%fname=['xx_',num2str(tt),'.dat']; %filename string: xx_1.dat for the first time step
%save('C:\Users\matti\Downloads\network'+fname, 'xx' , '-ascii');
xx=xx_n; 
pause(0.1);
end