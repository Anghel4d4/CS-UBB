function t=aprox1log(x, nTermeni)
%calculeaza dezv Taylor pt log(x+1) cu n termeni
t=0;
for k=1:nTermeni
    t=t+(-1)^(k+1)*x^k/k;
end