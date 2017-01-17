function update=update()
  global u;
  global nextu;
  global v;
  global nextv;

  k=.002;
  F=2.5;
  n=100;
  Du=0.0002; %
  Dv=0.0001; %
  Dh=.01;% spatial res
  Dt=.0015;% time step
  for x=1:n
    for y=1:n
      %state-transistion function
      uC=u(x,y);
      uR=u(modi(x+1,n),y);
      uL=u(modi(x-1,n),y);
      uU=u(x,modi(y+1,n));
      uD=u(x,modi(y-1,n));
    
      vC=v(x,y);
      vR=v(modi(x+1,n),y);
      vL=v(modi(x-1,n),y);
      vU=v(x,modi(y+1,n));
      vD=v(x,modi(y-1,n));
      uLap = (uR + uL + uU + uD- 4*uC)/(Dh^2);
      vLap = (vR + vL + vU + vD - 4*vC)/(Dh^2);
      nextu(x,y) = uC+((F-uC) -uC*vC^2 +Du*uLap)*Dt;
      %% eps*(nextU(x,y)-uC)/Dt=uC*(1-uC) - ((uC-q)/(uC+q))*f*vC+(Du*uLap);
      nextv(x,y) = vC+(-(F+k)*vC +uC*vC^2 +Dv*vLap)*Dt;

      
    end
  end

  u=nextu;
  nextu=u;
  v=nextv;
  nextv=v;  
  end