function N = metNewton(x,val,td)
%polinomul de interpolare LaGrange, in forma Newton
%apel:  N = Newton(x,val,td), unde:
%  x - nodurile de interpolare
%  val - valoarea (sau valorile) in care se calculeaza valoarea polinomului
%  td - tabela de diferente divizate (prima linie) 
%Rezultat:
%  N - rezultatul calculului, adica valoarea (valorile) polinomului de
%  interpolare


lungimeVal = length(val);
for i=1:lungimeVal
    %dif - vectorul de diferente val-x0,val-x1..., pentru fiecare val
    dif = val(i) - x;
    %val pol Newton pentru val(i)
    N(i) = 1 * td(1,1);
    %m - produsul dintre diferente, de tipul val-x0, (val-x0)*(val-x1), ...
    for j =1:length(dif)-1
         m=1;
        for p=1:j
            m = m * dif(p);
        end
        N(i) = N(i) + m * td(1,j+1);
    end
end
