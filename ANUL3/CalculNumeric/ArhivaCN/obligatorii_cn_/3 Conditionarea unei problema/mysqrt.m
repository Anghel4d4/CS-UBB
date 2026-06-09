function y=mysqrt(a)
    x0=(a+1)/2;
    xn = (x0+a/x0)/2;
    while xn < x0
        x0 = xn;
        xn = (x0+a/x0)/2;
    end
    y=(xn+x0)/2;
end