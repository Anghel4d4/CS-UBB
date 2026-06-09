function wilkinson(n)
%perturbatie pentru \_prod_{k=1}^{n}(x-k) normala

p=poly(1:n);                      %Generam coeficientii polinomului obtinuti dupa inmultirea (x-1)(x-2)*...*(x-n)
h=plot([1:n],zeros(1,n),'.');     %facem graficul solutiilor polinomului adica 1,2,..,n
set(h,'Markersize',15);           %setam marimea punctelor la 15 puncte
hold on
for k=1:1000                      %facem experimentul de 1000 de ori       
    r=randn(1,n+1);               %generam n+1 numere normal distribuite	
    pr=p.*(1+1e-5*r);             %inmultim coeficientii polinomului cu aceste numere normal distribuite
    z=roots(pr);                  %rezolvam ecuatia modificata apoi facem graficul solutiilor obtinute  
    h2=plot(z,'k.');
    set(h2,'Markersize',4)
end
axis equal