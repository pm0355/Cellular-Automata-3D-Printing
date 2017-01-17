function initialize= initialize(x,y,n)
	global u;
  	global nextu;
  	global v;
  	global nextv;

    for x=1:n
        for y=1:n
            u(x,y)=1.0+unifrnd(-.03,.03);
            v(x,y)=1.0+unifrnd(-.03,.03);
        end
    end

    nextu=zeros(n,n);
    nextv=zeros(n,n);
end

    