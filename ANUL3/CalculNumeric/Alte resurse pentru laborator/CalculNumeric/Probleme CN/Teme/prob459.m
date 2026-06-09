clc
f = @(x) cos(x).^2;

% (a) Calculul integralei
I = integral(f,0,4*pi);
disp(I) % Va afisa 6.2832

% (b) Calcul folosind cuadratura adaptiva bazata pe met. Simpson +
% extrapolarez
qAdp = quadAdaptive(@formSimpson,f,0,4*pi,1e-3);
disp(qAdp) % Va afisa 5.3856
% Se observa ca rezultatul este diferit fata de calculul integralei de la
% (a), dar si ca rularea acestei functii determina un consum suplimentar de
% timp de calcul, datorita caracterului recursiv al functiei (se
% calculeaza, in mod repetat, valorile functiei in noduri). De asemenea,
% eroarea trebuie aleasa astfel incat sa nu se intre in ciclu infinit.

% (c) Calcul folosind functia quad
q = quad(f,0,4*pi);
disp(q) % Va afisa 6.2832
% Spre deosebire de functia quadAdaptive, quad aproximeaza integrala
% functiei f fara a mai efectua calcule intermediare si nu permite ca eroarea sa
% depaseasca 1e-6.

% (d) Calcul folosind cuadratura gaussiana si metoda Romberg.

% Cuadratura Gauss-Legendre
% Deoarece cuadratura GL este pe intervalul [-1;1], este necesar schimbarea
% de variala si inlocuirea in fct a lui x. Astfel fie t = a*x + b. Avem
% sistemul t=-1, x=0 si t=1, x=4*pi; Calculand, obtinem a=1/2*pi; b=-1; dt =
% a dx; x = (t - b) / a = (1/2*pi) * (t+1) => cos(x)^2 = cos((t+1)*2*pi)^2;
% Asadar fct pentru care vom calcula cuadratura gaussiana este: fg(t) =
% @(t) 2*pi * cos((t+1)*2*pi).^2;
fg = @(t) (2*pi) .* cos((t+1)*2*pi).^2;
[A,t] = generateLegendre(50);
I = applyCuadrature(A,t,fg);
disp(I) % Se obtine 6.2832

% Metoda Romberg
metR = metRomberg(f,0,4*pi,1e-3,50);
disp(metR) % Va afisa 6.2824
