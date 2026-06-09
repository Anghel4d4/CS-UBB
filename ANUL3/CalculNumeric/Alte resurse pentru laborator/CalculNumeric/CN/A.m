function s = A(x,X,Y,YY)
m = length(x);
z = zeros(1,2*m);
Z(2:2:2*m) = X;
Z(1:2:2*m-1) = X;

P = x - z(1);
S = A(1,1);
for i=2:2*m
    S = S + A(i,1)*P;
    P = P .* (x-z(i));
end

polyval(polyder(poly(Z(1:i))),x);
    p(x)=(x-z1);
    %p'(x)