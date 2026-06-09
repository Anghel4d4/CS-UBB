function out = isempty(g)

if numel(g) > 1
    out = 0;
else
    out = isempty(g.vals);
end
