function rez = AproxL(z,x,y)
    L=Lagrange(z,x);
    for k=1:length(z)
        rez(k)=sum(L(:,k).*y');
    end