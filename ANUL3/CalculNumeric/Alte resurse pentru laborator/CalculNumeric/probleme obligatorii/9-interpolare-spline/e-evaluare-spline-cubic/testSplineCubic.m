x = [0 0.25 0.75 1];
y = [1 0.96 0.75 0.6];
yder = [0 -0.6]; 
xx = linspace(0,1,50);
[a,b,c,d] = Splinecubic(x,y,2,yder);
yy = valspline(x,a,b,c,d,xx);
plot(x,y,'o',xx,yy,'r');