clc

%valoarea lui n nu este obligatorie
n=input('Dati n: ');
a = 0;
b = pi;
eps = 1.e-8;

%cu cuadraturi adaptive
I=adaptquad(@functie_S50, a, b, eps, @trapez);
fprintf('Valoarea obtinuta cu cuadraturi adaptive pe intervalul [0,pi] %0.15g\n',I);
I01=10*adaptquad(@functie_S50, 0, pi/10, eps, @trapez);
fprintf('Valoarea obtinuta cu cuadraturi adaptive pe intervalul [0,pi/10] %0.15g\n',I01);

%cu Romberg
I2= romberg(@functie_S50, a, b, eps);
fprintf('Valoarea obtinuta cu Romberg pe intervalul [0,pi] %0.15g\n',I2);
I21= 10*romberg(@functie_S50, 0, pi/10, eps);
fprintf('Valoarea obtinuta cu Romberg pe intervalul [0,pi/10] %0.15g\n',I21);

%cu cuadraturi gaussiene;
[alpha,bet]=genabGaussJacobi(n,a,b);
[gnodes, gcoeff] = Gaussquad(alpha, bet);
I1=vquad(gnodes, gcoeff, @functie_S50);
fprintf('Valoarea obtinuta cu cuadraturi gaussiene pe intervalul [0,pi] %0.15g\n',I1);

[alpha1,bet1]=genabGaussJacobi(n,0,pi/10);
[gnodes, gcoeff] = Gaussquad(alpha1, bet1);
I11=10*vquad(gnodes, gcoeff, @functie_S50);
fprintf('Valoarea obtinuta cu cuadraturi gaussiene pe intervalul [0,pi/10] %0.15g\n',I11);