function [L,Lconst] = lebesgue(x,varargin)  

if nargin==1
  d = domain(-1,1);
elseif nargin==2
  d = domain(varargin{1});
elseif nargin==3
  d = domain(varargin{1},varargin{2}); 
else
  error('wrong number of arguments in lebesgue');
end

% barycentric weights
w = bary_weights(x);
% set preferences
pref = chebfunpref; pref.sampletest = false; pref.maxdegree = length(x)-1;
% ill-conditioned computations may prevent convergence to high accuracy.
warning('off','CHEBFUN:auto')
% Lebesgue function (breakpoints at interpolation nodes)
L = chebfun(@(t) lebfun(t,x(:),w), unique([x(:);d.ends.']), pref);
warning('on','CHEBFUN:auto')

% Lebesgue constant
if nargout==2, Lconst = norm(L,inf); end


function L = lebfun(t,xk,w)
% Lebesgue function: xk are nodes, w are weights, t evaluation points
% Based on barycentric formula.
L = ones(size(t)); % Note: L(xk) = 1
mem = ismember(t,xk);
for i = 1:numel(t)
    if ~mem(i)
        xx = w./(t(i)-xk);
        L(i) = sum(abs(xx))/abs(sum(xx));
    end
end