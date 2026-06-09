function rez = aproxSin (x)
    % aducere valoare in intervalul [0, 2pi)
    parte_intreaga = floor( x / (2 * pi));
    x = x - (2 * pi) * parte_intreaga;
    % x e in intervalul [0, 2pi)
    
    % aduc pe x in primul cadran si determin cadranul in care se afla
    cadran = 1;
    if x >= pi / 2 && x < pi
       cadran = 2;
       x = pi - x;
    else if x >= pi && x < 3 * pi / 2
            cadran = 3;
            x = x - pi;
        else if x >= 3*pi/2 && x < 2 * pi
            cadran = 4;
            x = 2 * pi - x;
            end
        end
    end
    
    if x < 1e-8
        % daca x e mai mic decat 1e-8 diferenta intre x si sin(x) e
        % neglijabila
        rez = x;
    else
        if x > pi / 6
            u = x / 3;
        else
            u = x;
        end
        
        % sin u
        sinu = u * (- 479249 * u^6 / 11511339840 + 34911 * u^4 / 7613320 - 29593 * u ^2 / 207636 + 1) / (1 + 1671 * u ^ 2 / 69212 + 97 * u ^ 4 / 351384 + 2623 * u ^ 6 / 1644477120);
        if x > pi / 6
            rez = (3 - 4 * sinu ^ 2) * sinu;
        else
            rez = sinu;
        end
    end
    
    % tin cont de cadranul in care a fost x si ajustez semnul lui sin(x)
    if cadran == 3 || cadran == 4
        rez = -rez;
    end
    