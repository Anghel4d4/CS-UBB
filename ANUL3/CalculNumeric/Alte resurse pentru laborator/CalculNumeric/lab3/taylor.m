function T=taylor(n,x)
    v = floor(x / (2*pi));
    x = x - 2*pi*(v-1);
    T=0;
    for i=0:n
        T = T +(1/factorial(2*i+1))*x.^(2*i+1)*(-1)^i;
    end
end