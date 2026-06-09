function F = mrdivide(f,g)

F=f;
if (isa(g,'double'))
    F.vals=f.vals/g;
    F.scl.v=f.scl.v/abs(g);
else
    error('Use ./ to divide a fun into a fun.');
end