function x = rezolvaQR(A, b)
    [Q, R] = factQR(A);
    y1 = Q' * b;
    [m n] = size(Q);
    x = zeros(n, 1);
    x(n) = y1(n)/R(n,n);
    for i = n-1:-1:1
        x(i) = (y1(i) - R(i, i+1:n) * x(i+1:n))/R(i,i);
    end