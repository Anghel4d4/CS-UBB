function g = set(g,varargin)

propertyArgIn = varargin;
while length(propertyArgIn) >= 2,
    prop = propertyArgIn{1};
    val = propertyArgIn{2};
    propertyArgIn = propertyArgIn(3:end);
    switch prop
        case 'vals'
            g.vals = val;
            g.n = length(val);
            g.scl.v = max( g.scl.v, norm(val, inf) );
        case 'n'
            g.n = val;
        case 'scl'
            g.scl = val;
        case 'scl.h'
            g.scl.h = val;
        case 'scl.v'
            for k=1:numel(g)
                g(k).scl.v = val;
            end
        case 'map'
            g.map = val;
        case 'exps'
            g.exps = val;
        otherwise
            error('fun properties: val, n, map, exps, or scl')
    end
end