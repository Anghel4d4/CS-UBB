clc
err_max = 0;
x_max = 0;

%am redus rangul la -pi/2 <= x <= pi/2
for x = -pi/2:0.01:pi/2 
    fsin = sin(x);
    if fsin ~=0
        err = abs((fsin - Sinus(x))/fsin);
        if err > err_max
            err_max = err;
            x_max = x;
        end
        fprintf('sin(%g) = %.20f, Sinus(%g) = %.20f, err pentru x = %g \n', x, fsin, x, Sinus(x), err)
    end
end

fprintf('\nerr_max = %g pentru x = %g\n', err_max, x_max)
fprintf('sin(%g)      = %.20f\n', x_max, sin(x_max))
fprintf('Sinus(%g) = %.20f\n', x_max, Sinus(x_max))