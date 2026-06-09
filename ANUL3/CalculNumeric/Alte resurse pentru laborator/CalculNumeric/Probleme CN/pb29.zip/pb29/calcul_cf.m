function calcul_cf()
% calculeaza factorul de frecare cf din ecuatia pentru curgerea turbulenta
% a unui fluid printr-o conducta neteda pentru valorile 10^4, 10^5 si 10^6
% ale numarului lui Reynolds
%
% Apel: calcul_cf

Re=10^4;
display('Pentru Re=10^4 se obtine:');
x=newton(1,eps,100,10^4);
cf=x*x;

Re=10^5;
display('Pentru Re=10^5 se obtine:');
x=newton(1,eps,100,10^5);
cf=x*x

Re=10^6;
display('Pentru Re=10^6 se obtine:');
x=newton(1,eps,100,10^6);
cf=x*x