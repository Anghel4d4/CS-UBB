function L = Lagrange(z,x)
    n=length(x);
    m=length(z);
    L=zeros(n,m);
    for k=1:m
        for i=1:n
            N1(i)=1;N2(i)=1;
            for j=1:n
                if i~=j
                    N1(i)=N1(i)*(z(k)-x(j));
                    N2(i)=N2(i)*(x(i)-x(j));
                end
            end
            L(i,k)=N1(i)/N2(i);
        end
    end
    