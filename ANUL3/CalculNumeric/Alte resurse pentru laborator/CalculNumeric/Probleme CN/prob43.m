n=[10 100 1000];
for i=1:length(n)
    h=1/(n(i)+1);
    A=diag(-(2+h^2)*ones(1,n(i)))+diag(ones(1,n(i)-1),-1)+diag(ones(1,n(i)-1),1);
    b=zeros(n(i),1);
    b(n(i))=-1;
    x0=zeros(n(i),1);
    figure(i)
    hold on
    x=0:h:1;
    y = Gauss(A, b);
    y=[0; y; 1];
    plot(x,y,'r')
    [y,i] = GaussSeidel(A,b,x0,1e-4);
    y=[0; y; 1];
    plot(x,y,'g')
    legend('metoda directa','metoda iterativa')
   
end
