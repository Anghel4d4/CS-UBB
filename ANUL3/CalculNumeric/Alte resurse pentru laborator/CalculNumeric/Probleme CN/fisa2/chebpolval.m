function u = chebpolval(c, x, a, b)

    n = length(c);
    m = length(x);
    x = x(:);

    dip1 = zeros ( m, 1 );
    di = zeros ( m, 1 );
    y = ( 2.0 * x - a - b ) / ( b - a );

    for i = n : -1 : 2
        dip2 = dip1;
        dip1 = di;
        di = 2.0 * y .* dip1 - dip2 + c(i);
    end

    u = y .* di - dip1 + 0.5 * c(1);

    return
end