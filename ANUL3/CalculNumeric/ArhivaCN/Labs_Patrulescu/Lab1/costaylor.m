function s = costaylor(x)
% COSTAYLOR Power series for sin(x).
% COSTAYLOR(x) tries to compute cos(x)
% from a power series
s = 0;
t = 1;
n = 1;
while s+t ~= s;
    s = s + t;
    t = -x^2/(n*(n+1))*t;
    n = n + 2;
end