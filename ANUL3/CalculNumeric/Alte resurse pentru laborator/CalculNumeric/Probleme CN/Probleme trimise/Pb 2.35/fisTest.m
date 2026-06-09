clc
A = [  -2, 0, 0, 4, -1, 0;
       0, -1, 4, 0,  0, -1;
       0, -1, 0, -1, 4, -1;
       4, -1, 0 , -1, 0, 0;
       0, 0, -1, 0, -1, 4;
       -1, 4, -1, 0, -1, 0];
b = [1; 2; 1; 2; 2; 1];
%Pentru convergenta metodelor Jacobi si G-S transformam matricea A intr-o 
%matrice strict diagonal dominanta(asta putem sa facem prin permutarea liniilor)
A = [A(4,:);A(6,:);A(2,:);A(1,:);A(3,:);A(5,:)];
b = [b(4);b(6);b(2);b(1);b(3);b(5);];
%pt verificare
rez = A\b;
%x - solutia, ni - numarul pasilor

[x,ni] = Jacobi(A, b)
[x,ni] = gs(A ,b, zeros(size(b)), 1e-4)