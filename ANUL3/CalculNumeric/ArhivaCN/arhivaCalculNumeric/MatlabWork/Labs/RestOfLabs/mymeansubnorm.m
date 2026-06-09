function e=mymeansubnorm(Nrb)
    if Nrb == 32
        e = single(1);
    else
        e = 1;
    end
    
    while 0+e/2 > 0
        e=e/2;
    end
    