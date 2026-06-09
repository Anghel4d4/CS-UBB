function v=mymin(Nrb)
    v = mymeansubnorm(Nrb);
    w = v;
    
    while v+w > v
        v = v*2;
    end
    v=v/2;
   
    