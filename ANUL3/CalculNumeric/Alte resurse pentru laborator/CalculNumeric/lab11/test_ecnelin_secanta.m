% ex 1 
f=@(x) x^3-x-1;
x0=2;
x1=1;
[z, ni] = Secanta(f, x0, x1, 1e-7)