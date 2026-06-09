function f = flipud(f)

ends = f.map.par(1:2);
if isinf(ends(1)) ||isinf(ends(2))
    error('fun:flipud:unbounded','FLIPUD cannot be used on unbounded domanins');
end
f.vals = flipud(f.vals);
