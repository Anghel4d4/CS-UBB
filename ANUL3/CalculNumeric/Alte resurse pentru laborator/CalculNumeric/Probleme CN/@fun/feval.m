function out = feval(g,x)

exps = g.exps;
ends = g.map.par(1:2);

if isfield(g.map,'inv')
    out = bary(g.map.inv(x),g.vals);
    out = out./((x-ends(1)).^exps(1).*(ends(2)-x).^exps(2));
else
    n = g.n;
    xk = chebpts(n);
    w =  [1/2; ones(n-2,1); 1/2].*(-1).^((0:n-1)'); 
    out = bary(x,g.vals,g.map.for(xk),w);
    out = out./((x-ends(1)).^exps(1).*(ends(2)-x).^exps(2));
end