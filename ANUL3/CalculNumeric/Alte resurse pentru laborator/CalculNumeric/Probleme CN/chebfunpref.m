function varargout = chebfunpref(varargin)
persistent prefs

% To speedup preference checks, try this first. 
% -----------------------------------------------
if nargin == 1
    try
        varargout{1} = prefs.(varargin{1});
        return
    catch
        % Move on to longer precess.
    end  
    
% Return preference structure if no input is provided.    
elseif nargin == 0 && ~isempty(prefs)
     varargout = { prefs };
end        
% -----------------------------------------------


% If the above didn't work, go through the longer process:

% These are the options
options =    {'splitting', 'minsamples', 'maxdegree', 'maxlength', 'splitdegree', 'resampling', 'domain', 'eps', 'sampletest', 'blowup'};
factoryvals = {false,       9,            2^16,      6000,      128,          true,         [-1 1],   2^-52,        true, true};

% Restore defaults ?
factory_flag = false;
if nargin == 1 
    if isstruct(varargin{1})
        % Assign prefs from structure input
        prefs = varargin{1};
        return
    elseif strncmpi(varargin{1},'factory',3)
        if nargout == 0
            % Restore defaults
            prefs = [];
            factory_flag = true;
        else
            % Return factory values without changing chebfunpref
            for k = 1:length(factoryvals)
                varargout.(options{k}) = factoryvals{k};
            end
            varargout = {varargout};
            return
        end
    end        
elseif nargin>=1
    % Error catching ...
    [truepref, indpref] = ismember(varargin{1},options);
    if ~truepref
        error('CHEBFUN:chebfunpref:argin','unknown chebfun preference')
    end
end

% first call, set factory values
if isempty(prefs)
    
    for k = 1:length(factoryvals)
        prefs.(options{k}) = factoryvals{k};
    end
    
    mlock %locks the currently running M-file so that clear functions do not remove it.
          % Use munlock and clear chebfunpref if you edit this file.
end

% Assign output values
if nargin==0 || factory_flag
    varargout = { prefs };
elseif nargin==1 && not(factory_flag)
    varargout = { prefs.(varargin{1}) };
elseif nargin==2
    
    
    if ischar(varargin{2})
        
        if strncmpi(varargin{2},'factory',3)
            val = factoryvals{indpref};
            if nargout == 0
                % Set preference to its factory value.
                prefs.(options{indpref}) = val;
            else
                % Return factory value without changing chebfunpref variable
                varargout = {val};
            end
            return
            
        elseif strcmpi(varargin{2},'on')
            varargin{2} = true;
        elseif strcmpi(varargin{2},'off')
            varargin{2} = false;
        else
            %  if ischar(varargin{2})
            error('CHEBFUN:chebfunpref:argin','invalid second argument')
        end
        
    end
    
    %         % If preference is 'minn', check for consistency!
    %         if strcmp(varargin{1},'minn')
    %             minn = varargin{2};
    %             varargin{2} = max(2,2^floor(log2(minn-1))+1);
    %         end
    % If preference is 'eps', check for consistency!
    if strcmp(varargin{1},'eps') && varargin{2}<2^-52
        varargin{2} = 2^-52;
        warning('CHEBFUN:chebfunpref:argin','eps value below machine precision. eps set to 2^-52');
    end
    % Set preference!
    prefs.(varargin{1}) = varargin{2};
    
    % To avoid error messages
    if nargout > 0
        varargout = {};
    end
    
    
    
else
    error('CHEBFUN:chebfunpref:argin','Check number of input arguments.')
end

