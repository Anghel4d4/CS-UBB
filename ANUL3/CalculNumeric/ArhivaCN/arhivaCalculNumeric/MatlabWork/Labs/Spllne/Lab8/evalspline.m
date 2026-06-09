function s = evalspline(x,a,b,c,d,X)
    
    s= zeros(1,length(X));
    n = length(x)-1;
    
    
    for indX=1:length(X)
        indice=0;
        disp(X(indX));
        for i=1:n
            if( x(i) <= X(indX) && X(indX)<=x(i+1) )
                indice = i;
            end
        end
          s(indX) = a(indice) *(X(indX)-x(indice))^3 + b(indice) *(X(indX)-x(indice))^2 +  c(indice) *(X(indX) - x(indice)) + d(indice);
    end
    
    
    
    