function [d,x] = domain(varargin)

if nargin==0
  v = [];
elseif nargin==1
  v = varargin{1};
  if isa(v,'domain'); v = v.ends; end
else
  v = cat(2,varargin{:});
end

if (length(v)>1) && (v(end) < v(1))   % empty interval
  v = [];
end

d.ends = v;

superiorto('double');
d = class(d,'domain');

if nargout > 1
  x = chebfun(@(x) x,d);
end

end