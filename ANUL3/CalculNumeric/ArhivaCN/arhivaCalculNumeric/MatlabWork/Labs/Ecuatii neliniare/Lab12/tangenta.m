function secanta(f,fdev,x0,NrItMax, err)

    for it=1:NrItMax
        
        x2 = x0 - f(x0)/fdev(x0);
        
        disp(x2);

        
        if(abs(x2-x0) < err)
            
            disp(it);
            return;
            
        end
        
        x0=x2;
    end