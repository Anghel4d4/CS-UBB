
%Problema 49.2
% T0=70
% t0>0
% la momentul t0>0 un flux de caldura cu densitatea
% constanta q=300 este mentinut la suprafata x=0

x=0;
q=300;
k=1.0;
alfa = 0.04;
T=100;
T0=70;
Nmax = 1000;
x0=0;

era = (10^-8)/2; %eroare absoluta
err = (10^-6)/2; %eroare relativa 
		  %eroarea absoluta = x-x*
		  %eroarea relativa = eroarea absoluta/x*
          
%t=1;
%se obtine o ecuatie neliniara in t care se paote rezolva cu metoda lui
%Newton
%se calculeaza prima derivata 

 %T = T0 + q/k*(2*sqrt((alfa*t)/pi)*exp((-x*x)/(4*alfa*t))-x*(1-erf(x/(2*sqrt(alfa*t) ) ) ) );
 %f =T0 + q/k*(2*sqrt((alfa*t)/pi)*exp((-x.*x)/(4*alfa*t))-x*(1-erf(x/(2*sqrt(alfa*t) ) ) ) )-T;
 %f =inline('T0 + q/k*(2*sqrt((alfa*t)/pi)*exp((-x.*x)/(4*alfa*t))-x*0.5 )-T');
 %fd=(1/(2*sqrt(t)))*exp((-x.*x)/4*alfa*t)-sqrt(t)*exp((-x.*x)/4*alfa*t)*(1/t^2);


[rezultat,pasi,x]=Newtons(0.1,era,Nmax,'f','fderivat');

 fprintf('t = %10.15f\n',rezultat);
 
 [rezultat,pasi,x]=Newtons(0.2,era,Nmax,'f','fderivat');
 
 fprintf('t = %10.15f\n',rezultat); 
 
 [rezultat,pasi,x]=Newtons(0.3,era,Nmax,'f','fderivat');
 
  fprintf('t = %10.15f\n',rezultat); 
 
 [rezultat,pasi,x]=Newtons(0.4,era,Nmax,'f','fderivat');
 
  fprintf('t = %10.15f\n',rezultat); 
  
   [rezultat,pasi,x]=Newtons(0.5,era,Nmax,'f','fderivat');
 
  fprintf('t = %10.15f\n',rezultat); 
 
 %[rezultat,pasi,x]=Newtons(x0,err,Nmax,'f','fderivat');
   
 %fprintf('t = %10.15f\n',rezultat);
