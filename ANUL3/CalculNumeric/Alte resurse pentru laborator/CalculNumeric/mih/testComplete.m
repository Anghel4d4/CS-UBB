m=10;
k=0:m;
x = sort(pi*cos(k*pi/m));
f =@(x)cos(10*x)+sin(sqrt(3)*x);
y = f(x);
xi = linspace(-pi, pi, 300);
m = cos(10*x(1))+sin(sqrt(3)*x(1));
n =cos(10*x(length(x)))+sin(sqrt(3)*x(length(x)));
fi = interpSplineComplete(x,y,m,n,xi);
dxSageata = (x(length(x))-x(1))/10;
plot(x,y,'o', xi, yi, '-', [x(1), x(1)+dxSageata], [y(1), y(1)+dxSageata*m], '-r',[x(length(x)), x(length(x))-dxSageata], [y(length(x)), y(length(x))-dxSageata*n], '-r')