clc
%(x-1)^2(x-2)^2=x^4-6x^3+5x^2-12x+4
p=[1 -6 5 -12 4];
xi=[1 2];
m=[2 2];
nc=condpol(p,xi,m);
[nc,ii]=sort(nc);
format short g
[ii,nc]

%(x-1)^2(x-2)=x^3-4x^2+5x-2
p=[1 -4 5 -2];
xi=[1 2];
m=[2 1];
nc=condpol(p,xi,m);
[nc,ii]=sort(nc);
format short g
[ii,nc]

