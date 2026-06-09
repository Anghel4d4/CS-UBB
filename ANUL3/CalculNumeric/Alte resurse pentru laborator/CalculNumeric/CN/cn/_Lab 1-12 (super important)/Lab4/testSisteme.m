clc
A=round(normrnd(10, 7, 10, 10));
b = A*ones(10, 1);
x=A\b
x1 = rezolvaGauss(A,b)
x2 = rezolvaLUP(A,b)