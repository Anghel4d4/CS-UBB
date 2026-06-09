function [X,S]=Metoda_aproximatiilor_succesive(f,J,epsilon,x0,N)
%functie care rezolva sistemul neliniar dat de functia f (prin metoda
%aproximatiilor succesive)avand Jacobianul J,cu precizia epsilon ,valoarea de pornire x0
%si numarul maxim de iteratii N
%functia intoarce in ->X solutia sistemului
%                    ->S numarul de iteratii

i=1;
S=0;
X=[];
lambda=-inv(feval(J,x0));
while (i<=N)
    x1=x0+(lambda*feval(f,x0)')';
    if abs(x1-x0)<epsilon
        X=x1;
        S=i;
        return
    end
    i=i+1;
    x0=x1;
end
S=N+1;