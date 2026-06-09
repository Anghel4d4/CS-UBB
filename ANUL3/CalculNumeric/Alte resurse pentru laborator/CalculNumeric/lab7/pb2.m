function val = interpL(X,Y,x)

val = 0;
m=size(X);
for k=1:m
    s=0;
    s1=0;
    for j = 1:m
        if(j ~= k)
            s=s+(x-X(j));
            s1 = s1+ X(k)-X(j) ;
        end
    end
    
    a = s/s1 * Y(k);
end

end
