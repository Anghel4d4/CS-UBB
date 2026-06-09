clc

x=0:0.01:10; % pas=0.01
y1=exp(-x.^2);
y2=cos(x)+1;

% plot(x,y1,x,y2)
% legend('f1', 'f2')

tol=1e-6;
f=@(x)exp(-x.^2)-cos(x)-1;
df=@(x)-2.*x.*exp(-x.^2)+sin(x);

plot(x,f(x))

nmax=100;

% Pentru x0=0, metoda lui Newton esueaza din cauza ca derivata in punctul 0
% este egala cu 0 (eroarea rezulta din impartirea la 0).
try
    sol0=rezolvaNewton(f,df,0,tol,nmax) % x0=0
catch e
    disp(e.message)
end

% Pentru x0=1, metoda lui Newton gaseste solutie (sol=9.424777441136147)
% care nu este in intervalul [0,4], din cauza ca tangenta la grafic in
% punctul x0=1 trimite cautarea solutiei in afara intervalului [0,4].
try
    sol1=rezolvaNewton(f,df,1,tol,nmax) % x0=1
catch e
    disp(e.message)
end

% De exemplu, pentru x0=1.5, metoda lui Newton gaseste solutie in
% intervalul [0,4].
sol2=rezolvaNewton(f,df,1.5,tol,nmax) % x0=1.5