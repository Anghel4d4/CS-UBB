x = [ 0, pi/6, pi/4, pi/3, pi/2, 3*pi/4, pi];
y = [ 0, 1/2, sqrt(2)/2, sqrt(3)/2, 1, sqrt(2)/2, 0];
t = linspace(0, pi, 250);
[a1, b1, c1, d1] = Splinecubic(x, y, 0, [1, -1]);   %complet
[a2, b2, c2, d2] = Splinecubic(x, y, 1, [0, 0]);    %cu derivate secunde
[a3, b3, c3, d3] = Splinecubic(x, y, 2);            %natural
[a4, b4, c4, d4] = Splinecubic(x, y, 3);            %not a knot (deBoor)
vs1 = valspline(x, a1, b1, c1, d1, t);
vs2 = valspline(x, a2, b2, c2, d2, t);
vs3 = valspline(x, a3, b3, c3, d3, t);
vs4 = valspline(x, a4, b4, c4, d4, t);
plot(x, y, 'o', t,[sin(t'), vs1, vs2, vs3, vs4]);
legend('noduri', 'f', 'complet', 'D2', 'natural', 'deBoor', 'location', 'best');