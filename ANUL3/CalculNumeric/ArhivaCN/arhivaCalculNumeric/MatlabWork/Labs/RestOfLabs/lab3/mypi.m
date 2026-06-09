function y=mypi(n,x)
    y=0;
    for i=1:2:2*n+1
        y=y+(-1)^((i-1)/2)/i*x^i;
    end
    y=y*4;