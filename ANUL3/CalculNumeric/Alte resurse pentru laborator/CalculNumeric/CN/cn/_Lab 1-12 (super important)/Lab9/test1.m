n=10;
t=linspace(0, 1, n);
x=normrnd(1,1,1,n);
%a=sistem1(t,x)
ti=linspace(0,1,200);
xi=splineNat(t,x,ti);
plot(t,x,'*',ti,xi)
