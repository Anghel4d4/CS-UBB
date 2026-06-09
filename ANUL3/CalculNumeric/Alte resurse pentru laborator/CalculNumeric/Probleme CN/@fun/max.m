function [out,idx] = max(g)

if (g.exps(1) && g.vals(1) > 0) 
    out = inf; 
    idx = 1;
    return
end

if (g.exps(2) && g.vals(end) > 0) 
    out = inf;
    idx = g.n;
    return
end

r = roots(diff(g));
ends = g.map.par(1:2);
r = [ends(1);r;ends(end)];
[out,idx] = max(feval(g,r));
idx = r(idx);