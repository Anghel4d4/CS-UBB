function e=myeps(Nrb)
    if Nrb == 32
        e = single(1);
    else
        e = 1;
    end
    
    while 1+e/2 > 1
        e=e/2;
    end
    