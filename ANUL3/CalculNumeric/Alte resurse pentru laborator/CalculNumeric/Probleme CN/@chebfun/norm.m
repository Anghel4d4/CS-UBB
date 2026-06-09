function normA = norm(A,n)

if nargin==1, n=2; end                  % 2-norm is the default

if isempty(A), normA = 0;               % empty chebfun has norm 0

elseif min(size(A))==1                  % A is a chebfun 
   switch n
      case 1
         absA = abs(A);
         absA.imps = abs(A.imps);
         normA = sum(absA);
      case {2,'fro'}
         if A.trans 
            normA = sqrt(A*A');
         else
            normA = sqrt(A'*A);
         end
      case {inf,'inf'}
         if isreal(A)
             mm = minandmax(A);
             normA = max(mm(2),-mm(1));
         else
            normA = max(abs(A));
         end
      case {-inf,'-inf'}
         normA = min(abs(A));
      otherwise
         error('Unknown norm');
   end

elseif min(size(A))>1                  % A is a quasimatrix
   switch n        
      case 1
         normA = max(sum(abs(A),1));
      case 2
         s = svd(A,0);
         normA = s(1);
      case 'fro'
         % Find integration dimension: 1 if column, 2 if row
         dim = 1 + double(A(1).trans);  
         normA = sqrt( sum( sum(A.*conj(A),dim) ) );
      case {'inf',inf}
         normA = max(sum(abs(A),2));
      otherwise
         error('Unknown norm')
   end
end
normA = real(normA);       % discard possible imaginary rounding errors
