function testEcuatiiNeliniare()
  % ecuatii neliniare
  % a) metoda secantei (|R)
  % b) metoda lui Newtow (|R si |R^n)
  
  
% a) metoda secantei
f = @(x) x^3-x-1;
fd = @(x) 3*x^2-1;
x0 = 2;
x1 = x0 -(fd(x0)^(-1))*f(x0);
[zSecanta,ni] = secant(f,x0,x1,1e-8,0,50)
f(zSecanta)

% b1) metoda lui Newton pe R
x0 = 2;
%[zNewtonEcuatie,ni] = Newton(f,fd,x0,1e-8,0,50)
%f(zNewtonEcuatie)

% b2) metoda lui Newton pe R^n
f = @(x) [x(1)^2 + x(2)^2 - 1; x(1)^3 - x(2)];
fd = @(x) [2*x(1), 2*x(2); 3*x(1)^2, -1];
x0 = [1;1];
%[zNewtonSistem,ni] = Newton(f,fd,x0,1e-8,0,50)
%f(zNewtonSistem)
end