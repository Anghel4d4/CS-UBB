function g = real(g)

gvals = real(g.vals);
if all(gvals == 0), 
    g.vals = 0; g.n = 1; g.scl.v = 0;
else
    g.vals = gvals;
    g = simplify(g);
end