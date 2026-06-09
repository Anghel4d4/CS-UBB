f = @(x) x-cos(x);

x0 = 0.5;
x1 = pi/4;

% secanta(f, x0,x1,10,0.0000000001);

fdev = @(x) 1+sin(x);
tangenta(f,fdev,x1,10,0.0000000000000000000000001);