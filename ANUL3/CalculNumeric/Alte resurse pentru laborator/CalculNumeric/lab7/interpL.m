function val = interpL(X,Y,x)

v=0;
m=length(X);

for k= 1:m
    s=1;
    s1=1;
    for j = 1:m
        if(j ~= k)
            s= s*(x-X(j));
            s1 = s1* ( X(k)-X(j)) ;
        end
    end
    
    v = v + s/s1 * Y(k);
end
val = v;
end
