function [X,S]=Newton(f,J,epsilon,x0,N)
%functie care rezolva sistemul neliniar dat de functia f (prin metoda lui
%Newton)avand Jacobianul J,cu precizia epsilon ,valoarea de pornire x0
%si numarul maxim de iteratii N
%functia intoarce in ->X solutia sistemului
%                    ->S numarul de iteratii 
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