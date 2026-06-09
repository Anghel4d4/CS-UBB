function y=myarctan(x)
% arctg
s = 0;
t = x;
n = 1;
xn = x;
while s+t ~= s
    s = s+t;
    xn = - x^2 * xn;
    t = xn /(2*n+1);
    n = n+1;
end
y = s;
end