n=10;
t=linspace(0, 1, n);
x=randn(1,1,1,n);
ti=linspace(0,1,200);
xi=splineNat(t,x,ti);
plot(t,x,ti,xi);
