clc
n = 15
t = -1+2*(1:n)/n;
v = vander(t);
fprintf('n=%d cond=%g\n', n, cond(v, 1))
t = 1./(1:n);
v = vander(t);
fprintf('n=%d cond=%g\n', n, cond(v,1))