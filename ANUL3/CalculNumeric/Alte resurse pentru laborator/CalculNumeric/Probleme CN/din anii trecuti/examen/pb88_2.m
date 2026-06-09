function fi=pb88_2(m,L,E)
%  m masa cantileverului
%  L lungimea
%  E modulul de elasticitate
%  I momentul de inertie al sectiunii transversale
%  I = m*L^2 /3

    I=m*L^2/3;
    
    % ne trebuie 2 solutii cu modulele cele mai mici la ecuatia cosh(x)*cos(x)+1=0
    solu=rezolvaNewtonRaphson( @(x) cos(x)*cosh(x)+1, @(x) sinh(x)-cosh(x)*sin(x), 0,300, 1E-30);
    
    b=sort(abs(solu));
    
    
   
   fi(1)=sqrt((E*I*b(1)^4) / (m*L^3)  )/2/pi;
   fi(2)=sqrt((E*I*b(2)^4) / (m*L^3)  )/2/pi;


    
    
    