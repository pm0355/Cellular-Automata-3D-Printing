%%%spatial prisoner dillemma%%% 
%pBC.m
function ind=pBC(x ,dim) 
ind=mod(x ,dim ); 
if ind==0 
ind=dim; 
end
