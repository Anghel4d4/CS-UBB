clc
f = @(x) x^4-x^3+5/4*x^2-x+1/4;
fd = @(x) 4*x^3-3*x^2+5/4*2*x-1;
x = metNewton(f,fd,1e-5,1,1000);
x = metNewton(f,fd,1e-5,1i,1000);
disp(x);