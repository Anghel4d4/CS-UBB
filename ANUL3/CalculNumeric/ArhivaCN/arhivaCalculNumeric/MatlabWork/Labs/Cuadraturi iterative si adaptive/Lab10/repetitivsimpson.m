function int = repetitivsimpson(a,b,f,n)

    m = n/2;
    x = linspace(a, b, n+1);
    int = (b-a)/(6*m) * (f(a) + f(b) + 2* sum(f(x(3:2:(2*m-1)))) + 4 * sum(f(x(2:2:2*m))) );