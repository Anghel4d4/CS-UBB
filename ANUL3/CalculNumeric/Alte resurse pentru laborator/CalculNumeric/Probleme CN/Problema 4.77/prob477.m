%(a)
I=int(sym('x*sin(1/x)'),0,1)
%Calculul cu Symbolic toolbox returneaza o valoare care depinde de
%sinint(1)

%(b)
f=@(x)x.*sin(1./x);
I=quad(f,0,1)
%Functia quad ajunge la o aproximare numerica

%I=adaptquad(f,0,1,1e-3,@Simpson)
%cuadratura adaptiva ajunge la 500 de recurente, si se opreste, nu ajungem
%la un rezultat


%(c)
%imoedimentul de la punctul anterior putem sa rezolvam daca evitam
%impartirea la zero
I=adaptquad(@fun,0,1,1e-3,@Simpson)

