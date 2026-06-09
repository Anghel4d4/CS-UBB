function rez = Lagrange_Newton(x,y)
    n = length(x);
    A = zeros(n,n);
    A(:,1) = y;
    j=2;
    k=0;
    while j<=n
        i = 1;
       while i <= n-j+1
           A(i,j) = (A(i+1,j-1) - A(i,j-1))/(x(i+k+1) - x(i));
           i = i + 1;
       end
       k = k + 1;
       j = j + 1;
    end
    
    rez = A;
       