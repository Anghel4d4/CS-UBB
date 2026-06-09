function I=adaptquad(f,a,b,e,g)
%ADAPTQUAD cuadratura adaptiva
%f - functia
%a,b - limitele
%e -eroarea
%g - cuadratura repetata utilizata
m=4;
I1=feval(g,f,a,b,m);
I2=feval(g, f,a,b,2*m);
if abs(I1-I2) < e %succes
I=I2;
return
else %sudivizare recursiva
I=adaptquad(f,a,(a+b)/2,e,g)+adaptquad(f,(a+b)/2,b,e,g);
end


