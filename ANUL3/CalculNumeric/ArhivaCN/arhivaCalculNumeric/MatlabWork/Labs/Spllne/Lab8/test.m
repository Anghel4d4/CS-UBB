x = 1:10;
f = sin(x);
[a,b,c,d] = Splinecubic(x,f,0, [1,1]);
X = 1:0.01:10;
plot(X, evalspline(x,a,b,c,d,X));
