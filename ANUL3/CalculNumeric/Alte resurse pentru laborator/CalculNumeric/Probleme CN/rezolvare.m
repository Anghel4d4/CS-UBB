h = 6.625e-27;
m = 9.109e-28;
V0 = 2.179e-11;
a = 5.292e-9;

%notam E/V0 cu u
sym u; %folosesc symboluri ca sa generez derivata si mai apoi un function_handle al derivatei
fSym = cot(a/h * sqrt(2*m*V0) * sqrt(u)) - sqrt(u/(1-u));
f = matlabFunction(fSym);
fdSym = diff(fSym);
fd = matlabFunction(fdSym);
eroare = 1e-16;
x0 = 1-eroare;
solutie_u = rezolvaNewton(f, fd, x0, eroare)
x=0+eroare:0.0001:1-eroare;
plot(x, f(x), 'r-', solutie, f(solutie),'*b');

% Valoarea lui E care satisface ecuatia este E = V0 * solutie
solutie_E = V0 * solutie