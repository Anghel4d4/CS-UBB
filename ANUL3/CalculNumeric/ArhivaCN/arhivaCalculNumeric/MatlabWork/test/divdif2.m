function Q = divdif2(x,f,df)

    z = repelem(x,2);
    n = length(z);
    Q = NaN*ones(n);
    Q(:,1) = repelem(f, 2);
    Q(1:2:end,2) = df;
    Q(2:2:end-2,2) = diff(f)./diff(x);
    
    for j=3:n
        Q(1:n-j+1,j) = diff(Q(1:n-j+2,j-1))./(z(j:n) - z(1:n-j+1))';
    end