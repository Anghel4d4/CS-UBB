function Grafice
    close all
    clear all
    figure(1)
    hold on
    box on
    subplot(1,2,1);
    x=-5:0.01:5;
    plot(x,f(x,'ex1'),'r')
    subplot(1,2,2)
    x=-1:0.01:1;
    plot(x,f(x,'ex2'),'b')