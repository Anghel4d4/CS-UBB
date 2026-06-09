function z=valspline(x,a,b,c,d,t)
%evaluare spline
%apel z=evalspline(x,a,b,c,d,t)
%z - valorile
%t - punctele in care se face evaluarea
%x - nodurile
%a,b,c,d - coeficientii
%se determina subintervalul apoi se calc utilizind cei 4 termeni

n=length(x);
x=x'; t=t';
k = ones(size(t));
for j = 2:n-1
    k(x(j) <= t) = j;
end
% Evaluare interpolant
s = t - x(k);
z = d(k) + s.*(c(k) + s.*(b(k) + s.*a(k)));
