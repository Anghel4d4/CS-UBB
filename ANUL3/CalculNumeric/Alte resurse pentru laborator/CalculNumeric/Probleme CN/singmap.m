function s = singmap(on_off)

persistent singstate

if isempty(singstate)
    singstate = false;
end

if nargin==0
    if nargout == 1
        s = singstate;
    else
        switch singstate
            case 1
                disp('SINGMAP is currently ON')
            case 0
                disp('SINGMAP is currently OFF')
        end
    end
else
    if strcmpi(on_off, 'on')
        singstate = true;
    elseif strcmpi(on_off, 'off')
        singstate = false;
    else
        error('CHEBFUN:singstate:UnknownOption',...
            'Unknown SINGMAP option: only ON and OFF are valid options.')
    end
end
