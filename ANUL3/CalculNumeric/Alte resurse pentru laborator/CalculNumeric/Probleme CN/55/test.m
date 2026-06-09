function test()
%afisarea rezultatului pentru integrala ceruta
f= 'x^4*(1-x)^4/(1+x^2)';
rez=int(f,'x', 0, 1 );
fprintf('-----Calcul cu functia int din toolbox-ul Symbolic -----');
eval(rez)
%rezultatul este 0.001264 aproximativ 0.0013