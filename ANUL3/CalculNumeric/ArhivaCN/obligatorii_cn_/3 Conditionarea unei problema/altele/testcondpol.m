%testcondpol

xi = 1:20;
p = poly(xi);
nc=condpol(p,xi)';
format short g
[ncs,i]=sort(nc);
[i,nc(i)]