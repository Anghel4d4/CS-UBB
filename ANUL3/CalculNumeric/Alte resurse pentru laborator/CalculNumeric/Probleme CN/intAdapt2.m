function ret=intAdapt2(f,a,b,tol)
    ret = pasCuadratura(f, a, b, tol, f(a), f((a+b)/2), f(b));
end