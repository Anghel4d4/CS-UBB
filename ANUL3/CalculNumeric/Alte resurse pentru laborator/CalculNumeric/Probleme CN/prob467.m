format long
[Q,fcount] = adquad(@fun,-1,1,1e-3);
fprintf('Pt precizia tol=%f avem nr de evaluari %d.\n',1e-3,fcount)


[Q,fcount] = adquad(@fun,-1,1,1e-5);
fprintf('Pt tol=%f avem nr de evaluari %d.\n',1e-5,fcount)

%numarul de evaluari creste cu descresterea tolerantei