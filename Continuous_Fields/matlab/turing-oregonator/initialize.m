function initialize= initialize(x,y,n)
	global u;
  	global nextu;
  	global v;
  	global nextv;
  
    
    for x=1:n
        for y=1:n
           
            u(x,y)=.25;
            v(x,y)=.015;
           
             if y>n/1.6 & x>n/3.71 & x<y/2.6
                u(x,y)=1;
                v(x,y)=1;
           else
                  u(x,y)=.25;
                  v(x,y)=.015;
        end
            %}         
        end
    end
    
    nextu=zeros(n,n);
    nextv=zeros(n,n);
end

    