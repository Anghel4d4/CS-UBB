function c=NrcpolProfu(k,n)
    %o varianta mai compacta pt pr 4
    
    a = poly(1:n);
    %ultimul coef nu ne intereseaza, adica x^n
    %vectorii incep de la indexul 1, nu de la 0
    a = a(2:end);
    %inmulteste cumva liniile cu coloanele
    S = abs(a) * ( k.^[0:n-1])';
    r = [1:k-1,k+1:n];
    c = S/ (k*abs(prod(k-r)))
end