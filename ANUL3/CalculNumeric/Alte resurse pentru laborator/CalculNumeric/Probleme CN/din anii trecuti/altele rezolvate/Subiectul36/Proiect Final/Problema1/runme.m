function runme

% matricea A
A=[4 1 1 1; 0 -5 2 1; 1 1 10 1; -1 2 1 -6]

% descompunerea LUP a matricei A
[L,U,P]=lup(A)

% solutia sistemului pentru b1
b1 = [7 2 13 -4]
x1=ResolveLUP(L,U,P,b1')

% solutia sistemului pentru b2
b2 = [1 1 1 1]
x2=ResolveLUP(L,U,P,b2')

% solutia sistemului pentru b3
b3 = [1 2 -1 5]
x3=ResolveLUP(L,U,P,b3')

% solutia sistemului pentru b4
b4 = [3 4 5 6]
x4=ResolveLUP(L,U,P,b4')