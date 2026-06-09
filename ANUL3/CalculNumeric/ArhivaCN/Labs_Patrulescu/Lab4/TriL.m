function x=TriL(L,b)
    n=length(b);
    x=zeros(1,n);
    x(1)=b(1)/L(1,1);
    for i=2:n
        x(i)=(b(i)-sum(L(i,1:i-1).*x(1:i-1)))/L(i,i);
    end