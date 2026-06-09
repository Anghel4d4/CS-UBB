% f(x)=(e^(x)-1-x)/x^2
% 1. reprezentare grafica pt x apartine [-10^(-11),10^(-11)]
% 2. explicati ce se intampla
% 3. functie mathlab care calc f(x) |x|<1 la precizia eps
% 4. stab valoarea de adevar a prop :
%    x<y => f(x)<f(y) unde x,y nr in virgula flotanta


f = @(x) (exp(x)-1-x)./x.^2;
x=linspace(-1e-11,1e-11,300);
plot(x,f(x));
ylim([-1e7,1e7])

t = abs(x)<1e-3
y(t)=f(x(t))