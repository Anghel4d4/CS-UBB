function c=Nrcpol(k,n)
    % pr 4
    %nr de conditionare pt polinom
    %asta ne da coeficientii; in a voi avea coeficientii
    a = poly(1:n);
    %ultimul coef nu ne intereseaza x^n
    %vectorii incep de la 1, nu de la indexul 0
    a = a(2:end);
    sum = 0;
    for i=0:n-1
        sum = sum + abs(a(i+1)) * abs(k)^i;
    end 
    p = 1;
    for i=0:n-1
        % ~=  -> diferit
        if i ~= k
            p = p * (k-i);
        end
    end
    c = (1/(k*p))*sum;
end