function [ C, X, Y ] = cheby( f, n, a, b )
    d = pi / (2 * n + 2);
    C = zeros(1, n + 1);
    X = cos((2 * (1 : n + 1)' - 1) * pi / 2 / (n + 1));
    X = (b - a) * X / 2 + (a + b) / 2;
    x = X;
    Y = feval(f, x);
    for k=1:n+1
        z = (2 * k - 1) * d;
        for j=1:n+1
            C(j) = C(j) + Y(k) * cos((j - 1) * z);
        end
    end
    C = 2 * C / (n + 1);
    C(1) = C(1) / 2;

