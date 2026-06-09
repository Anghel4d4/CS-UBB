%Problema 2.47
clc
n = 80;

A = diag((1:n)*2)+ diag((1:n-2)*0.5,2)+diag((3:n)*0.5,-2) ...
          + diag((1:n-4)*0.25,4)+ diag((5:n)*0.25,-4);
      
b=(pi*ones(n,1));

%rezolvaSOR are parametrii: A,b,omega,eroarea
%omega nu era precizat in problema si am luat o valoare oarecare, 0.5
x=rezolvaSOR(A,b,0.5,1e-5)