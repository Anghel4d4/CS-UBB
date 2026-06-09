% a fost la test
x = linspace(-1,1,20);
t = linspace(-1,1,1000);
f=@(x) 1./(1+25*x.^2);
dfdx = @(x) -50*x./(1+25*x.^2).^2;
d2fdx2 = @(x) 50 * (75 * x.^2-1)./(1+25*x.^2).^3;

y=f(x);

[a1, b1, c1, d1] = Splinecubic(x, y, 0, [1, -1]);
[a2, b2, c2, d2] = Splinecubic(x, y, 1, [0, 0]);
[a3, b3, c3, d3] = Splinecubic(x, y, 2);
[a4, b4, c4, d4] = Splinecubic(x, y, 3);
vs1 = valspline(x, a1, b1, c1, d1, t);
vs2 = valspline(x, a2, b2, c2, d2, t);
vs3 = valspline(x, a3, b3, c3, d3, t);
vs4 = valspline(x, a4, b4, c4, d4, t);
plot(x, y, 'o', t,[f(t'), vs1, vs2, vs3, vs4]);
legend('noduri', 'f', 'complet', 'D2', 'natural', 'deDoor', 'location', 'best');