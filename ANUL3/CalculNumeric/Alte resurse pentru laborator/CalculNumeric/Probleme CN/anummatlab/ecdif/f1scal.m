function yder=f1scal(t,y)
%F1SCAL Exemplu de EDO scalara
yder = -y+5*exp(-t).*cos(5*t);