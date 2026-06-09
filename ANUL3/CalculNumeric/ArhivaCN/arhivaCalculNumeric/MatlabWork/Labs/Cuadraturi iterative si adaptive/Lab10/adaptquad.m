function int = adaptquad(a,b,f,m,tol)

    if abs(sumrectangles(a,b,f,m) - sumrectangles(a,b,f,2*m)) < tol
        int = sumrectangles(a,b,f,2*m);
    else
        int = adaptquad(a,(a+b)/2,f,m,tol) + adaptquad((a+b)/2,b,f,m,tol);
    end