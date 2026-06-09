function out = isequal(F1,F2)

out = true;

if size(F1) ~= size(F2)
    out = false;
    return
end

for k = 1:min(size(F1))
    if F1(k).nfuns~=F2(k).nfuns || any(F1(k).ends ~= F2(k).ends)
        out = false;
        return
    end
    if F1(k).imps ~= F2(k).imps
        out = false;
        return
    end
    for j = 1:F1(k).nfuns
        if ~isequal(F1(k).funs(j),F2(k).funs(j))
            out = false;
            return
        end
    end
end
