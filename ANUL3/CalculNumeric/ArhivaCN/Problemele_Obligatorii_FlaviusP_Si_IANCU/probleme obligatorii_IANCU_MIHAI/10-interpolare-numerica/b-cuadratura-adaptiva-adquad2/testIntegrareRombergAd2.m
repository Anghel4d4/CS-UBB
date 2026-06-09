clc;
f = @(x)sin(x).^2;
format long;

% vreau sa calculez integrala din sin(x)^2 de la -pi la pi/6
% folosim fctia matlab quad
fprintf('Metoda quad (din matlab)');
quad(f, -pi, pi/6)

% acum metodele noastre:
fprintf('Integrare Adaptiva Simpson')
integrareAdaptivaSimpson(f, -pi, pi/6, 10, 1)

fprintf('Integrare Romberg:');
integrareRomberg(f, -pi, pi/6, 1e-8)

fprintf('Integrare Adaptiva 2');
integrareAdaptiva2(f, -pi, pi/6, 1e-8)