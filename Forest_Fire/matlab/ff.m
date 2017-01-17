clear all
Dim=150;
xx=zeros(Dim,Dim);
xx_n=zeros(Dim,Dim);
Nstp=100;
%Data=zeros(Nstp+1,Dim,Dim);
time_pause=0.1;
dd=0.8;
p=.01;
f=.0001*p;
size(xx)
%%%%colormap scheme: empty-> black, green-> green, burning -> red%%%%%
mymap=[0,0,0;0,1,0;1,0,0];
colormap(mymap);
caxis([0 2])
caxis manual
%axis tight
%colormap(gray);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%initialization%%%%
for ii=1:Dim
  for jj=1:Dim
    xx(ii,jj)=(rand(1)<dd);
  end
end
xx(round(Dim/2),round(Dim/2))=2; %%%%light up one tree at the center
size(xx)
 imagesc(xx)
 
 %Data(1,:,:)=xx;
 pause(time_pause)
xx;
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
    
    
    %xx(u,lft)+xx(u,rt)+xx(d,lft)+xx(d,rt); %Moore Neighbo
    if xx(ii,jj)==2 %burning tree
        xx_n(ii,jj)=0; %becomes empty
    end
    
    if xx(ii,jj)==1 %green tree
        %nei=[xx(u,jj),xx(d,jj),xx(ii,lft),xx(ii,rt)]; %array of neighbor's values
        nei=[xx(u,jj),xx(d,jj),xx(ii,lft),xx(ii,rt),xx(u,lft),xx(d,lft),xx(d,rt),xx(u,rt)];
        if any(nei==2)  %% if there is one burning tree 
          xx_n(ii,jj)=2;
        else
            xx_n(ii,jj)=1;
        end
        if(rand(1)<=f)
            xx_n(ii,jj)=2;
        end
    end
    
    if xx(ii,jj)==0
            xx_n(ii,jj)=0;
              if(rand(1)<=p)
              xx_n(ii,jj)=1;
              end

    end
   end
  end
   tt;
imagesc(xx_n)
%Data(tt+1,:,:)=xx_n;
xx=xx_n;
fn=['img',num2str(tt),'.png'];
imwrite(xx,fn,'png'); 
fname=['xx_',num2str(tt),'.dat']; %filename string: xx_1.dat for the first time step
save(fname, 'xx' , '-ascii'); 
pause(time_pause)
 end
 hold off
