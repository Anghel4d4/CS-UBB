function I=intTrapeze(f, a, b, N)
%restul il neglijam
    x=linspace(a, b, N+1);
    I=(b-a)/(2*N)*(f(a)+f(b)+2*sum(f(x(2:N))));
    
    