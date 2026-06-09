clc
%ln(1+x) ~ (-1)^(k+1)*x^k/k
fprintf('log(2)=%g\n', log(2));
fprintf('aprox1=%g\n', aprox1log(1,80000));
fprintf('aprox2=%g\n', aprox2log(1,0.00001));%primele 5 zecimale corecte
fprintf('aprox3=%g\n', aprox3log(1/3,1e-5));%primele 5 zecimale corecte