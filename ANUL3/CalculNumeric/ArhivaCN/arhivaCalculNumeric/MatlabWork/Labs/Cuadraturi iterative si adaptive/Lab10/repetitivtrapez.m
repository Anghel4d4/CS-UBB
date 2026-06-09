function int = repetitivtrapez(a,b,f,n)

    x = linspace(a, b, n+1);
    int = (b-a)/(2*n) * (f(a) + f(b) + 2* sum(f(x(2:n))));