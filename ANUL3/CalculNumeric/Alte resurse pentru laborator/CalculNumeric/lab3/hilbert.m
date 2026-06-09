function hilbert()
    % pr 2
    for n = 10:15
        H = hilb(n);
        nc = cond(H,2);
        fprintf('n=%d => cond=%g\n', n, nc);
    end
end