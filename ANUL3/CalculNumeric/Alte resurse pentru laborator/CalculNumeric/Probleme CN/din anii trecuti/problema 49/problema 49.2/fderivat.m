function [v]=fderivat(x)
x=0.1;0.2;0.3;0.4;0.5;
q=300;
k=1.0;
alfa = 0.04;
T=100;
T0=70;
Nmax = 1000;
x0=0;

era = (10.^-8)/2; %eroare absoluta
err = (10.^-6)/2; %eroare relativa 
		  %eroarea absoluta = x-x*
		  %eroarea relativa = eroarea absoluta/x*
          
t=10;
v=(q/k)*(((1/(2*sqrt(t)))*exp((-x.*x)/4*alfa*t)-sqrt(t)*exp((-x.*x)/4*alfa*t)*(1/t^2))+x*(2*exp((-x.*x)/(4*alfa*t))/sqrt(pi)));