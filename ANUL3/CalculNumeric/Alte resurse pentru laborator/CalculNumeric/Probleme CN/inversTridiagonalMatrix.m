%fucntia calculeaza inversa unei matrici tridiagonale
function x = inversTridiagonalMatrix(A)
[n, n] = size(A);
I = eye(n); %identity matrix
x=GaussTridiagonal(A,I);