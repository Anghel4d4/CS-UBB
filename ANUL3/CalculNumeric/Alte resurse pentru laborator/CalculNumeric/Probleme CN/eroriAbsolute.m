clearvars
format long

err = 1;
n = 1;

while err > 1e-7
   err = abs(calcSumaEuler(n) - exp(1));
   n = n + 1;
end
n

N = 17;
e = zeros(N,1);
err = zeros(N,1);

for n = 0:N-1
    e(n+1) = calcLimitaEuler(10^n);
end

err =  abs(exp(1) - e);

E = [(0:16)', err]

[m,i] = min(err);
min = E(i, :)