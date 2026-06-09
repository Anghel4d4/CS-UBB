function rez=polHermite(x,y,d,pct)
    m=length(x);
    for i=1:2*m
        xx(i)=x(ceil(i/2));
        yy(i)=y(ceil(i/2));
    end
    dDiv=difDivizate(xx,yy,d);
    m=length(xx);
    rez=zeros(size(pct));
    for i=2:m
       z=ones(size(pct));
       for j=1:i-1
           z=z.*(pct-xx(j));
       end
       rez=rez+dDiv(1,i)*z;
    end
    rez=rez+dDiv(1,1);
end
