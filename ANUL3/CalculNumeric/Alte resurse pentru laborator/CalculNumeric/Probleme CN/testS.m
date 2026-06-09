clc
% sistem de 3 ecuatii cu 3 necunoscute, vector coloana
f=@(v)[9*v(1)^2+36*v(2)^2+4*v(3)^2-36
v(1)^2-2*v(2)^2-20*v(3)
v(1)^2-v(2)^2+v(3)^2];

% derivatele fiecarei functii in raport cu fiecare variabila, matrice 3X3
J=@(v)[18*v(1), 72*v(2), 8*v(3)
2*v(1), -4*v(2), -20
2*v(1), - 2*v(2), 2*v(3)];

solutie = rezolvaNewtonSistem( f, J, [1;1;0], 1E-6); % aproximatia initiala [1; 1; 0]
fprintf('\nSolutie = [%g %g %g] eroare = %g\n', solutie(1), solutie(2), solutie(3), norm(f(solutie)));
solutie = rezolvaNewtonSistem( f, J, [1;-1;0], 1E-6); % aproximatia initiala [1; -1; 0]
fprintf('Solutie = [%g %g %g] eroare = %g\n', solutie(1), solutie(2), solutie(3), norm(f(solutie)));
solutie = rezolvaNewtonSistem( f, J, [-1;1;0], 1E-6); % aproximatia initiala [-1; 1; 0]
fprintf('Solutie = [%g %g %g] eroare = %g\n', solutie(1), solutie(2), solutie(3), norm(f(solutie)));
solutie = rezolvaNewtonSistem( f, J, [-1;-1;0], 1E-6); % aproximatia initiala [-1; -1; 0]
fprintf('Solutie = [%g %g %g] eroare = %g\n', solutie(1), solutie(2), solutie(3), norm(f(solutie)));