function Newton
    a = 2;
    f = @(x) exp(-x.^2)-cos(x)-1; % functia ta
    f1 = @(x) -2*x*exp(-x^2)+sin(x); % derivata acelei functii, ai nevoie de ea la Newton ( in while)
    eps = 10.^(-);
   
    
    x0 = 1;
    x1 = x0 - f(x0)/f1(x0);
  
    while abs(x1-x0) > eps
        x0 = x1;
        x1 = x0 - f(x0)/f1(x0);
    end
    
    disp(['Aprox lui radical de ordin 5 din 2 cu precizia 10^-6 este: ' num2str(x1)])
    

    
