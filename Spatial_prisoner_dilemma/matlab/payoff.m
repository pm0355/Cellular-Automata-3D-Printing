%%%spatial prisoner dillemma%%% 
%payoff.m
function p1=payoff (x1_p,x2_p) 
R=1; b=1.9; P=0; S=0;
%two coop play and recieve favorable outcome 
if (x1_p==0) && (x2_p==0) p1=R;
%coop play and defect , defect recieves favorable outcome 
elseif (x1_p==0) && (x2_p==1) p1=S;
%defect play and coop , coop recieves favorable outcome 
elseif (x1_p==1) && (x2_p==0) p1=b;
%two defectors play and recieve unfavorable outcome 
elseif (x1_p==1) && (x2_p==1) p1=P;
end