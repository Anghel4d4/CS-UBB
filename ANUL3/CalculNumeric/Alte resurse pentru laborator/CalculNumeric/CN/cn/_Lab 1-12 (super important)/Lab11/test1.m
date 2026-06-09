[A, x] = genereazaLegendre(5);
f = @(x)x.^4;
I=aplicaCuadratura(A, x, f)
disp(I)