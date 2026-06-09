clc
A=diag(ones(1,10)*5)-diag(ones(1, 9),-1)-diag(ones(1,9),1)
b=[4;ones(8,1)*3;4]
x0=A\b
x1=rezolvaGaussSeidel(A,b,1e-5)
x2=rezolvaJacobi(A,b,1e-5)
x3=rezolvaSOR(A,b,0.5,1e-5)