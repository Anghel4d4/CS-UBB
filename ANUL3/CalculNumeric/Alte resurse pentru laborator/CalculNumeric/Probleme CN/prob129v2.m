% Limita fara sa reprezentam in virgula flotanta
clearvars
syms m
limit((1+1/m)^m,Inf);

% va da exp(1), adica e^1

%Acuma vom reprezenta in virgula flotanta
n = realmax;
% 1+1/(1.7977e+15) - e ultima ecuatia care se poate calcula fara ca
% rezultatul sa dea 1

disp('Pentru numere pozitive');
1+1/(1.9999e+14)
1+1/(9.9999e+15)
1+1/(1.0000e+16)
1+1/(1.0000e+17)

disp('Pentru numere negative');
1+1/(-1.9999e+15)
1+1/(-1.0000e+16)
1+1/(-1.9999e+16)
1+1/(-1.0000e+17)

% infinit obtinem daca semnificantul e 0 si 
1+1/(0.0000e+16)

1+1/(-0.0000e+16)

n = realmax;
(1 + (n+1))^(n+1)

% NaN-uri are trebui sa obtinem cand semnificanul e diferit de 0

1+1/(1.0000e+5000)