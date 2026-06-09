%fct x, y, yy <- (vector)
function A = name5(X,Y,YY)
m = length(X)
z = zeros(1,2*m);
Z(2:2:2*m) = X;
Z(1:2:2*m-1) = X;
A = zeros(2*m,2*m);
A(2:2:2*m,1) = Y'; %par
A(1:2:2*m-1,1) = Y'; %par
A(1:2:2*m-1,2) = YY'; %impar
%A(1:2:2m,2) = YY'
    for i = 2:2:2*m-2
        for j = 3:2*m
            for i=1:2*m-j+1
            A(i,j) = [A(i+1,j-1)-A(i,j-1)]/[Z(i+j-1) - Z(i)];
            end
        end
    end
    