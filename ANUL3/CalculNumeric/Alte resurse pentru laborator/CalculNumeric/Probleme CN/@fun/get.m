function val = get(a, propName)

switch propName
    case 'vals'
        val = a.vals;
    case 'points'
        % Returns mapped Chebyshev points (consistent with vals)
        val = a.map.for(chebpts(a.n));
    case 'n'
        val = a.n;
    case 'scl'
        val = a.scl;
    case 'scl.v'
        val = a.scl.v;
    case 'scl.h'
        val = a.scl.h;
    case 'map'
        val = a.map;
    case 'exps'
        val = a.exps;        
    otherwise
        error([propName,' Is not a valid fun property'])
end