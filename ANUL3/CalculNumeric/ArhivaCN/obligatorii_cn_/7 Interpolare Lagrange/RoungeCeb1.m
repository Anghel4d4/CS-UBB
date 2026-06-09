% m=10 sau 25
m= input('m=');
k=0:m;
x=5*cos((2*k+1)*pi/(2*m+2));
f=@(x) 1./(1+x.^2);
t=linspace(-5,5, 6000);
vp=lagr(x,y,t);
%ylim([-10,10])
plot(t,f(t),t,vp);

