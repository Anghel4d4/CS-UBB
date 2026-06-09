function [x,i] = sor(A,b,x0,tol,omega)
[m,n] = size(A);
D = diag(diag(A));
U = triu(A-D);
L = tril(A-D);
count = 1;
w = omega;

if m~=n
    error('Matricea coeficientilor nu este o matrice patratica.');
else
    xnew = (inv(D+w*L))*(((1-w)*D-w*U)*x0 +w*b);
    RelError = (abs(xnew-x0))/(abs(xnew));
    RelErrorCol = max(max(RelError));
    while RelErrorCol>tol
        xnew = (inv(D+w*L))*(((1-w)*D-w*U)*x0 +w*b);
        RelError = (abs(xnew-x0))/(abs(xnew));
        RelErrorCol = max(max(RelError));
        x0 = xnew;
        count = count+1;
    end
    x = xnew;
    i = count;
end