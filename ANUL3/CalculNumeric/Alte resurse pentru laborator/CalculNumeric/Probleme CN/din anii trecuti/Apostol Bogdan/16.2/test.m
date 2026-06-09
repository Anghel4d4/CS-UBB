% cum in enunt nu era precizata eplicit am folosit o functie oarecare
f=inline('x+cos(5*x)');
x=linspace(-1,1,1000);
y=f(x);
xx=[-1:0.5:1];
yy=f(xx);
hold on;
plot(x,y);
plot(xx,yy,'k+');
[a,b,c,d]=natural(xx,yy);
yn=valspline(xx,a,b,c,d,x);
plot(x,yn,'k');
d=derivata(f,xx);
%valorile splineului Hermite pt fiecare din subintervale
for i=1:length(xx)-1
    xh=[xx(i),xx(i+1)];
    yh=[yy(i),yy(i+1)];
    dh=[d(i),d(i+1)];
    xi=interval(x,xh(1),xh(2));
    rez=polHermite(xh,yh,dh,xi);
    plot(xi,rez,'g');
end
legend('Functia','Nodurile','Natural','Hermite',-1)
