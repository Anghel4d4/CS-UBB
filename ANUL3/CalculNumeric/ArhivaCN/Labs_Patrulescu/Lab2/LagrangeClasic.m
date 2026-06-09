function [L]=LagrangeClasic(z,x)
    n=length(x);
    L=zeros(n,length(z));
    for k=1:length(z)
        for i=1:n
            P(i)=1;N(i)=1;
            for j=1:n
                if i~=j
                    P(i)=P(i).*(x(i)-x(j));
                    N(i)=N(i).*(z(k)-x(j));
                end
            end
            L(i,k)=N(i)/P(i);
        end
    end
    
    