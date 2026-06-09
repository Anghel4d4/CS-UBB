function f = chebfun(varargin)

persistent default_f
if isnumeric(default_f)
    default_f = ctor_ini;
    default_f = class(default_f,'chebfun');
end
f = default_f;

% No arguments -> return empty chebfun
if nargin == 0; return, end

% Chebfun preferences:
if isstruct(varargin{nargin}) && ~strcmpi(varargin{nargin-1},'map')
    pref = varargin{nargin};
    argin = varargin(1:end-1);
else
    pref = chebfunpref;
    % Find out if call changes preferences
    argin = varargin(1);
    k = 2; j = 2;
    while k <= nargin
        if ischar(varargin{k})
            varargin{k} = lower(varargin{k});
            % Is the argument a preference name?
            if  any(strcmp(fieldnames(pref),varargin{k}))
                % If ON or OFF used -> change to true or false
                value = varargin{k+1};
                if ischar(value)
                    if strcmpi(value,'on')
                        value = true;
                    elseif strcmpi(value,'off')
                        value = false;
                        % Factory values from chebfunpref
                    elseif strcmpi(value,'factory')
                        value = chebfunpref(varargin{k},'factory');
                    else
                        error('chebfun:chebfun:prefval', ...
                            'Invalid chebfun preference value')
                    end
                end
                pref.(varargin{k}) = value;
                k = k+2;
            elseif strcmp('map',varargin{k})
                pref.map =  varargin{k+1};
                k = k+2;
            elseif strcmp('exps',varargin{k})
                pref.exps = varargin{k+1};
                k = k+2;
            else
                argin{j} = varargin{k};
                j = j+1; k = k+1;
            end
        else
            argin{j} = varargin{k};
            j = j+1; k = k+1;
        end
    end
end

% Get domain
if  length(argin) == 1,
    argin{2} = double(pref.domain);
elseif isa(argin{2},'domain')
    argin{2}=double(argin{2});
end

if ~iscell(argin{1})
    argin = unwrap_arg(argin{:});
end

% Construct chebfun
if  length(argin) == 2,
    f = ctor_2(f,argin{:},pref); % adaptive call
elseif length(argin) == 3,
    f = ctor_3(f,argin{:},pref);      % non-adaptive call
end

% Prune repeated endpoints and assign values to the imps matrix
if f.nfuns > 1 && any(diff(f.ends) == 0)
    k = 1;
    while k < length(f.ends)
        if diff(f.ends(k:k+1)) == 0
            f.ends(k+1) = [];
            f.imps(k+1) = [];
            f.nfuns = f.nfuns - 1;
            f.imps(1,k) = f.funs(k).vals(1);
            f.funs(k) = [];
        else
            k = k+1;
        end
    end
end

end

function f = ctor_ini() % Default fields for a chebfun
% The following fields should always be allocated automatically with the function set.
f = struct([]);
f(1).funs = [];
f(1).nfuns = 0;
f(1).scl = 0;
% The following fields can be manipulated manually.
f(1).ends = [];
f(1).imps = [];
f(1).trans = false;

end
