function x = rezolvaCholesky(A, b)

    b1 = A' * b;
    R = factCholesky(A' * A);
    [m n] = size(R);
    y = zeros(n, 1);
    for i=1:n
        y(i) = (b1(i)-R(1:i-1, i)' * y(1:i-1))/R(i,i);
    end
    x = zeros(n, 1);
    x(n) = y(n)/R(n,n);
    for i = n-1:-1:1
        x(i) = (y(i) - R(i, i+1:n) * x(i+1:n))/R(i,i);
    end