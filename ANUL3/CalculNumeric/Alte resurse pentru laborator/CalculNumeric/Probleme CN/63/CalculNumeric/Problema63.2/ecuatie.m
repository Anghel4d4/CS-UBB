
function radacini = ecuatie(f,xPosibil,ea,er,nmax)


gasitRadacina = 0;%variabila auxiliara, i-a valoarea 1 daca s-a gasit radacina

[radacina1,gasitRadacina]=aproximareRadacina(f,xPosibil,ea,er,nmax);

if (gasitRadacina == 0)
    error('S-a depasit numarul maxim de iteratii');
    return;
end

%am gasit o radacina reala
%o caut pe a doua
%noua ecuatie este f/(x-radacina)
syms x;
f = f/(x-radacina1);

[radacina2,gasitRadacina]=aproximareRadacina(f,xPosibil,ea,er,nmax);

if (gasitRadacina == 0)
    error('S-a depasit numarul maxim de iteratii');
    return;
end



%cautam radacinile complexe
f = f/(x-radacina2);
xPosibil = i;

[radacina3,gasitRadacina]=aproximareRadacina(f,xPosibil,ea,er,nmax);

if (gasitRadacina == 0)
    error('S-a depasit numarul maxim de iteratii');
    return;
end



%radacina trei fiind numar complex => si conjugata sa este solutie
radacina4 = -radacina3;

radacini = [radacina1, radacina2, radacina3, radacina4];
