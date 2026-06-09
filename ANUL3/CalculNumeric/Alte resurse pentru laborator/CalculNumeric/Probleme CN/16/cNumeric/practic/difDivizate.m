function dDiv=difDivizate(x,y,d)
    c=1;
    n=length(x);
    dDiv=zeros(n);
    %dDiv(1:end,1)=y;
    for i=1:length(y)
        dDiv(i,1)=y(i);
    end
    for i=2:n    
        for j=1:n-i+1
            if x(j)-x(j+i-1) == 0 & nargin == 3
                dDiv(j,i)=d(c);
                c=c+1;
            else
                dDiv(j,i)=(dDiv(j,i-1)-dDiv(j+1,i-1))/(x(j)-x(j+i-1));
            end
        end
    end
end