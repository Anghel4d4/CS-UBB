clc

f=@(x)(1/2)*x.^2+x+1-exp(x);
df=@(x)x+1-exp(x);

x=0:0.001:1; % pas=0.001

% plot(x,f(x))

% plot(x,exp(x),x,(1/2)*x.^2+x+1)
% legend('exp','parab')

tol=1e-6;
nmax=100;
x0=1;

[sol,nit,istorie]=rezolvaNewton(f,df,x0,tol,nmax); % x0=1

sol
nPasi=length(istorie)
% istorie

% Pentru x0=1, convergenta prin metoda lui Newton se realizeaza in 32 pasi.
% Convergenta algoritmului este ilustrata in grafic.

plot(x,f(x),'-b',x,zeros(length(x)),'-g')
xlim([0,0.25])
% ylim([-0.25,0.05])
hold on

for i=1:length(istorie)-1
    plot(istorie(i:i+1),[f(istorie(i)),0],'-r')
end