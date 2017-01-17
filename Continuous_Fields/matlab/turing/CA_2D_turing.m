clear all
Dimx=150;
Dimy=150;
xx=zeros(Dimx,Dimy);
Nstp=50;
%Data=zeros(Nstp+1,Dimx,Dimy);
time_pause=0.0;
dd=0.5;

%%%turing parameters%%%%%
Ra=2;
Ri=6;
wa=1;
wi=0.23;
%%%%colormap scheme: empty-> black, green-> green, burning -> red%%%%%
%colormap(gray);
%hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%initialization%%%%
for ii=1:Dimx
  for jj=1:Dimy
    xx(ii,jj)=(rand(1)<dd);
  end
end


 imagesc(xx)
 
 %Data(1,:,:)=xx;
 pause(time_pause)

%%%%%%%update%%%%%%%%%
 for tt=1:Nstp
  for ii=1:Dimx
   for jj=1:Dimy
       
    Sa=0;
    u=modd(ii-Ra,Dimx);
    d=modd(ii+Ra,Dimx);
    lft=modd(jj-Ra,Dimy);
    rt=modd(jj+Ra,Dimy);
    for ll=u:d
        for nn=lft:rt
            Sa=Sa+xx(ll,nn);
        end
    end

    Si=0;
    u=modd(ii-Ri,Dimx);
    d=modd(ii+Ri,Dimx);
    lft=modd(jj-Ri,Dimy);
    rt=modd(jj+Ri,Dimy);
    for ll=u:d
        for nn=lft:rt
            Si=Si+xx(ll,nn);
        end
    end
    Si=Si-Sa;
    S=wa*Sa-wi*Si;
    xx_n(ii,jj)=(S>0);    
    %xx(u,lft)+xx(u,rt)+xx(d,lft)+xx(d,rt); %Moore Neighbor
   

    
   end
            
  end
   

 tt;
 imagesc(xx_n)
 %
fn=['img_',num2str(tt),'.png'];
fullFileName= fullfile('C:\Users\pm0355a\Desktop\img',fn);
imwrite(xx_n,fullFileName,'png'); 
fname=['u_',num2str(tt),'.dat']; %filename string: xx_1.dat for the first time step
fullFileNameD= fullfile('C:\Users\pm0355a\Desktop\dat',fname);
save(fullFileNameD, 'u' , '-ascii');
%

 %Data(tt+1,:,:)=xx_n;
 xx=xx_n;
 pause(time_pause)
 end
 hold off