function y = arcsin( x , c)
%ARCSIN Calculeaza arcsin de x
    
    if abs(x) <= 1/sqrt(2)
        y = evalChebyshev(c, [x]);
    else
        y = 0;
    end
    

end

