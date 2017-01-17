function update=update()
  global u;
  global nextu;
  global v;
  global nextv;

  q=.002;
  f=2.5;
  n=256;
  Du=1; %
  Dv=0.000; %
  Dh=.01;% spatial res
  Dt=.0015;% time step
  eps=0.05;
  for x=1:n
    for y=1:n
      %state-transistion function
      uC=u(x,y);
      uR=u(modi(x+1,n),y);
      uL=u(modi(x-1,n),y);
      uU=u(x,modi(y+1,n));
      uD=u(x,modi(y-1,n));
      
  
      uR2=u(modi(x+1,n),y);
      uL2=u(modi(x-2,n),y);
      uU2=u(x,modi(y+2,n));
      uD2=u(x,modi(y-2,n));
    
      vC=v(x,y);
      vR=v(modi(x+1,n),y);
      vL=v(modi(x-1,n),y);
      vU=v(x,modi(y+1,n));
      vD=v(x,modi(y-1,n));
      
      vR2=u(modi(x+1,n),y);
      vL2=u(modi(x-2,n),y);
      vU2=u(x,modi(y+2,n));
      vD2=u(x,modi(y-2,n));

      uLap = (uR + uL + uU + uD+ uR2 + uL2 + uU2 + uD2- 4*uC)/(Dh^2);
      vLap = (vR + vL + vU + vD+vR2+ vL2 + vU2 + vD2 - 4*vC)/(Dh^2);
      nextu(x,y) = uC + (uC*(1-uC) - ((uC-q)/(uC+q))*f*vC)*Dt/(eps)+(Du*uLap)*Dt;
      %% eps*(nextU(x,y)-uC)/Dt=uC*(1-uC) - ((uC-q)/(uC+q))*f*vC+(Du*uLap);
      nextv(x,y) = vC + ((uC-vC) +Dv*vLap)*Dt;

      
    end
  end

  u=nextu;
  nextu=u;
  v=nextv;
  nextv=v;  
  end