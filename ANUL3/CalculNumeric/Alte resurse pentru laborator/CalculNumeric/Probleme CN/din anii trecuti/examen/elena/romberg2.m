function integrala = romberg2(f,a,b,tol)

h=b-a;
R(1,1) = h/2*(f(a)+f(b));

for k=2:100
    i = 1:2^(k-2);
    R(k,1) = 1/2*(R(k-1,1) + h*sum(f(a+(i-1/2).*h)));
    for j=2:k
        R(k,j) = (4.^(j-1)*R(k,j-1)-R(k-1,j-1))/(4.^(j-1)-1);
    end
    if abs(R(k,k) - R(k-1,k-1)) < tol
        integrala = R(k,k);
        return
    end
    h = h/2;
end

error('Metoda nu converge');