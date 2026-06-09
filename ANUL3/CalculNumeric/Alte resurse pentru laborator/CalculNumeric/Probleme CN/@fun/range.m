function r = range(g)

if ~isreal(g)
    r = range(abs(chebfun(g)));
    return
end

r = diff(minandmax(g));
