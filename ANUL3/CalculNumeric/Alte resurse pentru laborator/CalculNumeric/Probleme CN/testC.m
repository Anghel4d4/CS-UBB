clearvars
clc

f=@(x) x.*exp(-x.^2);

%genereaza coeficientii A si nodurile x
[A,x] = genereazaCebisev(10);

%aplica cuadratura pentru coeficientii si nodurile obtinute
%pentru functia f data
I = aplCuadratura(A,x,f);
disp(I)

%verificare
integralaVerificare = integral(@(t) t.*exp(-t.^2)./sqrt(1-t.^2),-1,1)