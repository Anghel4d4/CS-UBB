%1,23e+016 -> 1.23*10^16
%-5.14E-3 -> -5.14*10^(-3)
%eps in cmd -> 2.2204e-016
function eps2=epsM
eps2=1.0;
while 1~=1+eps2
    eps2=eps2/2;
end
eps2=eps2*2;
end
    