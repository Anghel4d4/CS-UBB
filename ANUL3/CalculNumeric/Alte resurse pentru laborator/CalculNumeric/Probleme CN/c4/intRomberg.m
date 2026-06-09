function I = intRomberg(f,a,b,err)
    h = (b - a);
    Rk = h/2 * (f(a) + f(b));
    for k = 2 : 200
        Rkn1 = Rk;
        Rk = zeros(1, k);
        Rk(1) = 1/2 * (Rkn1(1) + h * sum(f(a + h/2:h:b-h/2)));
        for j = 2:k
            Rk(j) = (4^(j-1) * Rk(j-1) - Rkn1(j-1)) / (4^(j-1) - 1);
        end
        if abs(Rk(k) - Rkn1(k-1)) < err
            I = Rk(k);
            return;
        end
        h = h/2;
    end
    error('Nu s-a obtinut rezultatul cu precizia ceruta')