function [y,n,err]=myarctan(x)
% arctg
s = 0;
t = x;
n = 1;
xn = x;
err = 0;
while s+t ~= s
    s = s+t;
    xn = - x^2 * xn;
    t = xn /(2*n+1);
    n = n+1;
    if n == 5 
      err = t
    end
end
y = s;
end

% [e1,n1] = myarctan(1/5)
% [e2,n2] = myarctan(1/239)
% mypi = 16*e1-4*e2
% abs(mypi-pi)/pi -> pi cu precizie eps
% (1/5)^11/11 -> zecimale corecte pentru n=9 