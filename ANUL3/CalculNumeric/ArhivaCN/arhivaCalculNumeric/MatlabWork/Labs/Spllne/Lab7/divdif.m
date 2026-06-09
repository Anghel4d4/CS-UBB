function Q = divdif(x,f)

    n = length(x);
    Q = NaN*ones(n);
    Q(:,1) = f;
    
    for j=2:n
        Q(1:n-j+1,j) = diff(Q(1:n-j+2,j-1))./(x(j:n) - x(1:n-j+1))';
    end