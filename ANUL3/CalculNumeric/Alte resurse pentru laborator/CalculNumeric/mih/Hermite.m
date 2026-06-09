% x = [-1 0 1];    % punctele x1, x2, x3
% y = [ 1 0 1];    % valorile functiei f in punctele x1, x2, x3
% yy = [-2 0 2];   % valorile lui f'

function [qq, z] = Hermite(x, y, yy)
    m = length(x);
    z = zeros(2*m, 1);
    Q = zeros(2*m);
    
    for i=1:m
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1, 1) = y(i);
        Q(2*i, 1) = y(i);
        Q(2*i-1, 2) = yy(i);
        
        if (i~=1)
            Q(2*i-2, 2) =  (Q(2*i-1, 1) - Q(2*i-2, 1)) / (z(2*i-1) - z(2*i-2));
        end
    end
    
    % for-urile de la P4 din algoritm nu prea merg bine
    for j = 3:2*m
        for i = 1:(2*m-j+1)
            Q(i, j) = (Q(i+1, j-1) - Q(i, j-1)) / (z(i+j-1) - z(i));
        end
    end
    
    qq = round(Q);
end
