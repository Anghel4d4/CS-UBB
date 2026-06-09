function y=myln(n,x)
    y=0;
    for i=1:n
        y=y+ (-1)^(n+1)*x^i/i;
    end