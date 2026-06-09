function L=lagrbar(x,f,X)
   
    m=length(x);
    w=zeros(1,m);
    n=length(X);
    for k=1:n
        for j=1:m
            w(j)=1/prod(x(j)-x([1:j-1,j+1:m]));
        end
        sus=sum((f.*w)./(X(k)-x+0.00000000000000001));
        jos=sum(w./(X(k)-x+0.00000000000000001));
        L(k)=sus/jos;
    end
end