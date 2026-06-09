function g = cumsum(g)

% linear map (simplest case)
if strcmp(g.map.name,'linear')
    
    if isempty(g), return, end
    g.vals = g.vals*g.map.der(0); % From change of variables to [-1,1]
    g = cumsum_unit_interval(g);
    
% Infinite intervals    
elseif norm(g.map.par(1:2),inf) == inf
    
    % constant case
    if g.n == 1
        if abs(g.vals) <= chebfunpref('eps')*10*g.scl.v
            g.vals = 0; g.n = 1; g.scl.v = 0;
        else
            warning('fun:cumsum','Integral seems to diverge')
            g.vals = nan; g.n = 1; g.scl.v = inf;
        end
        return
    end

    % non-constant case
    g = cumsum_unit_interval(changevar(g));
    
% General map case    
else
    
    map = g.map; g.map = linear([-1 1]);
    g = cumsum_unit_interval(g.*fun(map.der,g.map));
    g.map = map;
   
end

end

function g = cumsum_unit_interval(g)

    n = g.n;
    c = [0;0;chebpoly(g)];                        % obtain Cheb coeffs {c_r}
    cout = zeros(n-1,1);                          % initialize vector {C_r}
    cout(1:n-1) = (c(3:end-1)-c(1:end-3))./...    % compute C_(n+1) ... C_2
        (2*(n:-1:2)');
    cout(n,1) = c(end) - c(end-2)/2;              % compute C_1
    cout(n+1,1) = (-1).^(n+1:-1:2)*cout;          % compute C_0
    g.vals = chebpolyval(cout);
    g.scl.v = max(g.scl.v, norm(g.vals,inf));
    g.n = n+1;
    
end
