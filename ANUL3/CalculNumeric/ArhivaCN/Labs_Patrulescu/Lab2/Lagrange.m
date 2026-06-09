function Lagrange
    close all
    clear all
    x=-100:0.5:100
    z=-100:0.05:100;
    L=LagrangeClasic(z,x)
    figure(1)
    hold on
    for i=1:length(x)
        plot(z,L(i,:),'b')
    end
    plot(x,zeros(1,length(x)),'r*')