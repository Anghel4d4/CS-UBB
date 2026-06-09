function fiMinime=determinaSecvente()

    %calculam volumul
    latimea=0.0025;
    lungimea=0.9;
    inaltimea=0.025;
    volum=latimea*lungimea*inaltimea;
    %folosim formula densitate = masa / volum
    masa=7850/volum;
    %din enunt avem valoarea modulului de elasticitate
    E=200;
    %momentul de inertie al sectiunii transversale se calculeaza cu formula masa*(lungime^2)
    I=masa*(lungimea^2);
    
    %calculam folosind metoda Newton-Raphson 2 cele mai mici secvente
    f = @(x) cos(x)*cosh(x)+1; % ecuatia de secventa
    fd = @(x) sinh(x)-cosh(x)*sin(x); % derivata ecuatiei de secventa
    vectorDeSol=aplicaRN(f , fd, 1,400, 1E-40);
    %obtinem rezultatele intr-un vector, dupa care luam cele mai mici 2
    valMinime=sort(abs(vectorDeSol));  
    % din formula bi^4=((2pi*fi)^2)*(mL^3/EI) scoate pe fi:
    fiMinime(1)=sqrt((E*I*valMinime(1)^4)/(masa*lungimea^3))/2/pi;
    fiMinime(2)=sqrt((E*I*valMinime(2)^4)/(masa*lungimea^3))/2/pi;


    
    