function g = newdomain(g,ends)

map = g.map;

% endpoints!
a = map.par(1); b = map.par(2); c = ends(1); d = ends(2);

% linear map from [a b] to [c d]
linfor = @(y) ((d-c)*y+c*(b-a)-a*(d-c))/(b-a);
lininv = @(x) ((b-a)*x+a*(d-c)-c*(b-a))/(d-c);
der = (d-c)/(b-a);

% New composed map!
map.for = @(y) linfor(map.for(y));
map.inv = @(x) map.inv(lininv(x));
map.der = @(y) der*map.der(y);
map.par(1:2) = ends;

% update fun!
g.map = map;
g.scl.h = max(g.scl.h,norm(ends,inf));