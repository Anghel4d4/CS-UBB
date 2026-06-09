function [f,n] = my_sine(x,tol)
format longg
syms n;
% function my_sine : uses Taylor series expansion to evaluate sin(x)
% outputs
    % f - the estimate of sin(x)
    % n - the number of terms in the series required to acheive ...
        % ... the desired accuracy
% inputs
    % x - the x-value to evaluate 
    % tol - the tolerance to which to sin(x) function should be evaluated 
% start the count for the number of iterations ( n )
n = 1;
% to initialize the starting error as greater than tol
ea = tol*10;
% x_real - the true value of the sin(x), evaluated 
    % ... using the built in sin(x) matlab function
x_real = sin(x); 
    if ea > tol 
       for k =0:n
         f = 1 + ((-1)^k.*x.^(2.*k+1)./factorial(2.*k+1));
        n = n + 1;
        f = sum(f);
       end
    ea = abs(x_real - f)./x_real*100;  
    end
        fprintf('The estimate using taylor series approximation : ')
        disp(f)
        fprintf('The number of terms required : ')
        disp(n)
end