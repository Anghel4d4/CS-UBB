function t=aprox2log(x,eroare)
%calculeaza dezv Taylor pentru log(x+1) cu eroarea < eroare
tcurent=x; turmator=x-x.^2/2;k=3;
while abs(turmator-tcurent)>eroare
    tcurent=turmator;
    turmator=tcurent+(-1)^(k+1)*x^k/k;
    k=k+1;
end
t=turmator;
    