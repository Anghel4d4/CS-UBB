function I=intRomberg(f, a, b, eroare)
R2 = ((b-a)/2)*(f(a)+f(b));
hk=b-a;
for k=2:100
    R1 = R2;
    R2=zeros(1, k);
    
    R2(1) = 1/2 * (R1(1)+hk* sum(f(a+hk:hk/2:b-hk/2)));
    hk=hk/2;
    for j = 2:k
        R2(j) = (4^(j-1)*R2(j-1)-R1(j-1))/(4^(j-1)-1);
    end
    R1
    if abs (R2(k)- R1(k-1)) < eroare
        I = R2(k);
        return;
    end
end
