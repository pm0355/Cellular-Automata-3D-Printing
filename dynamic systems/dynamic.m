clear all
Dim=200;
xx=zeros(Dim,Dim);
Nstp=100;
%Data=zeros(Nstp+1,Dim,Dim);
time_pause=0.1;
Na=8;
Nth=3;
R=2;
SS=0;

%%%%colormap scheme%%%%%%%
mymap=colormap(hot(Na+1));
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%random initialization%%%%
for ii=1:Dim
  for jj=1:Dim
    xx(ii,jj)=randi(Na)-1;
  end
end

%xx(round(Dim/2),round(Dim/2))=2; %%%%light up one tree at the center
imagesc(xx)
 
 %Data(1,:,:)=xx;
 pause(time_pause)

%%%%%%%update%%%%%%%%%
 for tt=1:Nstp
  for ii=1:Dim
   for jj=1:Dim
        if xx(ii,jj) >= 1 %if Alive iterate one state
            xx_n(ii,jj)=mod(xx(ii,jj)+1, Na);
        else %else if dead check neighbours
            SS = 0; %%number of active cells
            for hh = -R:1:R     %boundary condition and check neighbors 
                for ww = -R:1:R
                    ilocal = ii+hh; %local height relative to current cell
                    jlocal = jj+ww; %local width relative to current cell
                    inei = mod(ilocal,Dim);
                    if(inei==0)
                        inei=Dim;
                    end
                    jnei = mod(jlocal,Dim);
                    if(jnei== 0)
                        jnei = Dim;
                    end                    
                    if(xx(inei,jnei) == 1)
                        SS = SS + 1;
                    end
        
                 end
            end                       
            if SS>=Nth %if at least Nth neighbours are alive, current cell is alive
                xx_n(ii,jj)=1;
            else %else cell stays dead
                xx_n(ii,jj)=0;
            end
        end

  end
 end
 
 tt;
 imagesc(xx_n)
 fn=['C:\Users\matti\Downloads\3d\excitable\img',num2str(tt),'.png'];
 imwrite(xx_n,mymap,fn,'png'); 
 %{
 %Data(tt+1,:,:)=xx_n;
 fn=['img',num2str(tt),'.png'];
imwrite(xx,fn,'png'); 
fname=['xx_',num2str(tt),'.dat']; %filename string: xx_1.dat for the first time step
save(fname, 'xx' , '-ascii');
%}
 xx=xx_n;
 pause(time_pause)
 end
 hold off