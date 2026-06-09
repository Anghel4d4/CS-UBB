function [A,x] = genereazaLegendre(n)
% genereaza cuadratura Gauss-Legendre cu n noduri
alpha = zeros(1,n);
i = 1:n-1;
beta = [2,(4-i.^-2).^-1];
J = diag(alpha) + diag(sqrt(beta(2:n)),1) + diag(sqrt(beta(2:n)),-1);
[v,D] = eig(J);
A = beta(1) * v(1,1:n).^2;
x = diag(D);
end