function z=valspline(x,a,b,c,d,t)
% evaluarea spline
%x -nodurile
%a,b,c,d - coef
%t -punctele in care se face evaluarea

    n=length(x);
    x=x'; t=t';
    k = ones(size(t));
    for j = 2:n-1
        k(x(j) <= t) = j;
    end
    s = t - x(k);
    z = d(k) + s.*(c(k) + s.*(b(k) + s.*a(k)));
end