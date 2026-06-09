clc
f = @(x)sin(x); % functie anonima
I1 = intTrapeze(f, 0, pi, 1e5);
I2 = intSimpson(f, 0, pi, 1e5);
fprintf('I1 = %g\nI2 = %g\n', I1, I2)
IR = intRomberg(f, 0, pi/2, 1e-5);
fprintf('IR=%g\n', IR);