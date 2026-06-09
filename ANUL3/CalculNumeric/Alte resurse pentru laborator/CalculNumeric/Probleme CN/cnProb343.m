C0 = [5.0, 7.5, 9.9, 12.9, 13.2, 15.1, 16.3, 16.8];
DC0 = [0.0240, 0.0437, 0.0797, 0.1710, 0.1990, 0.3260, 0.8460, 0.9720];

[a, b, c, d] = splineCubic(C0, DC0, 2);
t = 5:0.01:16.8; % pas = 0.01
z = evalSpline(C0, a, b, c, d, t);

subplot(2, 1, 1)
plot(t, z, C0, DC0, 'om')
title('Aproximare D cu spline cubic')

derivata = evalSpline(C0, zeros(size(a)), 3 * a, 2 * b, c, C0)';
D = DC0 + C0 .* derivata;

subplot(2, 1, 2)
plot(C0, D, '*b')
title('Valoare D in punctele C0')