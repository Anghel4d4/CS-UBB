function i1 = intTrapeze(f,a,b,N)
x = linspace(a,b,N);
i1 = ((b-a)/(2*(N-1)))*(f(a)+f(b)+2*sum(f(x(2:N-1))));

