function der=derivata(f,x)
    d=1.0e-007;
    der=(feval(f,x+d)-feval(f,x))./d;
end