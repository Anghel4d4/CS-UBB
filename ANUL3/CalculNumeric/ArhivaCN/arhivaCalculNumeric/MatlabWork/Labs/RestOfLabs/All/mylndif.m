function y=mylndif(n,x)
    y=0;
    for i=1:2:2*n+1
        y=y+ 2*x^i/i;
    end