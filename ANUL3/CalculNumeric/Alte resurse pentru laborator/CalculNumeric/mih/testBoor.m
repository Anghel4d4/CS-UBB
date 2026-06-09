m=10;
k=0:m;
x = sort(pi*cos(k*pi/m));
f =@(x)cos(10*x)+sin(sqrt(3)*x);
y=f(x);
xi = linspace(-pi, pi, 300);
fi = interpSplineBoor(x,y,xi);
plot(x,y,'o', xi,fi, xi,f(xi))