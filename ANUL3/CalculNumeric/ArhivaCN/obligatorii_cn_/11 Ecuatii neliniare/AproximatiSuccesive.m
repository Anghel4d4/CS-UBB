function [z,ni] = AproximatiSuccesive(phi,x0,ea,er,nmax)
xc=x0(:);
for k=1:nmax
    xp=phi(xc);
    if abs(xp-xc)<ea+er*xp
        z=xp;
        ni=k;
        return
    end
    xc=xp;
end
error('S-a depasit numarul maxim de iteratii');
end

