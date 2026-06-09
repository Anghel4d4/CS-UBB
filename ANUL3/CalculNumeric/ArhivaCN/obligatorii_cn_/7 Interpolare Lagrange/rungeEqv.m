%RUNGE PENTRU ECHIDISTANTEEE
m=input('m=');
x=linspace(-5,5,m+1);
f=@(x) 1./(1+x.^2);
y=f(x);
t=linspace(-5,5,6000);
vp=lagr(x,y,t);
plot(t,f(t),t,vp);
ylim([-10,10]);