%conditionare vadermonde
clc;

fprintf('Conditionarea matricei Vandermonde\n');

%punctul a)

fprintf('Punctul a\n');
for n=10:15
    k=1:n;
    t=-1+k*2/n;
    fprintf('cond(vander(t))=%g\n',cond(vander(t)));
end

fprintf('Punctul b\n');
%punctul b)
for n=10:15
    k=1:n;
    t=1./k;
    fprintf('cond(vander(t))=%g\n',cond(vander(t)));
end

% test:
%A = [1 2; 3 4]
% 1/A ce ar insemna
%1./A
%eye(2)/A
