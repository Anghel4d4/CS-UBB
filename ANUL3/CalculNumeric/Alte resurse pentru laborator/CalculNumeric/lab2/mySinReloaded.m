function mySin = mySinReloaded(x)
    % normalizam pe x
    x = rem(x, 2 * pi);
    %dupa ce am adus x intre 0 si 2pi.
    % x = [0,pi/4] atunci y = sin(x)
    % x > pi/4 atunci y=cos(pi/2-x) d
    % x = [pi/2, pi] atunci x = pi -x
    % sinx=sin(pi-x)
    if x < 0
        s1 = -1;
    else
        s1 = 1;
    end
    x = abs(x);
    if x <= pi/2
        % Cadranul I
        s2 = 1;
    elseif x <= pi
        % Cadranul II
        x = pi - x;
        s2 = 1;
    elseif x <= 3*pi/2
        % Cadranul III
        x = x - pi;
        s2 = -1;
    else
        % Cadranul IV
        x = (2 * pi) - x;
        s2 = -1;
    end;
    if x <= pi/4
        mySin = s2 * s1 * sin(x);
    else
        mySin = s1 * s2 * cos(pi/2 -x);
    end;
end