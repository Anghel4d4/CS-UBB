clc;

% Daca An este matrice strict diagonal dominanta atunci iteratiile
% asociate Jacobi si Gauss-Seidel converg pentru orice x_0 initial.

% Matricea An exprimata mai jos nu este strict diagonal dominanta pt ca exista 
% |a_ii| =sum(a_ij), i,j <=n, ex. |2| = |-1| + |-1| si teoremele de
% convergenta nu iau in calcul acest caz => in particular, sunt sanse ca
% una sau ambele metode sa nu convearga. 

n=10;
An = diag(ones(1,n))*2 - diag(ones(1,n-1),-1) - diag(ones(1,n-1),1);

b=[4 3*ones(1,n-2) 4]';

x0 = An \ b;

x1 = rezolvaJacobi(An,b,1e-5)
x2 = rezolvaGaussSeidel(An,b,1e-5)