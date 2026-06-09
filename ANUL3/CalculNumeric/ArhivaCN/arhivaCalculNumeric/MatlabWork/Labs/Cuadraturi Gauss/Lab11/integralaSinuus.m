function rez = integralaSinuus(f,n)

alpha = zeros(1,n);
% beta = [pi, 1/2, 1/4*ones(1,n-2)];
% beta = [pi, 1/4*ones(1,n-1)];
beta = [2*(4-1:(n-1))]



[A,x] = GausData(alpha, beta);
rez = A*f(x);