% calcul epsilon-masina
x=1.0;
prec=1;
% construim un sir care converge crescator la 2, de ex
% x_{n+1}=(x_n)/2 + 1
% epsilon-masina va fi diferenta dintre 2 si ultimul termen al sirului care
% nu are acceasi reprezentare ca si 2.
while x<2
    prec=2-x;
    x=x/2+1.0;
end
display(prec);
prec-eps

%calcul cel mai mic numarul nenormalizat reprezentabil
y=1;
min1=1;
while y>0
    min1=y;
    y=y/2;
end
display(min1)
min1-realmin