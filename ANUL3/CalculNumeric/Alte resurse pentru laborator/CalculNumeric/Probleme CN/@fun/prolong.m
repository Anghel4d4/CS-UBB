function g = prolong(g,nout)

m = nout - g.n;

% Trivial case
if m == 0
    return
end
% Constant case
if g.n ==1
    g.vals = g.vals*ones(nout,1);
    g.n = nout;
    return
end

if  (m<0 && nout<129 && g.n<1000)% Use barycentric to prolong
    g.vals = bary(chebpts(nout),g.vals); g.n = nout;
else % Use FFTs to prolong
    c = chebpoly(g);  
    if m>=0
        % Simple case, add zeros as coeffs.
        g.vals = chebpolyval( [zeros(m,1); c] ); g.n = nout; 
    else
        % To shorten a fun, we need to consider aliasing
        c = flipud(c);
        calias = zeros(nout,1);
        nn = 2*nout-2;
        calias(1) = sum(c(1:nn:end));        
        for k = 2:nout-1
            calias(k) = sum(c(k:nn:end))+sum(c(nn-k+2:nn:end));
        end
        calias(nout) = sum(c(nout:nn:end));
        calias = flipud(calias);
        g.vals = chebpolyval(calias); g.n = nout; 
    end
end