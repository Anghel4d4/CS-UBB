function omega=relopt(A)
%RELOPT find optimal value of relaxation parameter
%call omega=relopt(A)
M=diag(diag(A)); %find Jacobi matrix
N=M-A;
T=M\N;
if issparse(T)
    e=eigs(T);
else
    e=eig(T);
end
rt=max(abs(e)); %spectral radius of Jacobi matrix
omega=2/(1+sqrt(1-rt^2));