% Se consideră funcția: f(x) = (e^x-1-x)/x^2
% 1. Să se reprezinte grafic pentru x € [-10^(-11),10^(-11)] 
% 2. Explicați ce se întâmplă
% 3. Calculați f(x) pentru |x|<1 la precizia eps și reprezentați grafic
% 4. Stabiliți valoarea de adevăr a propoziției: x<y => f(x)<f(y)
%                                                x,y nr. în virgulă flotantă

f=@(x) (exp(x)-1-x)./x.^2;

x1=-10^(-11);
x2=+10^(-11);

x=linspace(x1,x2,300);
plot(x,f(x));
ylim([-1e7,1e7]);
