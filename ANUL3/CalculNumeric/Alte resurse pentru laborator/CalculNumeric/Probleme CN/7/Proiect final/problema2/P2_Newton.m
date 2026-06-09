
x0=[-1 -1 0];
N=350;
epsilon=10^-9;
[X,S]=Newton('f2','J2',epsilon,x0,N);
if S==N+1
     fprintf('Eroare!A fost atins numarul maxim de iteratii\n');
else
     fprintf('A fost nevoie de %d iteratii\n',S);
     fprintf('Solutia sistemului este:\n');
     fprintf('%5.15f\n',X);
end
clear