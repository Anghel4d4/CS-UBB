function p = NewtonRaphson(f,J,p0,eps)
i = 1;
N0 = 10000;
while i < N0
    p = p0 - f(p0)/J(p0); 
    if abs(p0 - p)<eps       
        break;
    end;
    p0 = p;
    i = i + 1;
end;
if (i > N0)
    error('s-a depasit numarul maxim de iteratii');
end