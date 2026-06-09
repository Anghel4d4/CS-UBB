function fi=pb88_2(m,L,E)
%  m masa cantileverului
%  L lungimea
%  E modulul de elasticitate
%  I momentul de inertie al sectiunii transversale
%  I = m*L^2 /3

    I=m*L^2/3;
    
    % ar trebui gasite 2 solutii cu modulele cele mai mici la ecuatia cosh(x)*cos(x)+1=0
    % cum nu am reusit scot toate solutiile, voi folosi solve care da
    % solutia negativa cu cel mai mic modul
    b=solve('cosh(x)*cos(x)+1=0');
    
    fi=sqrt(b^4*E*I)/(m*L^3*4*pi);
    
    %rezolvarea problemei:
    %v=0.9*0.0025*0.025;
    %m=7850/v;
    %L=0.9;
    %E=200;
    %fi=pb88_1(m,L,E);
    
    
    