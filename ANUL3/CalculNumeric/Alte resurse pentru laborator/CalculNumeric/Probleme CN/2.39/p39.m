n=5:5:30;
nrIter=zeros(1,length(n));
for i=1:length(n)
    [A,b]=sistemul(n(i));
    x0=zeros(n(i),1);
    [~,ni]=Jacobi(A,b,x0,1e-4,100);
    nrIter(i)=ni;
end    
fprintf('    n     number of iterations\n')
disp([n',nrIter'])