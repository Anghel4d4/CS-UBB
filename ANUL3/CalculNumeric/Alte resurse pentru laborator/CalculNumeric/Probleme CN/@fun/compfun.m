function gout = compfun(g1,op,g2)

pref = chebfunpref;

if nargin == 3
    if ~samemap(g1,g2)
        ends = g1.map.par(1:2);
        if norm(ends-g2.map.par(1:2),inf) > 1e-15*max(g1.scl.h,g2.scl.h)
            error('fun:minus:domain','Domains dont match')
        else
            scl.h = max(g1.scl.h,g2.scl.h);
            scl.v = max(g1.scl.v,g2.scl.v);
            gout = fun(@(x) op(feval(g1,x),feval(g2,x)), ...
                g2.map.par([1,2]), pref, scl);
            return
        end
    end
    gout = growfun(op,g1,pref,g1,g2);
else
    if any(g1.exps) % Deal with blowup (exponents)
        scl = g1.scl;
        scl.v = op(scl.v);
        gout = fun(@(x) op(feval(g1,x)), g1.map.par([1,2]), pref, scl);
    else
        gout = growfun(op,g1,pref,g1);
    end
end


