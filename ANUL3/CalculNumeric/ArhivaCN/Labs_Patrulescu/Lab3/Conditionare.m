function Conditionare
    w = [10,7,8,7;7 5 6 5;8,6,10,9;7,5,9,10];
    b = [32;23;33;31];
    wp = [10,7,8.1,7.2;7.8,5.04,6,5;8,5.98,9.89,9;6.99,4.99,9,9.98];
    bp = [32.1,22.9,33.1,30.9]';
    x = w\b;
    xw = wp\b;
    xb = w\bp;
    xt = wp\bp;
    [x xw xb xt];
    dw = w - wp;
    db = b - bp;
    [dw db];
    Nw = norm(dw);
    Nb = norm(db);
    Nx1 = norm(xw-x)
    Nx2 = norm(xb-x)
    Nx3 = norm(xt-x)
    cond(w)
    
    
    