
x0=[0.5 1 0];
N=130;
epsilon=10^-4;
[X,S]=Newton('sistem','jacobian',epsilon,x0,N);
if S==N+1
     fprintf('Eroare! A fost atins numarul maxim de iteratii\n');
else
     fprintf('S-a efectuat %d iteratii\n',S);
     fprintf('Solutia sistemului este:\n');
     fprintf('%5.28f\n',X);
end
clear