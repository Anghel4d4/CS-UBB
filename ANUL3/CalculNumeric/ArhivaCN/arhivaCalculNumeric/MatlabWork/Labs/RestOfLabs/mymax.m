function M=mymax(Nrb)
    m = 2 - myeps(Nrb)
    
    while 2*m > m
        M=m;
        m=2*m;
    end
   
    