% Daraban Cristian - Adrian
% Grupa 232
% Problema 1.14(sinus)
% calc in radiani sin x
function r = calcSin(x)
        x = rem(x, 2*pi);
        len = length(x);
        
        for i = 1 : len
            if x(i) >= pi/2 && x(i) < 3 * pi / 2
                x(i) = pi - x(i);
                fprintf('Cadranul 2 sau  3 \r\n');
            end
            
            if abs(x(i)) < 1e-8
                r(i) = x(i);
            end
    
            if abs(x(i)) > pi/6
                u = x(i)/3;
                sinu =  u * (  (- 479249 * u^6 / 11511339840 + 34911 * u^4 / 7613320 - 29593 * u^2 / 207636 + 1) / (1 + 1671 * u^2 / 69212 + 97*u^4/351384 + 2623 * u^6 /1644477120 ) );
                r(i) = ( 3 - 4 * sinu^2 ) * sinu;
            end
    
            if abs(x(i)) <= pi/6
                u = x(i);
                r(i) = u * (  (- 479249 * u^6 / 11511339840 + 34911 * u^4 / 7613320 - 29593 * u^2 / 207636 + 1) / (1 + 1671 * u^2 / 69212 + 97*u^4/351384 + 2623 * u^6 /1644477120 ) );
            end
        end
end