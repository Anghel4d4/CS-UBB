%Problema 1.18 (logaritm natural)

function [rezultat] = logaritmNaturalTema(x)

    if(x==1)    
        
        rezultat=0
        
    else if(x>1)
            
        n=0;
        
        while (x/(2^n)<0.5)||(x/(2^n)>=1)
            n=n+1;
        end
        
        r=x/(2^n);
        
        u=(r-sqrt(2)/2)/(r+sqrt(2)/2);
        
        %y=ln((1+u)/(1-u))
        y=u*(20790-21545.27*u^2+4223.9187*u^4)/(10395-14237.635*u^2+4778.8377*u^4-230.41913*u^6);
        
        rezultat=(n-0.5)*log(2)+y
       
        end
    end

end

