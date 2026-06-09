function Secanta
    a = 2;
    f = @(x) x.^5 - a; % functia ta
    eps = 10.^(-6);
  
    x0 = 1;
    x1 = 2;
    x2 = x1 - (x1-x0)*f(x1)/(f(x1)-f(x0));
    
    while abs(x2-x1) > eps
        x0 = x1;
        x1 = x2;
        x2 = x1 - ((x1-x0)*f(x1))/(f(x1)-f(x0));
    end
    
    disp(['Aprox lui radical de ordin 5 din 2 cu precizia 10^-6 este: ' num2str(x2)])