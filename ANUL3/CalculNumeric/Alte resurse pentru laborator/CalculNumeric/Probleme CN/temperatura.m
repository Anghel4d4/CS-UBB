%Problema 5.34. Ecuat¸ia temperaturii T pentru care otoluidina
%are o presiune de vaporizare de 500 mm Hg este
%21:306 ?(3480:3/T)?5:081*log10(T) = 0:
%Calculati toate radacinile.
T=linspace(-200,200,100);
x1=21.306-3480.3./T;
x2=-5.081*log10(T);
plot(T,x1,'red',T,x2,'green');
%realizand graficul functiei am observat ca graficul corespunzator
%functiei 21.306-(3480.3/t) interesecteaza graficul functiei
%-5.081*log10(t) intr-un singur punct apropiat de valoarea 110
%Singura radacina a  ecuatiei este : 
disp(rezolvaSecanta( @(t) 21.306-3480.3./t-5.081*log10(t), 109,110, 1E-6))
