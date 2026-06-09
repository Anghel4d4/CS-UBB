%Problema 2.29. Implementati un algoritm O(n) pentru rezolvarea unui sistem tridiagonal cu
%matrice SPD prin descompunere Cholesky.

% factorizarea Cholesky a unui matrice tridiagonal SPD.
% d si e sunt vectori de dimensiune n cu proprietatile
% A = diag(d) + diag(e(2:n),-1) + diag(e(2:n),1)
%
% g si h vectori de dimensiune n cu proprietatile ca matricea bidiagonala inferioara
% G = diag(g) + diag(h(2:n),-1) satisface A = GG^T.
function [g,h] = SistemTridiagonalCholesky(d,e)
n = length(d);
g = zeros(n,1);
h = zeros(n,1);
g(1) = sqrt(d(1));
for i=2:n
h(i) = e(i)/g(i-1);
g(i) = sqrt(d(i) - h(i)^2);
end