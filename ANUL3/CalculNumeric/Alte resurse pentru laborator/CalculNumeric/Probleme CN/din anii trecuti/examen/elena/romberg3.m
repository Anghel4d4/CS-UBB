function integr = romberg3(f, a , b, tol)

h = (b-a);
R(1,1) = (f(a) +f(b))*h/2;

converge = 0;

for k=2:100

R(k,1) = 1/2*(R(k-1,1)+ h * sum(f(a+([1:2^(k-2)]-1/2)*h)));
%h = h/2;
end

for j = 2:k
    R(k,j) = (4^(j-1)*R(k,j-1) - R(k-1,j-1))/((4^(j-1))-1);
end

if (abs(R(k,k) - R(k-1,k-1))< tol)
    integr = R(k,k);
    converge = 1;
   return;
end


if converge ==0
    error('metoda nu converge');
end