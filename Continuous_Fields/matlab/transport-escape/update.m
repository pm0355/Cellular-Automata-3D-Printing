function update=update(n)
  global a;
  global nexta;
  global b;
  global nextb;
  global xvalues;
  global yvalues;
  mu_a = 0.001 % mobility of species a
  mu_b = 0.001 % mobility of species 
  Dh=.01; %spatial res
  Dt=.01; % temporal resolution
  for x=1:n
    for y=1:n
      %state-stransistion function
      aC=a(x,y);
      aR=a(modi(x+1,n),y);
      aL=a(modi(x-1,n),y);
      aU=a(x,modi(y+1,n));
      aD=a(x,modi(y-1,n));

      bC=b(x,y);
      bR=b(modi(x+1,n),y);
      bL=b(modi(x-1,n),y);
      bU=b(x,modi(y+1,n));
      bD=b(x,modi(y-1,n));
      
      bLapNum = bR + bL + bU + bD - 4*bC;
      nexta(x,y) = aC + mu_a * ((aR-aL)*(bR-bL)+(aU-aD)*(bU-bD) +4*aC*bLapNum) * Dt/(4*Dh^2);
      nextb(x,y) = bC + mu_b * bLapNum * Dt/(Dh^2);
    end
  end
  a=nexta;
  nexta=a;
  b=nextb;
  nextb=b;  
  end