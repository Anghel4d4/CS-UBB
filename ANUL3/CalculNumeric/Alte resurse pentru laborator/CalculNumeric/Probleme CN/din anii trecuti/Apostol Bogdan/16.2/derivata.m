function der=derivata(f,x)
%derivata functiei f in punctul x
    d=1.0e-007;
    der=(feval(f,x+d)-feval(f,x))./d;
end