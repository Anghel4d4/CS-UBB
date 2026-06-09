%RUNGE CEBISEVVVVVVV
m=input('m=');
k=0:m;
x=5*cos((2*k+1)*pi/(2*m+2));
f=@(x) 1./(1+x.^2);
y=f(x);
t=linspace(-5,5,6000);
vp=lagr(x,y,t);
plot(t,f(t),t,vp);