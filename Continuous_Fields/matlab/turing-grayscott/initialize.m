function initialize= initialize(n)
	global u;
  	global nextu;
  	global v;
  	global nextv;   
    u=zeros(n,n);
    v=zeros(n,n);
    
    %{
    for x=1:n
        for y=1:n
           
            u(x,y)=1.+unifrnd(-.03,.03);
            v(x,y)=1.+unifrnd(-.03,.03);
         
                 
        end
    end
    %}
    u(50,50)=1;
    v(50,50)=1;
    nextu=zeros(n,n);
    nextv=zeros(n,n);
end
