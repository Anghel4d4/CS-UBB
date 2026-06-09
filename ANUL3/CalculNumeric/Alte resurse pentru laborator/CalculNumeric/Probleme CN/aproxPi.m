function rez = aproxPi (n)
    syms x;
    t=taylor(atan(x),x,0,2* n + 1);
    %calculam seria taylor in punctul 1/5
    t1=subs(t, x, 1/5);
    %calculam seria taylor in punctul 1/239
    t2=subs(t, x, 1/239);
    rez=16*t1-4*t2;
end
    