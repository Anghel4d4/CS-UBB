clc
clf
clearvars
format short

% general init
domeniu_start = -2;
domeniu_end = 2;
m = 20;
x = linspace(domeniu_start, domeniu_end, m);
xx = domeniu_start:0.01:domeniu_end;
func = @(x) (1 ./ (x + (1 - x).^2));
y = func(x);
yf = func(xx);

% MCMMP - Metoda Celor Mai Mici Patrate
p = polyfit(x, y, 3);
yy = polyval(p, xx);

% pentru MCMMP se poate folosi in loc de polyfit-ul din Matlab functia
% getMetodaCelorMaiMiciPatrate implementata de la 0. returneaza aceleasi
% rezultate ca si polyfit
% se apeleaza in felul urmator:
myFun = util;
M = myFun.getMetodaCelorMaiMiciPatrate(x, y, 4, m);
P = @(x) (M(1) * x^3 + M(2) * x^2 + M(3) * x + M(4));
yP = arrayfun(P, xx);

subplot(1, 2, 1);
plot(xx, yf, 'g-', xx, yy, 'b--', xx, yP, 'r:')
legend('functia', 'aproximarea 1', 'aproximare 2', 4);
title('Aproximarea cu MCMMP')

% spline deBoor
[a, b, c, d] = splineCubic(x, y);
yy = evalSpline(x, a, b, c, d, xx);

subplot(1, 2, 2)
plot(xx, yf, 'g-', xx, yy, 'b--')
legend('functia', 'aproximarea', 4);
title('Aproximarea cu spline deBoor')

% in cazul splinului deBoor functia si splinul se suprapun =>
% => splinul deBoor aproximeaza foarte bine functia data