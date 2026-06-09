clc
n=10;
H=hilb(n);
fprintf('n=%d cond=%g\n', n, cond(H))
