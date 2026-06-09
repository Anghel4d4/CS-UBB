clc

n=10;

%deoarece nu am gasit in matlab functia ln, am folosit functia log

%pentru prima integrala aproximam sin(x) ~ x
functia= @(x) log(x)/log(exp(1));

functia2 = @(x) log(sin(x))/log(exp(1));

%calculam integrala finala prin insumarea integralelor partiale
integralaFinala = adquad(functia,eps, 0.01 ,1e-6) + cuadraturi_Gauss(0.01,0.2,n,functia2) + cuadraturi_Gauss(0.02,pi/2,n,functia2);


fprintf('Integrala este %g\n',integralaFinala);
