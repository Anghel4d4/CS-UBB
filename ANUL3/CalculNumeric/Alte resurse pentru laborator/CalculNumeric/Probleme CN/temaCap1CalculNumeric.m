%%Problema capitolul 1
%
%Problema 1.29. Stim de la Analiza matematica ca limita cand n-> infinit
%din (1+1/n)^n = e. Care e "limita in aritmetica masinii"? Explicati.
%
%
%Deoarece memoria calculatorului este limitata nu putem memora numere cu o
%precizie imensa dar cu toate acestea in unele domenii este nevoie de o
%foarte mare precizie.
%Aproximarea in virgula flotanta are urmatoarele proprietati
%   - prin folosirea ei se pot reprezenta numere de diferite "magnitutdini"
%   (se pot reprezenta atat numere foarte mici cat si numere foarte mari)
%   -rezultatul multiplicarii numerelor forte mari sau a numerelor foarte
%   mici pastreaza precizia
%Un numar in virgula flotanta se reprezinta sub forma 
% x = (+/-)d0.d1d2....dp-1xBeta^e, 0<=di<beta
%Valoarea lui x este (+/-)(d0 + d1*beta^-1 +...+dp-1*beta^-(p-1))*beta^e
%Unicitatea se asigura prin normalizare: se modifica reprezzentarea astfel
%incat d0<>0.
%Dupa normalizarea semnificantilor ramane un "gol" intre 0 si beta^emin
%Epsilon masina (eps) furizeaza limita superioara a erorii relative cauzata de
%rotunjire in aritmetica in virgula flotanta.
%deoarece eps reprezinta limita superioara a erorii relative cauzata de
%rotunjire rezulta ca exista o valoare p <= eps astfel incat pentru orice err<=p 
%rezulta ca 1 + err = 1
%in cazul numerelor reale limita cand n->infinit (1+1/n)^n = e
%Acest lucru nu mai este valabil in aproximarea in virgula flotanta
%deoarece gasim o valoare (p) pentru 1/n < eps si pentru care 1 + p = 1 iar 1 la orice putere este 1

%deoarece 1/n <= eps => n>=1/eps. 
%desi 1 + eps este foarte apropriat de 1 deoarece acesta se ridica la o
%putere foarte mare pentru n = 1/eps avem (1 + 1/n)^n = e
fprintf('Rezultate obtinute pentru n = 1/eps\n');
n = 1/eps;
valoare = (1 + 1/n)^n
err = exp(1) - valoare; % se observa ca pentru n = 1/eps se obtine chiar e
%prin mai multe incercari am ajuns la concluzia ca daca n = 2/eps
%(1 + 1/n)^n = 1
fprintf('Rezultate obtinute pentru n = 2/eps\n');
n = 2/eps;
valoare1 = (1 + 1/n)^n
%In continuare am incercat sa gasesc primul numar n < eps
%pentru care (1 + 1/n)^n = 1
n1 = 1/eps;
n2 = 1.5/eps;
n3 = 2/eps;
while (1+1/n2)^n2 ~= 1
    if  (1+1/n2)^n2 > 1 
        n1 = n2;
    else
        n3 = n2;
    end
    n2 = (n1 + n3)/2;
end
fprintf('n- ul obtinut de algoritm\n')
fprintf('n     = %f\n', n2)
fprintf('2/eps = %f\n', 2/eps)
%conform celor de mai sus rezulta ca n = 2/eps e primul numar pentru care
%(1 + 1/n)^n = 1
%pentru verificare am testat si pentru n = 2/eps - 1
%si din cate se poate vedea pentru acesta valoarea obtinuta este diferita
%de 1 deci => n = 2/eps e pimul numar pentru care (1 + 1/n)^n = 1
fprintf('Rezultate obtinute pentru n = 2/eps - 1\n')
n = 2/eps-1;
valoare = (1+1/n)^n