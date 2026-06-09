function I = integrala(t)
fun = @(x) (1-exp(-x))./x;
%t0 = 0; %Nu converge datorita impartirii la 0
t0=eps;  %aproximativ 0
I = 0.5772156649015329 + log(t) + intRomberg(fun,t0,t,1e-6);
end