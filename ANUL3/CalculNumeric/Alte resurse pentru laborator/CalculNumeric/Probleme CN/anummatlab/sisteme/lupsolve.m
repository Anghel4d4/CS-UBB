function x=lupsolve(A,b)
%LUPSOLVE rezolvare sistem prin descompunere LUP

[L,U,P]=lup(A);
y=forwardsubst(L,P*b);
x=backsubst(U,y);