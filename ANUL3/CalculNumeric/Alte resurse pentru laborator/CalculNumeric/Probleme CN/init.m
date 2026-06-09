function F = init
    F.trapeze = @getTrapeze;
    F.simpson = @getSimpson;
end

function T = getTrapeze(f, a, b, N)
    x = linspace(a, b, N);
    T = (b - a) / (2 * (N - 1)) * (f(a) + f(b) + 2 * sum(arrayfun(f, x(2: N -1))));
end

function S = getSimpson(f, a, b, N)
    x = linspace(a, b, N);
    S = (b-a)/(3*(N - 1)) * (f(a)+f(b)+2*sum(arrayfun(f, x(3:2:N - 2)))+4*sum(arrayfun(f, x(2:2:N - 1))));
end