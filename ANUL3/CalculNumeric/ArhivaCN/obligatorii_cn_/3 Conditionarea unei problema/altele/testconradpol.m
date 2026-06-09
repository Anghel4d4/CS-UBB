n=0:19; xi=2*n+1;
p=poly(xi);
nc=condpol(p,xi);
[xi',nc']

nn=length(xi);
h=plot(xi,zeros(1,nn),'.');
set(h,'Markersize',21);
hold on
for k=1:1000
    r=randn(1,nn+1);
    pr=p.*(1+1e-10*r);
    z=roots(pr);
    h2=plot(z,'k.');
    set(h2,'Markersize',4)
end
axis equal