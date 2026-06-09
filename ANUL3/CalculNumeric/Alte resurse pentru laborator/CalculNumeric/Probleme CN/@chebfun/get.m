function val = get(f, propName)

switch propName
    case 'funs'
        val = f.funs;
    case 'map'
        if f.nfuns == 1
            val = f.funs(1).map;
        end
    case 'ends'
        val = f.ends;
    case 'imps'
        val = f.imps;
    case 'nfuns'
        val = f.nfuns;        
    case 'points'
        % Returns mapped Chebyshev points (consistent with vals)
        val = [];
        for k = 1:f(1).nfuns
            val = [val; f(1).funs(k).map.for(chebpts(f(1).funs(k).n))];
        end
    case 'scl'
        val = f.scl;
    case {'vals','exps'}
        funs = f.funs;
        val = [];
        for i = 1:f.nfuns
            val = [val;get(funs(i),propName)];
        end
    case 'trans'
        val = f(1).trans;
    otherwise
        error([propName,' is not a valid chebfun property'])
end
