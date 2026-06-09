
sist=@(x) [9*x(1).^2+36*x(2).^2+4*x(3).^2-36; x(1).^2-2*x(2).^2-20*x(3); x(1).^2-x(2).^2+x(3).^2];
derr=@(x) [18*x(1), 72*x(2), 8*x(3); 2*x(1), -4*x(2), -20; 2*x(1), -2*x(2), 2*x(3)];
X=[-1,-1,0; 1,-1,0; -1,1,0; 1,1,0]';

z=zeros(3,4);
ni=zeros(1,4);
k=0;

for x0=X
    k=k+1;
    [z(:,k),ni(:,k)] = Newton(sist,derr,x0,errAbs,errRel,itMax);
end
disp(z);
disp(ni);