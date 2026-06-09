clc;
fc = @(x) cos(x).*(x.^(1/2));
fs = @(x) sin(x).*(x.^(1/2));

Ic = integral(fc,0,1);
Is = integral(fs,0,1);
disp(Ic);
disp(Is);

% (a) Cuadratura adaptiva
qAdpc = quadAdaptive(@formSimpson,fc,0,1,1e-3);
qAdps = quadAdaptive(@formSimpson,fs,0,1,1e-3);
disp(qAdpc);
disp(qAdps);

% (b) Cuadratura Gauss-Legendre
fcc = @(t) 2.*t.^2.*cos(t.^2);
fss = @(t) 2.*t.^2.*sin(t.^2);
[A,t] = generateLegendre(50);
Icc = applyCuadrature(A,t,fcc);
Iss = applyCuadrature(A,t,fss);
disp(Icc);
disp(Iss);

% (c) Cuadratura Gauss-Jacobi
IJ=[];
for n=1:5
    [x,A] = Gauss_Jacobi(n,0,1);
end
