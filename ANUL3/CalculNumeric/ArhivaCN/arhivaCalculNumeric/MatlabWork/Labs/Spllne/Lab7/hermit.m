function [N,dN]=hermit(x, f, df, X)

    Q = divdif2(x,f,df);
    n = length(x);
    x = repelem(x,2);
    N =  Q(1,:) * cumprod([1 X-x(1:end-1)])';
   
    dN = 0;
    for i=1:2*n-1
        dN = dN + Q(1,i+1)* polyval(polyder(poly(x(1:i))), X);
    end
    

    