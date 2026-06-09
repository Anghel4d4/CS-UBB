%Aceasta functie reprezinta implementarea metodei ceruta la punctul (b)
%	Un test este chiar rezolvarea punctului (c), cod de test aflat in fisierul test_ecuatie.m
function z = iter( g,z0,eps)
znou=z0;
k=1;
while k==1 | abs(znou-zvechi)>=eps
    zvechi=znou;
    znou=g(g(zvechi))-(g(g(zvechi))-g(zvechi))^2/(g(g(zvechi))-2*g(zvechi)+zvechi);
    k=k+1;
end

z= znou;

end