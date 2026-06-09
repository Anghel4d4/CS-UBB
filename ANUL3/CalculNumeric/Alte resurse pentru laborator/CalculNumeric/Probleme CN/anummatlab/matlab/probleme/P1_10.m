function P1_10
%P1_10 subdivizarea recursiva a unui triunghi
%dupa mijloace

%x,y - coordonatele varfurilor
%lx,ly - coordonatele punctelor
%niv - nivel de subdivizare
[x,y]=ginput(3);
niv=input('nivel de subdivizare: ');
[lx,ly]=subdivizare(x,y,niv);
T=delaunay(lx,ly);
triplot(T,lx,ly)