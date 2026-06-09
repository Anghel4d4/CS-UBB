function [z,ni]=Newtonreciprocal(a,x0)
%NEWTONRECIPROCALcomputes 1/a for a>0
if nargin<2, x0=3/2; end
if a*x0>=2
    warning('a*x0>=2');
end
for k=1:2000
    %x1=x0*(2-a*x0);
    x1=2*x0-2*a*x0^2;
    if abs(x1-x0)<eps*abs(x1)
        z=x1; ni=k; return;
    end
    x0=x1;
end
error('2000 iterations');