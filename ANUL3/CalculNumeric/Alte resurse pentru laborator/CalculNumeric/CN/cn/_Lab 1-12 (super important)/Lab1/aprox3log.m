function t=aprox3log(x,eroare)
%calculeaza dezv Taylor pentru log((x+1)/(x-1)) cu eroarea < eroare
tcurent=2*x; 
turmator=2*x+2*x.^3/3;
k=5;
while abs(turmator-tcurent)>eroare
    tcurent=turmator;
    turmator=tcurent+2*x.^k/k;
    k=k+2;
end
t=turmator;
    