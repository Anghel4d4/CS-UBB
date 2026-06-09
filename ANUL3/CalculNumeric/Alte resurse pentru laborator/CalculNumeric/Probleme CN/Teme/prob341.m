x = linspace(0,3*pi/2,10);
y = sin(x);
yd = -cos(x);
xi = linspace(0,3*pi/2,10);
yi1 = splineNat(x,y,xi);
yi2 = splineHermite2(x,y,yd);
yy = polyval(yi3,xi);
plot(xi,yi1,'*',xi,yy,'-');