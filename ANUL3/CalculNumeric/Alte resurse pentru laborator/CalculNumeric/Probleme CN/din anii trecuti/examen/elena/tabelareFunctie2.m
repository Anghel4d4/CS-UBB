%Enunt: Tabelati functia y(x) = e^(-x)^2*integrala de la 0 la x din e^t^2, pentru x = 0, 0.1, ..., 0.5.

y=inline('exp(x.^2)');
T0 =0;
T1 = romberg5( y,0,0.1,0,0);
T2 = romberg5( y,0.1,0.2,0,0);
T3 = romberg5( y,0.2,0.3,0,0);
T4 = romberg5( y,0.3,0.4,0,0);
T5 = romberg5( y,0.4,0.5,0,0);

t0 = 0;
t1 =  exp(-(0.1^2))*T1;
t2 =  exp(-(0.2^2))*(T1+T2);
t3 =  exp(-(0.3^2))*(T1+T2+T3);%Descompun integrala ca suma de integrale pe subintervale. 
t4 =  exp(-(0.4^2))*(T1+T2+T3+T4);
t5 =  exp(-(0.5^2))*(T1+T2+T3+T4+T5);

disp('Valoarea functiei pentru x=0 este :');disp(t0);
disp('Valoarea functiei pentru x=0.1 este :');disp(t1);
disp('Valoarea functiei pentru x=0.2 este :');disp(t2);
disp('Valoarea functiei pentru x=0.3 este :');disp(t3);
disp('Valoarea functiei pentru x=0.4 este :');disp(t4);
disp('Valoarea functiei pentru x=0.5 este :');disp(t5);

% Test:  tabelareFunctie.m
% Rezultate: 
%Valoarea functiei pentru x=0 este :
%     0
%Valoarea functiei pentru x=0.1 este :
%    0.0993
%Valoarea functiei pentru x=0.2 este :
%   0.1948
%Valoarea functiei pentru x=0.3 este :
%    0.2826
%Valoarea functiei pentru x=0.4 este :
%    0.3599
%Valoarea functiei pentru x=0.5 este :
%   0.4244