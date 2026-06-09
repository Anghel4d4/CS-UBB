function out = isequal(g1,g2)

if g1.n==g2.n && all(g1.vals==g2.vals) && samemap(g1,g2) && all(g1.exps == g2.exps)
    out = true;
else
    out = false;
end