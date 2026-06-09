function I=adaptQuad(f,a,b,eps,met)
%cuadratura adaptiva
%f - functia 
%a,b - limitele intervalului de integrare
%eps -eroarea
%met - cuadratura repetata

m=4;
I1=met(f,a,b,m);
I2=met(f,a,b,2*m);
if abs(I1-I2) < eps %succes
   I=I2;
   return
else  %sudivizare recursiva
   I=adaptQuad(f,a,(a+b)/2,eps,met)+adaptQuad(f,(a+b)/2,b,eps,met);
end