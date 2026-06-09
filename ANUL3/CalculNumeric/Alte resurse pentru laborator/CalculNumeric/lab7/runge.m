function r = runge(n)

s = linspace(-1,1,n);
x=-1:0.01:1;
plot(x,f(x));

p = f(s);
hold on
plot(x,v(s,p,x));

end