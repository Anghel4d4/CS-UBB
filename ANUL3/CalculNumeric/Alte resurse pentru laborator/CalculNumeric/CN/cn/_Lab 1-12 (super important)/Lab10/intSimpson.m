function I=intSimpson(f, a, b, N)
   x=linspace(a, b, N+1);
   I= (b-a)/(3*N)*(f(a)+f(b)+2*sum(f(x(3:2:N)))+4*sum(f(x(2:2:N))));