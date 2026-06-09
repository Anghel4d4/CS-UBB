function I=aplicaCuadratura(A, x, f)
% tb sa aplicam formula 
% integrala de la -1 la 1 din wf dx =
n = length(x);
I = sum(A(1:n)*f(x(1:n)));