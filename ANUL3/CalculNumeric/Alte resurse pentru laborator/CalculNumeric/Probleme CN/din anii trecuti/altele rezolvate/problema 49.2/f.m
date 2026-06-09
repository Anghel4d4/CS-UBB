function [v]=f(x)
x=0.1;0.2;0.3;0.4;0.5;
q=300;
k=1.0;
alfa = 0.04;
T=100;
T0=70;
Nmax = 100;
x0=0;

era = (10.^-8)/2; %eroare absoluta
err = (10.^-6)/2; %eroare relativa 
		  %eroarea absoluta = x-x*
		  %eroarea relativa = eroarea absoluta/x*
          
t=10;
v= T0 + q/k*(2*sqrt((alfa*t)/pi)*exp((-x.*x)/(4*alfa*t))-x*(1-erf(x/(2*sqrt(alfa*t) ) ) ) )-T;