format long
sn=1;
for n=2:20
    sn=sn/(2*(1+sqrt(1-sn)));
    p=2^n*sqrt(sn);
    fprintf('S_%d=%1.10f, P_%d=%1.10f\n',n+1,sn,n,p)
end

fprintf('\np_20=%1.12f \npi=%1.12f\n',p,pi)

%se observa ca sirul nostru P_n  aproximeaza 
%foarte bine pe pi (primele 10 zecimale sunt egale)