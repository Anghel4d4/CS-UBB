function formSimpson = formSimpson(f,a,b,N)
x = linspace(a,b,N);
formSimpson = ((b-a)/(3*(N-1)))*(f(a)+f(b)+2*sum(f(x(3:2:(N-2))))+4*sum(f(x(2:2:(N-1)))));