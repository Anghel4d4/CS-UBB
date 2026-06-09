%pentru a se rezolva A=xB
%se descompune A=M-N
%metode de descompunere
%1. Jacobi
%M = D = diag(diag(A)) => o matrice cu diagonala lui A si in rest 0
%N=M-a
%2. Gauss sidel
%matricea trebuie sa fie triunchiulara superior
%M=triu(A)
%N=M-A
%3. SOR

function x = Jacobi()
