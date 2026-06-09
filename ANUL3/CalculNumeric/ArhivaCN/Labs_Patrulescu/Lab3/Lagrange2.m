function Lagrange2
     n=15
    x= 5*cos((2*(1:n)-1)*pi/(2*n));
    z=-5:0.05:5
    for k=1:length(z)
        for i=1:n
            P(i)=1;N(i)=1;
            for j=1:n
                if i~=j
                    P(i)=P(i).*(x(i)-x(j));
                    N(i)=N(i).*(z(k)-x(j));
                end
            end
            L(i,k)=N(i)/P(i);
        end
    end
    
    figure(1)
    hold on
    plot(x,zeros(1,n),'r*')
    plot(z,L(1:n,:),'b')