function s=evalspline(x,a,b,c,d,X)

    s=zeros(1,length(X));
    n=length(x)-1;
   
    for w=1:length(X)
        j=1;
        for i=1:n
            if x(i)<=X(w) && X(w)<=x(i+1)
                j=i;
                break;
            end
        end
        s(w)=a(j)*(X(w)+x(j))^3+b(j)*(X(w)+x(j))^2+c(j)*(X(w)+x(j))+d(j);
    end
end
