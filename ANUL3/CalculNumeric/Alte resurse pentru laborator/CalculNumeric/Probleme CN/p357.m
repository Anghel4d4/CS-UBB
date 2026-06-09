clc
k = input('numar noduri echidistante: ');
f = @(x) asin(x);
x = linspace(-1/sqrt(2), 1/sqrt(2), k);
grad = 15;
coef = coeffChebyshev(f, grad)
y = f(x);
yc = evalChebyshev(coef, x);

plot(x, y, 'g-', x, yc, 'r:');
legend('arcsin(x)','Cebishev',4);

for i=1:size(x,2)
    disp(sprintf('eroare in nodul %d: %e', i, y(i)-yc(i)))
    disp(sprintf('eroare in nodul %d: %e', i, y(i)-arcsin(x(i), coef)))
end

