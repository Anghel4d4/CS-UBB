function secanta(f,x0,x1,NrItMax, err)

    for it=1:NrItMax
        
        x2 = x0 - (x0-x1)/(f(x0)-f(x1)) * f(x0);
        
        disp(x2);
        
        x0 = x1;
        x1 = x2;
        
        if(abs(x1-x0) < err)
            
            disp(it);
            return;
            
        end
    end