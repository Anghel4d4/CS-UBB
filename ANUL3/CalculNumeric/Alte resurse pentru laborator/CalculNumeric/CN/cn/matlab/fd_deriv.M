function y = fd_deriv(f,x,h)
%FD_DERIV   Aproximarea derivatei cu diferenta divizata.
%           FD_DERIV(F,X,H) este diferenta divizata a lui F cu nodurile X si
%           X+ H.  H implicit:  SQRT(EPS).

if nargin < 3, h = sqrt(eps); end
f=fcnchk(f);
y = (f(x+h) - f(x))/h;
