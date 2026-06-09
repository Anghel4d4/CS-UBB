function [tout,yout] = oderk(F,tspan,y0,BT,opts,varargin)
%ODERK rezolva ecuatii diferentiale nonstiff
%   ODERK utilizeaza doua metode continute date prin tabela Butcher
%
%   ODERK(F,TSPAN,Y0) cu TSPAN = [T0 TFINAL] integreaza sistemul
%   de ecuatii diferentiale y' = f(t,y) de la t = T0 la t = TFINAL. Conditia
%   initiala este y(T0) = Y0.  F este numele unui fisier M, sau o functie
%   inline sau un sir de caractere ce defineste f(t,y).  
%   Aceasta functie trebuie sa aiba doua argumente, t si y si
%   trebuie sa returneze un vector coloana al derivatelor, y'.
%
%   Cu doua argumente de iesire, [T,Y] = ODERK(...) returneaza un vector
%   coloana T si un tablou Y unde Y(:,k) este solutia in T(k).
%
%   Fara argumente de iesire ODERK reprezinta grafic solutia.
%
%   ODERK(F,TSPAN,Y0,RTOL) utilizeaza eroarea relativa RTOL, in locul 
%   celei implicite 1.e-3.
%
%   ODERK(F,TSPAN,Y0,BT) utilizeaza tabela Butcher. Daca BT este vid,
%   se utilizeaza BS23 (Bogacki-Shampine)
%
%   ODERK(F,TSPAN,Y0,BT,OPTS) unde OPTS = ODESET('reltol',RTOL, ...
%   'abstol',ATOL,'outputfcn',@PLOTFUN) utilizeaza eroarea relativa
%   RTOL in locul valorii implicite 1.e-3, eroarea absoluta ATOL in loc
%   de 1.e-6 si apeleaza PLOTFUN in loc de ODEPLOT dupa fiecare pas terminat
%   cu succes.
%
%   Daca se apeleaza cu mai mult de 5 argumente de intrare,
%   ODERK(F,TSPAN,Y0,BT,RTOL,P1,P2,...), argumentele suplimentare
%   se transmit lui F, F(T,Y,P1,P2,...).
%
%
%   Exemplu
%      tspan = [0 2*pi];
%      y0 = [1 0]';
%      F = '[0 1; -1 0]*y';
%      oderk(F,tspan,y0);

% Initializare variabile

rtol = 1.e-3;
atol = 1.e-6;
plotfun = @odeplot;
statflag=0;
%statflag=(nargout==3);
if (nargin >= 4) & ~isempty(BT)
    [lambda,alfa,alfas,mu,s,oop,fsal]=BT(); %tabela Butcher
else
    [lambda,alfa,alfas,mu,s,oop,fsal]=BS23(); %Bogacki-Shampine
end

if nargin >= 5 & isnumeric(opts)
    rtol = opts;
elseif nargin >= 5 & isstruct(opts)
    statflag=strcmp(opts.Stats,'on');
    if ~isempty(opts.RelTol), rtol = opts.RelTol; end
    if ~isempty(opts.AbsTol), atol = opts.AbsTol; end
    if ~isempty(opts.OutputFcn), plotfun = opts.OutputFcn; end
end
if statflag  %statistici
    stat=struct('ns',0,'nrej',0,'nfunc',0);
end

t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
plotit = (nargout == 0);
threshold = atol / rtol;
hmax = abs(0.1*(tfinal-t0));
t = t0;
y = y0(:);

% Face F apelabila prin feval

if ischar(F) & exist(F)~=2
    F = inline(F,'t','y');
elseif isa(F,'sym')
    F = inline(char(F),'t','y');
end 

% Initializeaza iesirile

if plotit
    plotfun(tspan,y,'init');
else
    tout = t;
    yout = y.';
end

% Calculeaza pasul initial

K=zeros(length(y0),s);
K(:,1)=F(t,y,varargin{:});  %prima evaluare
if statflag, stat.nfunc=stat.nfunc+1; end
r = norm(K(:,1)./max(abs(y),threshold),inf) + realmin;
h = tdir*0.8*rtol^(oop)/r;

% ciclul principal

while t ~= tfinal
    
    hmin = 16*eps*abs(t);
    if abs(h) > hmax, h = tdir*hmax; end
    if abs(h) < hmin, h = tdir*hmin; end
    
    % corectare pas final
    
    if 1.1*abs(h) >= abs(tfinal - t)
        h = tfinal - t;
    end
    
    % tentativa calcul pas
    
    for i=2:s
        K(:,i)=F(t+mu(i)*h,y+h*K(:,1:i-1)*(lambda(i,1:i-1)'));
    end
    if statflag, stat.nfunc=stat.nfunc+s-1; end
    tnew=t+h;
    ynew=y+h*K*alfas;

    % Estimeaza eroarea
    
    e = h*K*(alfa-alfas);
    err = norm(e./max(max(abs(y),abs(ynew)),threshold),inf) + realmin;
    
    % Accepta solutia daca eroarea estimata < toleranta
    
    if err <= rtol %pas acceptat
        t = tnew;
        y = ynew;
        if plotit
            if plotfun(t,y,'');
                break
            end
        else
            tout(end+1,1) = t;
            yout(end+1,:) = y.';
            if statflag
                stat.ns=stat.ns+1;
            end
        end
        if fsal % Reutilizare valoare finala daca e cazul
            K(:,1)=K(:,s);
        else
            K(:,1)=F(t,y);
            if statflag, stat.nfunc=stat.nfunc+1; end
        end
    else %pas respins
        if statflag, stat.nrej=stat.nrej+1; end
    end
    
    % Calcul pas nou 
    
    h = h*min(5,0.8*(rtol/err)^(oop));
    
    % Iesire daca pasul este prea mic
    
    if abs(h) <= hmin
        warning(sprintf('dimensiune pas %e prea mica in t = %e.\n',h,t));
        t = tfinal;
    end
end

if plotit
    plotfun([],[],'done');
end
if statflag
    fprintf('%d pasi cu succes\n',stat.ns)
    fprintf('%d pasi esuati\n', stat.nrej)
    fprintf('%d evaluari de functii\n', stat.nfunc)
end
