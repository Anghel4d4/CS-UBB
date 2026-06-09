function [X, final] = newton(f, j, epsilon, x0, nIt)
iIt = 0;
final=0;
X=[];
while (iIt < nIt)
    x1 = x0 - ( inv( feval( j, x0 ) ) * feval( f, x0 )' )';
    if abs(x1 - x0) < epsilon
        X = x1;
        final = iIt;
        return
    end
    iIt = iIt + 1;
    x0 = x1;
end
final = nIt;