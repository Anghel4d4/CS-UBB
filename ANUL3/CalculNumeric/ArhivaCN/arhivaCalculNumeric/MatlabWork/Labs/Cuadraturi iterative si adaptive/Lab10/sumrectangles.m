function int = sumrectangles(a,b,f,n)

    x = linspace(a+(b-a)/(2*n), b-(b-a)/(2*n), n);
    int = (b-a)/n * sum(f(x));