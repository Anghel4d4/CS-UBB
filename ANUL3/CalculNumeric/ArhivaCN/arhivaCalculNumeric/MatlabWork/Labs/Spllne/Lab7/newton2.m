function N=hermit(x, f, df, X)

    x = repelem(x,2);
    Q = divdif2(x,f,df);
    N =  Q(1,:) * cumprod([1 X-x(1:end-1)])';
    

    