%exemplul9_5_5
load exemplevp
tol=[1e-3,1e-4,1e-5,1e-10];
for k=1:length(tol)
    [l,it]=QRMethod1(A1,tol(k));
    fprintf('%g & %d & %g & %g & %g \\\\ \n',tol(k),it,l')
end