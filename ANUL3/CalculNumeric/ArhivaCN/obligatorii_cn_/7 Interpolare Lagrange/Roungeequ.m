% m=10 sau 25
m= input('m=');

x=linspace(-5,5, m+1);
f=@(x) 1./(1+x.^2);
y=f(x);
t=linspace(-5,5, 6000);
vp=lagr(x,y,t);
%ylim([-10,10])
plot(t,f(t),t,vp);

