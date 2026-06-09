function y = arcsin( x , c)
%ARCSIN Calculeaza arcsin de x
    
    if abs(x) <= 1/sqrt(2)
        y = chebpolval(c, x, -1/sqrt(2), 1/sqrt(2));
    else
        y = pi/2 - arcsin(sqrt(1-x^2), c);
        y = y * sign(x);
    end
    

end

