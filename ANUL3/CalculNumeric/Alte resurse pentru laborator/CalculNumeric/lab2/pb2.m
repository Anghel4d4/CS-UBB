function pb2
x=pi/6+10*pi;
[sinx,cosx]=sincos(x);
display(sinx);
display(cosx);

%la valori mari ale lui x termenii din suma Taylor oscileaza foarte puternic
%solutie: reducerea la intervalul [0, 2pi]

x2=x-(2*pi)*floor(x/(2*pi));
[s,c]=sincos(x2);
display(s);
display(c);

end
function [s,c]=sincos(x)
    n=10;
    sinx=0;
    cosx=0;
    for k=0:n
        sinx=sinx + ((-1)^k)*x^(2*k+1)/factorial(2*k+1);
        cosx=cosx + ((-1)^k)*x^(2*k)/factorial(2*k);
    end
    s=sinx;
    c=cosx;
end
