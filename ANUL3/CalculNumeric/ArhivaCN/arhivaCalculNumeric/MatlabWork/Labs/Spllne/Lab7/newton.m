function N=newton(x, f, X)

    Q = divdif(x,f);
    N =  Q(1,:) * cumprod([1 X-x(1:end-1)])';
    

    