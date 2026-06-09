function [g, hpy, scl] = getfun(op, interval, pref, scl, exps)

% Initial setup
a = interval(1); b = interval(2);
htol = 1e-14*scl.h;

% If the interval is very small skeep adaptation  and return a constant
% This should never be happen, though!
if (b-a) < 2*htol
    g = fun(op((b+a)/2),[a b]);
    scl.v = max(scl.v,g.scl.v);
    g = set(g,'scl.v',scl.v);
    hpy = true;
    %warning('CHEBFUN:getfun:SmallInterval','Small interval, fun might be unhappy')
    return
end

g = fun(@(x) op(x), interval, pref, scl);

% Check happiness.
if pref.splitting
    hpy = (g.n < pref.splitdegree+1);
else
    hpy = (g.n < pref.maxdegree+1);
end

scl.v = g.scl.v;              % Update the vertical scale.

end