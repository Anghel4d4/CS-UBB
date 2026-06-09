function wilkinson(n,p)
%perturbatie  normala

h=plot([1:n],zeros(1,n),'.');
set(h,'Markersize',15);
hold on
for k=1:1000
    r=randn(1,2*n+1);		%r - un numar aleator din intervalul [1,2*n+1]
    pr=p.*(1+1e-5*r);		%pr - polinom
    z=roots(pr);			%z - vector coloana cu radacinile polinomului pr
    h2=plot(z,'k.');
    set(h2,'Markersize',4)
end
axis equal