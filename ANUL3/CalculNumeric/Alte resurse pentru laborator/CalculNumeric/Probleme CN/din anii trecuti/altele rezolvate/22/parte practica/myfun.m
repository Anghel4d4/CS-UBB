function F = myfun(x)
F = 2.*x.*besselj(1,x)-besselj(0,x);