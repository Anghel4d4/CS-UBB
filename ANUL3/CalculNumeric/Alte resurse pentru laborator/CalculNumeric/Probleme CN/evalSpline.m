function z = evalSpline(x, a, b, c, d, t)
    % evaluare spline
    % apel z = evalSpline(x, a, b, c, d, t)
    % z - valori
    % x - noduri
    % a, b, c, d - coeficienti
    % t - puncte in care se face evaluarea
    n = length(x);
    x = x(:);
    t = t(:);
    k = ones(size(t));
    for j = 2:n-1
        k(x(j) <= t) = j;
    end
    % evaluare interpolant
    s = t - x(k);
    z = d(k) + s.*(c(k) + s.*(b(k) + s.*a(k)));
end