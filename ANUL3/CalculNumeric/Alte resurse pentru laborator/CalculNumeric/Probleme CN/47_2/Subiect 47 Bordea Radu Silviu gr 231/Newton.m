function [X,S]=Newton(f,J,epsilon,x0,N)
%functie care rezolva sistemul neliniar primeste ca parametri :
%f=functiile sistemului de ecuatii
%J=Jacobianul 
%epsilon=epsilon 
%x0=valoarea de pornire 
%N=numarul maxim de iteratii
%functia intoarce in :
%X solutia sistemului
%S numarul de iteratii 
i=1;
S=0;
X=[];
while (i<=N)
    x1=x0-(inv(feval(J,x0))*feval(f,x0)')';
    if abs(x1-x0)<epsilon
        X=x1;
        S=i;
        return
    end
    i=i+1;
    x0=x1;
end
S=N+1;