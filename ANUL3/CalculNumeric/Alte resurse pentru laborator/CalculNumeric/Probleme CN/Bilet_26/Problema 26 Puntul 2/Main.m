%S-a realizat tabelarea functiei f(x) = exp(-x^2)* integrala de la 0 la x
%din exp(x^2), pentru x=0,0.1,0.2...0.5.
f=inline('exp(x.^2)');
I0 =0;
I1 = trapeze( f,0,0.1,0);
I2 = trapeze( f,0.1,0.2,0);
I3 = trapeze( f,0.2,0.3,0);
I4 = trapeze( f,0.3,0.4,0);
I5 = trapeze( f,0.4,0.5,0);

y0 = 0;
y1 =  exp(-(0.1^2))*I1;
y2 =  exp(-(0.2^2))*(I1 +I2);
y3 =  exp(-(0.3^2))*(I1 +I2+I3);%Calcularea se face prin  descompuerea integralei ca suma de integrale pe subintervale. 
y4 =  exp(-(0.4^2))*(I1 +I2+I3+I4);
y5 =  exp(-(0.5^2))*(I1 +I2+I3+I4+I5);

disp('valoarea functiei in 0 este :');disp(y0);
disp('valoarea functiei in 0.1 este :');disp(y1);
disp('valoarea functiei in 0.2 este :');disp(y2);
disp('valoarea functiei in 0.3 este :');disp(y3);
disp('valoarea functiei in 0.4 este :');disp(y4);
disp('valoarea functiei in 0.5 este :');disp(y5);
