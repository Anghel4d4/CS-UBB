function V = aplicaRN(f,J,ps,pf,eps)
k = 0;
vect=[]; % vector de solutii
for t=ps:pf %luam 400 se valori
    i = 1;
    p0  = t; %si aplicam metoda Newton-Raphson
    p=NewtonRaphson(f,J,p0,eps);
    if not( any( abs(vect-0.001)<=p)) %daca in vector nu avem
        k=k+1;			% valori mai mici ca p, il adaugam pe p
        vect(k) = p;
    end;	
end;
V=vect;