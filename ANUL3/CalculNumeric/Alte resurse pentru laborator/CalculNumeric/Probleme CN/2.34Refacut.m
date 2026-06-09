% %% 2.34 Consideram sistemul liniar cu matricea coeficientilor
% An = 2    -1     0    ...    0
%     -1     2    -1    ...    0
%      0    -1     2    -1     0
%      0     0    -1     2    -1
%      0     0     0    -1     2. 
% Explorati proprietatile metodei lui Jacobi si Gauss-Seidel utilizand
% Matlab.

%%
n = 100;
A = 2*diag(ones(n,1)) - diag(ones(n-1,1),1) - diag(ones(n-1,1),-1);
%A = M - N
%A = D - L - U
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);

%Jacobi
MJacobi = D;
NJacobi = L + U;
TJacobi = inv(MJacobi) * NJacobi;
rhoJacobi = max (abs(eig(TJacobi)))


%Gauss-Seidel
MGaussS = D - L;
NGaussS = U;
TGaussS = inv(MGaussS) * NGaussS;
rhoGaussS = max (abs(eig(TGaussS)))


%% Date de test: 
% n = 10:  rhoJacobi = 0.9595, rhoGaussS = 0.9206
% n = 50: rhoJacobi = 0.9981, rhoGaussS =  0.9962
% n = 100: rhoJacobi = 0.9995, rhoGaussS =  0.9990

%% Concluzie: rhoJacobi si rhoGauss - Seidel au valori subunitare, dar apropiate de 1, ceea ce duce la concluzia cã cele douã metode iterative au o convergenta lenta.
