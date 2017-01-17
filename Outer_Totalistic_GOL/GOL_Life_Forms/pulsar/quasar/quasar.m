 clear all
Dim=100;
xx=zeros(Dim,Dim);
Nstp=100;
%Data=zeros(Nstp+1,Dim,Dim);
time_pause=.1;
%load xx_100.dat;
%colormap(gray);
%%%initialization%%%%
%{
%%%random%%%%%%%%%%
for ii=1:Dim
for ii=1:Dim
  for jj=1:Dim
    xx(ii,jj)=(rand(1)>0.4);
  end
end
%%%%%%%%%%%%%%%%%%%%%
%}

%%%%%quasar set%%%%%%%%

%%first set%%%%%%%%%%%%%
xx(2,[12:14;18:20;])=1;
xx(4,[10;15;17;22])=1;
xx(5,[10;15;17;22])=1;
xx(6,[10;15;17;22])=1;
xx(7,[12:14;18:20;])=1;

%%2nd set%%%%%%%%%%%%%
xx(9,[10:12;20:22;])=1;
xx(10,[9;14;18;23;])=1;
xx(11,[9;14;18;23;])=1;
xx(12,[9;14;18;23;])=1;
xx(14,[10:12;20:22;])=1;

xx(10,[4:6;26:28;])=1;
xx(12,[2;7;25;30])=1;
xx(13,[2;7;25;30])=1;
xx(14,[2;7;25;30])=1;
xx(15,[4:6;26:28;])=1;

%%3rd set%%%%%%%%%%%%%
xx(18,[10:12;20:22;])=1;
xx(20,[9;14;18;23;])=1;
xx(21,[9;14;18;23;])=1;
xx(22,[9;14;18;23;])=1;


xx(17,[4:6;26:28;])=1;
xx(18,[2;7;25;30])=1;
xx(19,[2;7;25;30])=1;
xx(20,[2;7;25;30])=1;
xx(23,[10:12;20:22;])=1;
xx(22,[4:6;26:28;])=1;

%%fourth set%%%%%%%%%%%%%
xx(30,[12:14;18:20;])=1;
xx(28,[10;15;17;22])=1;
xx(27,[10;15;17;22])=1;
xx(26,[10;15;17;22])=1;
xx(25,[12:14;18:20;])=1;
%}

%xx=xx_100(1:99,1:99);



%%%%%%%%%%%%%%%%%%%%%%%%

%{
%%%Blinker%%%%%%%%%%%%%%
xx(2,1:3)=1;
%%%%%%%%%%%%%%%%%%%%%%%%
%}
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
        if S<2
            xx_n(ii,jj)=0;
        elseif (S==2) | (S==3)
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
 %{
 %Data(tt+1,:,:)=xx_n;
fn=['img',num2str(tt),'.png'];
imwrite(xx,fn,'png'); 
fname=['xx_',num2str(tt),'.dat']; %filename string: xx_1.dat for the first time step
save(fname, 'xx' , '-ascii');
%}
xx=xx_n;
 %F(tt+1)=getframe;
 pause(time_pause)
 %pause
 end