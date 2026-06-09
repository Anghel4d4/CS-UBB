% rezKepler.m
%
% Input:  Mean Anomaly ( M ) sau  , in radiani
%         eccentricity ( eps )
%         prec		   ( precizia...implicit  10^-6)
%
% Output: Eccentric Anomaly ( E  ) sau x, in radiani
%
%
%              M = E - e sin(E) echivant cu x - esin(x)-eta=0
%             

function rezKepler(M, e, pre)
%Daca apelul se face doar cu 2 parametri, atunci se va calcula cu precizia implicita 
if nargin == 2
    pre = 10^-6;
%daca apelul contine mai mult de 3 parametri, se va afisa un mesaj de eroare
elseif nargin > 3
    error('Prea multi parametri de intrare')
%daca apelul contine mai putin de 2 parametri, se va afisa un mesaj de eroare
elseif nargin < 2
    error('Prea putini parametri de intrare')
end

if abs(e)>=1
    error(' |eps| >=1 ... ruleaza cu |eps| < 1');
end

stop = 0;
%variabila stop, folosita pentru a iesi din ciclu atunci cand ajung la precizia ceruta

E1 = M;
while stop == 0
    E = M + e*sin(E1);
    
    %Iesire din ciclu daca s-a ajuns la precizia ceruta
    if abs(E - E1) < pre
        stop = 1;
    end
    
    E1 = E;
end
%Trecem E pe intervalul 0..2*pi
%while E > (2*pi)
%    E = E - 2*pi;
%end
%while E < 0
%    E = E + 2*pi;
%end

format long
fprintf('Rezultatul este: %f\n',E);

%Se poate verifica folosind
%http://www.geocities.com/SiliconValley/2902/kepler.htm 
%facand conversia din radiani in grade ( 1 radian = 57.2958 grade )
