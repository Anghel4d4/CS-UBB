function [x,y,nfev]=Runge_Kutta(f,tspan,y0,N,BT)
%metoda Runge-Kutta cu pas constant
%apel [t,y,nfev]=Runge_Kutta(f,tspan,y0,N,BT)
%f -functia din membrul drept
%tspan - intervalul [a,b]
%y0 - valoarea de pornire
%N - numarul de pasi
%BT - procedura care furnizeaza tabela Butcher sub forma
%        [lambda,alfa,mu,s] - s numarul de stadii
%t -abscisele
%y ordonatele componentelor
%nfev - numarul de evaluari de functii

[lambda,alfa,mu,r]=BT(); %initializare tabela Butcher
h=(tspan(end)-tspan(1))/N; %lungime pas
xc=tspan(1); yc=y0(:); 
x=xc; y=yc';
K=zeros(length(y0),r);
for k=1:N %iteratia RK
    K(:,1)=f(xc,yc);
    for i=2:r
        K(:,i)=f(xc+mu(i)*h,yc+h*(K(:,1:i-1)*lambda(i,1:i-1)'));
    end
    yc=yc+h*(K*alfa);
    xc=xc+h; %pregatesc iteratia urmatoare
    x=[x;xc]; y=[y;yc'];
end
if nargout==3
    nfev=r*N;
end
