% Problema 4.77. 
% Dorim sã calculãm: int(0,1) x*sin(1/x)dx
% a) Incercati sa obtineti valoarea "exacta" utilizand Symbolic Math
% Toolbox sau Maple.
% b) Ce se întâmplã dacã utilizati o cuadraturã adoptivã sau functia MATLAB
% quad?
% c) Cum puteti rezolva impedimentul de la punctul anterior?
% Calculati integrala cu o eroare absoluta < 10^(-8).

clc
% a) Rezultatul integralei calculata in Maple este: 0.3785300171
% b) Folosind functia predefinita 'quad', se obtine de asemenea valoarea numerica = 0.3785
f = @(x)x.*sin(1./x);
I = quad(f,0,1)
% Functia de integrat are o singularitate in zero (impartirea la zero)
% motiv pentru care nu converge. Pentru evitarea acelei impartiri, inlocuim zero cu eps. 
% q = adaptQuad(f,0,1,1e-8,@SimpsonInt)
q = adaptQuad(f,eps,1,1e-8,@SimpsonInt)

%c) Rezolvarea impedimentului de la punctul anterior ar fi sã pornim cu o valoare
%de start a limitei de integrare relativ mare si sa o tot injumatatim pana cand se obtine precizia dorita (10^(-8)):

 x0 = 1e-3; i1 = adaptQuad(f,x0,1,1e-8,@SimpsonInt);
 x0 = x0/2; i2 = adaptQuad(f,x0,1,1e-8,@SimpsonInt);
 while abs(i1-12) > 1e-8 
     i1 = i2;
     x0 = x0/2;
     i2 = adaptQuad(f,x0,1,1e-8,@SimpsonInt);
 end
 i2 