clear all 
Dim=50; 
xx=zeros(Dim,Dim); 
Nstp=1000; 
%Data=zeros(Nstp+1,Dim,Dim); 
time_pause=0.1;
%colormap(gray); 
%%%initialization%%%% 
%%%random%%%%%%%%%% 
for ii=1:Dim   
	for jj=1:Dim     
		xx(ii,jj)=(rand(1)>0.4);   
	end 
end
%%%%%%%%%%%%%%%%%%%%% %}
%%glider%%%%%%%%%%%%% 
xx(5,2)=1; 
xx(6,2)=1; 
xx(4,2)=1; 
xx(5,3)=1;
%%%%%%%%%%%%%%%%%%%%%%%%
%{ %%%Blinker%%%%%%%%%%%%%% 
xx(2,1:3)=1; 
%%%%%%%%%%%%%%%%%%%%%%%% %}  
imagesc(xx)  
%F(1)=getframe;  
sum(sum(xx))/Dim^2      
Data(1,:,:)=xx;  
pause(time_pause) 
%%%%%%%update%%%%%%%%%  
for tt=1:Nstp   
	for ii=1:Dim    
		for jj=1:Dim             
			u=mod(ii-1,Dim);     
			if u==0     
				u=Dim;     
			end     
			d=mod(ii+1,Dim);     
			if d==0         
				d=Dim;     
			end     
			lft=mod((jj-1),Dim);     
			if lft==0     
			lft=Dim;     
			end     
			rt=mod(jj+1,Dim);     
			if rt==0         
			rt=Dim;     
			end              
			S=xx(u,jj)+xx(d,jj)+xx(ii,lft)+xx(ii,rt);     
			S=S+xx(u,lft)+xx(u,rt)+xx(d,lft)+xx(d,rt); %Moore Neighbor     
			if xx(ii,jj)==1         
				if S<1             
					xx_n(ii,jj)=0;         
				elseif (S<5)&&(S>1)             
					xx_n(ii,jj)=1;         
				else              
					xx_n(ii,jj)=0;         
				end     
			end     
			if xx(ii,jj)==0         
			if S==3             
				xx_n(ii,jj)=1;         
			else             
				xx_n(ii,jj)=0;         
			end     
		end    
	end        
end
tt;  
imagesc(xx_n)  
%Data(tt+1,:,:)=xx_n;  
xx=xx_n;  
%F(tt+1)=getframe;  
pause(time_pause)  %pause  
end   