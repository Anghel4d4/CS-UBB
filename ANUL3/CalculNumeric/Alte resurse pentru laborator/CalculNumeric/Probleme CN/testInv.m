%{
    2.49 Implementati o procedura pentru inversarea unei matrice triunghiulare inferior
    cu 1 pe diagonala principala. Testati-o pentru matricea:
        1  0  0  0
        3  1  0  0
        5  2  1  0
        7  4 -3  1
%}
clc;
fprintf('Problema 2.49\n');
fprintf('test 1: test cu matricea din enunt\n');
A = [ [1 0 0 0];
      [3 1 0 0];
      [5 2 1 0];
      [7 4 -3 1]
    ]
invSistem = inv(A)
invProcedura = invGaussTriunghiulara(A)

fprintf('test 2: test cu o matrice generata de 5 x 5 triunghiulara inferior\n');
n = 5;
A = tril(round(normrnd(0, 5, n, n)), -1) + diag(ones(n, 1))
invSistem = inv(A)
invProcedura = invGaussTriunghiulara(A)



