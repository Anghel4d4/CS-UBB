clc
E=1/exp(1); n =2;
Enext=1-n*E;
while abs(Enext-E)>eps
    n=n+1;
    E=Enext;
    Enext=1-n*E;
    if n>1000
        break;
    end
    end
if abs(Enext-E)>eps
    error('Nu converge')
end