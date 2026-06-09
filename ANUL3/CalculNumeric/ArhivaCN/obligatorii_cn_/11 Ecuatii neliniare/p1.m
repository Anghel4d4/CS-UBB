format long;
u=1; e=0.5;
errAbsoluta=1e-9; errRelativa=1e-9;
itMax=1000;

f = @(x) x - e * sin(x) - u;
fd = @(x) 1 - e * cos(x);
phi = @(x) e * sin(x) + u;

[sol1,iter1]=Newton(f,fd,0,errAbsoluta,errRelativa,itMax);
disp([sol1,iter1]);

[sol2,iter2]=secant(f,0,1,errAbsoluta,errRelativa,itMax);
disp([sol2,iter2]);

[sol3,iter3]=AproximatiSuccesive(phi,0,errAbsoluta,errRelativa,itMax);
disp([sol3,iter3]);
