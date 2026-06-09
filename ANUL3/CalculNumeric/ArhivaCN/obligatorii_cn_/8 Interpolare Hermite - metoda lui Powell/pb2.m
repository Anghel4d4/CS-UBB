
m=10;
k=0:m;
x=sort(cos(k'*pi/m))*0.999;  %Chebyshev de speta 2

t = linspace(-0.999,0.999, 10000);

f=@(x) (x.^2)./(1-x.^2);
fd=@(x) (2*x)./((x.^2-1).^2);

y=f(x);
yd=fd(x);

[z,td]=difdivnd(x,y, yd);

vpi=pNewton(td,z,t);
plot(t, vpi, t, f(t));
figure();
plot(t, vpi, x, y);





