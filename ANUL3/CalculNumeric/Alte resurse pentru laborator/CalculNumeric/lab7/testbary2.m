fi=@(x) abs(x)+0.5*x-x.^2;
n=7;
xx=linspace(-1,1,5000);
x1=linspace(-1,1,n+1);
y1=fi(x1);
yy1=baryLagrange(x1,y1,xx);
n=15;
x2=linspace(-1,1,n+1);
y2=fi(x2);
yy2=baryLagrange(x2,y2,xx);
subplot(2,1,1)
plot(xx,yy1,x1,y1,'.',xx,fi(xx))
subplot(2,1,2)
plot(xx,yy2,x2,y2,'.')