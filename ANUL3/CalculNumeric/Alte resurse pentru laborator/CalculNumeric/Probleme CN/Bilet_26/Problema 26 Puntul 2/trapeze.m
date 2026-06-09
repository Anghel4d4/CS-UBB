function result=trapeze(f,a,b,n)
%Aceasta functie calculeaza integrala de la a la b dinf f(x)
%Am implementat si aplicat metoda trapezelor.
if (n==0)
    n=50; %daca n= 0, implicit numarul de iteratii este 50 
end
h=(b-a)/(n-1);
expr=0;
for k=1:n-1
    expr=expr+(h/2*f(a+h*(k-1))+h/2*f(a+h*(k)));
end
result = expr;