function g = imag(g)

gvals = imag(g.vals);
if all(gvals == 0), 
    g.vals = 0; g.n = 1; g.scl.v = 0;
else
    g.vals = vals;
    g = simplify(g);
end