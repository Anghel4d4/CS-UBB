function [radacina, gasitRadacina] = aproximareRadacina(f,xPosibil,ea,er,nmax)

gasitRadacina = 0;%i-a valoarea 1 daca s-a gasit radacina

fder = diff(f,'x');%derivata ecuatiei in functie de x

k=1;
while ( (k < nmax) & (gasitRadacina == 0))
    x=xPosibil;
    xCurent=xPosibil-eval(f)/ eval(fder);
    if norm(xCurent-xPosibil,inf)<ea+er*norm(xCurent,inf)
        gasitRadacina = 1;
        radacina = xCurent;
    end
    xPosibil=xCurent;
    k=k+1;
end
