function varargout = domain(f)

if numel(f) == 1
    if nargout < 2 || numel(f.ends)==0
        varargout{1} = domain(f.ends);   % OK if f is empty
    else
        varargout{1} = f.ends(1);
        varargout{2} = f.ends(end);
    end
elseif nargout <= 1
    % Return interval as a domain without breakpoints.
    varargout = { domain(f(1).ends([1 end])) };
elseif nargout == 2
    varargout{1} = f(1).ends(1);
    varargout{2} = f(1).ends(end);
else
    varargout = {[f(1).ends(1),f(1).ends(end)]};
end
