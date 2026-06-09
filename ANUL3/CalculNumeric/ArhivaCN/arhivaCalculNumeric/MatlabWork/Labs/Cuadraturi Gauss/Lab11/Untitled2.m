% alpha = [0 0 0 0];
% beta = [pi 1/2 1/4 1/4];



% [A,x] = GausData(alpha, beta)
f = @(x)sin(x.^2);
rez = integralaSinuus(f, 10)

fw = @(x)f(x)./sqrt(1-x.^2);
integral(fw,-1,1)