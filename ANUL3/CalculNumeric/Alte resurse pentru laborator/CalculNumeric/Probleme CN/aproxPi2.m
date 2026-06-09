function rez = aproxPi2 (eroare)
    rezVechi=aproxPi(1);
    rez=aproxPi(2);
    n=3;
    while rezVechi-rez > eroare 
        rezVechi=rez;
        rez=aproxPi(n);
        n=n+1;
    end
end