function [x,y] = probl_bilocala(a,b,N,alfa,beta,p,q,r)
    h=(b-a)/(N+1);
    x=zeros(1,N);
    for i=1:N
       x(i)=a+i*h; 
    end
    A=zeros(N);
    for i=1:N
        if i-1>0 
            A(i,i-1)=2+h*p(x(i));
        end
        A(i,i)=-4-2*h^2*q(x(i));
        if i+1<=N
            A(i,i+1)=2-h*p(x(i));
        end
    end
    b1=[2*h^2*r(x(1))-alfa*(2+h*p(x(1)));zeros(N-2,1);2*h^2*r(x(N))-beta*(2-h*p(x(N)))];
    y=[alfa;rezolvaLUP(A,b1);beta];
    x=[a,x,b];