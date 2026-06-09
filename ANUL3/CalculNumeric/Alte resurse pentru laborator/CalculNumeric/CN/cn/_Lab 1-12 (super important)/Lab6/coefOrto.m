function cp =coefOrto(a, b, c)
%calculeaza coeficientii polinoamelor ortogonale
%date prin relatiile de recurenta
% a, b, c coeficientii formulei de recurenta
% tb sa gasim coef polinomului pi indice (k +1)
n=length(a);
if n~=length(b) || n~=length(c)
    error('a, b, c nu au aceesi lungime')
end
%calculam coeficientii lui pi indice (n+1)
cp = zeros(1, n+2);
cp(1) = 0;
cp(2) = 1;
for k=2:n
    cp(k+1) = (a(k)*cp(k) + b(k)*cp(k-1))/c(k);
end