function s = sintaylor(x)
% SINTAYLOR Power series for sin(x).
% SINTAYLOR(x) tries to compute sin(x)
% from a power series
s = 0;
t = x;
n = 1;
while s+t ~= s;
    s = s + t;
    t = (-x^2/((n+1)*(n+2)) ) * t;
    n = n + 2;
end