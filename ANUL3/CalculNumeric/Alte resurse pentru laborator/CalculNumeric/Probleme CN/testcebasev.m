%{
Problema 3.70. Sa se scrie o functie MATLAB care calculeaza polinomul de interpolare
Lagrange al unei functii f ?n cazul cand nodurile sunt radacinile polinoamelor ortogonale 
Jacobi. Comparati experimental cu cazul cand nodurile sunt puncte Ceb?sev de speta a doua.
Folositi metoda baricentrica. Testati pentru o functie puternic oscilanta si un numar mare de
noduri.
%}

%test lagrange cu noduri cebisev
f = @(x)sin(60*x.^2); %functie puternic oscilanta
nNoduri = 70;
[yi, xi, noduriCebasev2] = interpLagrangeNoduriCebasev2(nNoduri, f, 500);

plot(xi, f(xi), '-', xi, yi, noduriCebasev2, f(noduriCebasev2), '*r');
legend('f(x)', 'interp', 'noduri');