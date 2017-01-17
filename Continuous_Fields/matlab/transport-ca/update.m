function update=update(n)
  global config;
  global nextconfig;
  global xvalues;
  global yvalues;
  Dh=.01; %spatial res
  Dt=.01; % temporal resolution
  wx=-.1; % constant velocity of mvmt
  wy=.3;  % constant velocity of mvmt
  for x=1:n
    for y=1:n
      %state-stransistion function
      nextconfig(x, y)= config(x, y) - ( wx * config(modi((x+1),n), y) - wx * config(modi((x-1),n), y)...
                                        + wy * config(x, modi((y+1),n))- wy * config(x, modi((y-1),n)))*(Dt/(2*Dh));
    end
  end
  config=nextconfig;
  nextconfig=config; 
  end