% Daraban Cristian 5.61

clc;
A = 25800; % mm^2 - aria sectiune coloan
e = 85; % mm - excentricitatea incarcarii
c = 170; % mm - semiadancimea coloanei
r = 142; % mm - raza de giratie a sectiunii 
L = 7100; % mm - lungimea coloanei
E = 71 * 1e9; % Pa - modului de elasticitate
sigmaMax = 120 * 1e6; % Pa
f = @(P) ((P./A).*(1+ ((e.*c)./r.^2).*sec((L./2.*r).*sqrt(P./(A.*E)))));
[Pfin,nrIt]=metSecant(f,3,sigmaMax);
disp(Pfin)
