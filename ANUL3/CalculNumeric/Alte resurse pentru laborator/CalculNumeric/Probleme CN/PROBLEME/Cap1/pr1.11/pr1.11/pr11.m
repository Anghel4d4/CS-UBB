n=20;
xi=zeros(1,2*n);   %returneaza array de zerouri
xi(1:2:2*n)=1:n;
xi(2:2:2*n)=1:n;
p1=poly(xi);		%polinomul
nc=condpol(p1,xi);
nc=nc(1:2:2*n);
[nc,ii]=sort(nc);
format short g
[ii',nc']

%studiu grafic perturbatie normala
subplot(1,2,1)
wilkinson(n,p1)
axis equal
title('perturbatie normala')
%studiu grafic perturbatie uniforma
subplot(1,2,2)
wilkinsonu(n,p1)
axis equal
title('perturbatie uniforma')


