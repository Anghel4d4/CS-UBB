function varargout = plot(varargin)

numpts = 2001;

% get jumpline style and jumpval markers
jlinestyle = ':'; jmarker = 'x'; forcejmarks = false; infy = false;
for k = length(varargin)-1:-1:1
    if isa(varargin,'chebfun'), break, end
    if ischar(varargin{k})
        if strcmpi(varargin{k},'JumpLine');            
            jlinestyle = varargin{k+1};
            varargin(k:k+1) = [];
        elseif strcmpi(varargin{k},'JumpMarker');      
            jmarker = varargin{k+1}; 
            forcejmarks = true;
            varargin(k:k+1) = [];
        elseif strcmpi(varargin{k},'NumPts');      
            numpts = varargin{k+1}; 
            varargin(k:k+1) = [];
        end
    end
end

linedata = {}; markdata = {}; jumpdata = {}; dummydata = {}; jvaldata = {};
bot = inf; top = -inf;
while ~isempty(varargin)
    % grab the chebfuns
    if length(varargin)>1 && isa(varargin{2},'chebfun') % two chebfuns
        f = varargin{1};
        g = varargin{2};
        varargin(1:2) = [];
        if ~isreal(f) || ~isreal(g)
            warning('chebfun:plot:doubleimag',...
                'Imaginary parts of complex X and/or Y arguments ignored.');
            f = real(f); g = real(g);
        end
    else                                                % one chebfun
        f = [];
        g = varargin{1};
        varargin(1) = [];
    end
    
    % other data
    pos = 0;
    while pos<length(varargin) && ~isa(varargin{pos+1},'chebfun')
        pos = pos+1;
    end
    if pos > 0
        s = {varargin{1:pos}};
    else
        s = [];
    end
    varargin(1:pos) = [];

    if any(any(get(g,'exps'))), infy = true; end
    
    % get plot data
    [lines marks jumps jumpval misc] = plotdata(f,g,[],numpts);
    
    % limits for inf plots
    if ~isempty(misc)
        bot = min(bot,misc(1)); 
        top = max(top,misc(2));
    end
    
    % jump stuff
    if ~isempty(jumps) && ~isempty(jumps{1})
        tmp = jumps;           jumps = {};
        for k = 1:2:length(tmp)-1
            jumps = [jumps, {tmp{k},tmp{k+1}},jlinestyle];
        end
    elseif ~isempty(lines)
            jumps = {NaN(1,size(lines{1},2)),NaN(1,size(lines{2},2))};
    end
    if ~isempty(jumpval)
        tmp = jumpval;         jumpval = {};
        for k = 1:2:length(tmp)-1
            jumpval = [jumpval, {tmp{k},tmp{k+1}},jmarker];
        end
    elseif ~isempty(lines)
        jumpval = {NaN(1,size(lines{1},2)),NaN(1,size(lines{2},2))};
    end

    markdata = [markdata, marks];
    if ~isempty(lines)
        linedata = [linedata, lines, s];
    end
    jumpdata = [jumpdata, jumps];
    jvaldata = [jvaldata, jumpval];
    if ~isempty(lines)
        dummydata = [dummydata, lines{1}(1), NaN*ones(size(lines{2},2),1), s];
    end        
end
if isempty(markdata), 
    markdata = {[]};
else
    markdata = [markdata, s];
end
if isempty(dummydata), dummydata = {[]}; end
if isempty(linedata), linedata = {[]}; end
if isempty(jumpdata), jumpdata = {[]}; end
if isempty(jvaldata), jvaldata = {[]}; end

h = ishold;

% dummy plot for legends
hdummy = plot(dummydata{:}); hold on

h1 = plot(linedata{:},'handlevis','off');
h2 = plot(markdata{:},'linestyle','none','handlevis','off');
h3 = plot(jumpdata{:},'handlevis','off');
h4 = plot(jvaldata{:},'linestyle','none','handlevis','off');

defjlcol = true;
for k = 1:length(jlinestyle)
    if ~isempty(strmatch(jlinestyle(k),'bgrcmykw'.'))
        defjlcol = false; break
    end
end
defjmcol = true;
for k = 1:length(jmarker)
    if ~isempty(strmatch(jmarker(k),'bgrcmykw'.'))
        defjmcol = false; break
    end
end
    
for k = 1:length(h1)
    h1color = get(h1(k),'color');
    h1marker = get(h1(k),'marker');
    set(h2(k),'color',h1color);
    set(h2(k),'marker',h1marker);
    if defjlcol 
        set(h3(k),'color',h1color);
    end
    if defjmcol 
        set(h4(k),'color',h1color);
    end
    if strcmp(h1marker,'none') && ~forcejmarks
        set(h4(k),'marker','none');
    end
    set(h1(k),'marker','none');
end

if all(~isinf([bot top])) && infy
    try
        xl = get(gca,'xlim');
        axis([xl(1) xl(2) bot top]);
    end
end

if ~h, hold off; end

if nargout == 1
    varargout = {[h1 h2 h3 h4 hdummy]};
end





