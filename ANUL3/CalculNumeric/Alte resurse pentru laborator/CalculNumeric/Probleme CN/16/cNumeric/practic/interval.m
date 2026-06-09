function rez=interval(x,a,b)
    i=1;j=1;    
    n=length(x);
    while x(i)<a
        i=i+1;
    end
    while x(i)<=b & i<n
        rez(j)=x(i);
        i=i+1;j=j+1;
    end
end