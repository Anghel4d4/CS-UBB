fi=@(x) abs(x)+0.5*x-x.^2;
n=20;
xx=linspace(-1,1,5000);
j=0:n;
x1=sort(cos(j*pi/n));
y1=fi(x1);
yy1=ChebLagrange(y1,xx);
n=100;
j=0:n;
x2=sort(cos(j*pi/n));
y2=fi(x2);
yy2=ChebLagrange(y2,xx);
subplot(2,1,1)
plot(xx,yy1,x1,y1,'.',xx,fi(xx))
subplot(2,1,2)
plot(xx,yy2,x2,y2,'.')