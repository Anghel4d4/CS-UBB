clc
format long
Pi=pi
aproxPi(5);
aproxPi(10);
aproxPi(15);
aproxPi(125);
fprintf('Eroarea relativa %.20f \n', (aproxPi(3)-pi)/pi);
fprintf('Pi cu precizia eps %.20f \n', aproxPi2(eps));
fprintf('Eroarea pentru n = 9: %.20f\n', aproxPi(9) - pi);
