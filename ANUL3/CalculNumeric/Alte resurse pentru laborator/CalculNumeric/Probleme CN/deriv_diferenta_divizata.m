%Problema 1.20. Calculati derivata dy/dx a functiei exponentiale y = e^x
%at x = 0 cu ajutorul diferentei divizate d(h) = (e^h ? 1)/h pentru h descrescator. Utilizati 
%(a) h = h1 = 2^?i, i = 5 ? 5 ? 50;
%(b) h = h2 = (2.2)^?i, i = 5 ? 5 ? 50.
%A?siati i, h1, h2, d1 = d(h1), d2 = d(h2), ultimele doua cu un descriptor de format cu f, 
%iar celelalte cu e. Explicati ce se observa.
clc;
x=0;
for i=5:5:50
    h1=2^-i;
    h2=(2.2)^-i;
    d1=(exp(h1)-1)/h1;
    d2=(exp(h2)-1)/h2;
    fprintf('i = %6.2e,  h1= %6.2e  h2= %6.2e  Valoarea d(h1)=%6.2f   d(h2)=%6.2f \n',i,h1,h2,d1,d2); 
end
