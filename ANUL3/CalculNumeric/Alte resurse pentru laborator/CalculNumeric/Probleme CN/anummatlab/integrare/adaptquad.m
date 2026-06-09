function I=adaptquad(f,a,b,eps,g)
%ADAPTQUAD cuadratura adaptiva
%apel I=adaptquad(f,a,b,eps,g)
%f - functia
%a,b - limitele
%eps -eroarea
%g - cuadratura repetata utilizata

m=4;
I1=g(f,a,b,m);
I2=g(f,a,b,2*m);
if abs(I1-I2) < eps %succes
   I=I2;
   return
else  %sudivizare recursiva
   I=adaptquad(f,a,(a+b)/2,eps,g)+adaptquad(f,(a+b)/2,b,eps,g);
end
