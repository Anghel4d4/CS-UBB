% rezolvarea sistemului de ecuatii folosind metoda 
% aproximatiilor succesive:
% folosesc ca valori bune de pornire -1 -1 0 sau 1 -1 0 sau 1 1 0
% N este numarul maxim de iteratii

x0=[1 1 0]; % valorile bune de pornire
N=150;      % numarul maxim de iteratii
epsilon=10^-7; 5epsilon
[X,S]=Metoda_aproximatiilor_succesive('f2','J2',epsilon,x0,N);
if S==N+1
     fprintf('Eroare!A fost atins numarul maxim de iteratii\n');
else
     fprintf('A fost nevoie de %d iteratii\n',S);
     fprintf('Solutia sistemului este:\n');
     fprintf('%5.15f\n',X);
end
clear