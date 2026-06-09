% ex 1 
f=@(x) x^3-x-1;
fd=@(x) 3*x^2-1;
x0=2;
[z, ni] = ecnelin_Newton(f, fd, x0, 1e-7);

% ex 2
g=@(x) [x(1)^2+x(2)^2-1; x(1)^3-x(2)];
gd=@(x) [2*x(1), 2*x(2); 3*x(1)^2, -1];
x0 = [1;1];
[z,ni] = ecnelin_Newton(g, gd, x0, 1e-7);