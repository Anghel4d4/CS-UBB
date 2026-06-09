function [b1,b0,Vmin]=MCMMP_Liniar(x,y)
%functie care determina coeficientii pentru metoda celor mai mici
%patrate-cazul liniar

n=length(x);
Sx=sum(x);
Sx2=sum(x.^2);
Sy=sum(y);
Sxy=sum(x.*y);

Numitor=n*Sx2-Sx^2;
b0=(Sy*Sx2-Sxy*Sx)/Numitor;
b1=(n*Sxy-Sx*Sy)/Numitor;
Vmin=sum((y-(b0+b1*x)).^2);