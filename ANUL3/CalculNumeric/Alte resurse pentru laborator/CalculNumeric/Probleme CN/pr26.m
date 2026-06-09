format short e
n=10;
i=1;
cond=zeros(1,3);
while n<41
H=hilb(n);
Hinv=invhilb(n);
Heig=eig(H);
Hinveig=eig(Hinv);
cond(i)=max(Heig)*max(Hinveig);
n=2*n;
i=i+1;
end
%(b)
fprintf('Pt n=10 cond(H_10)=%1.2d\n',cond(1))
fprintf('Pt n=20 cond(H_20)=%1.2d\n',cond(2))
fprintf('Pt n=40 cond(H_40)=%1.2d\n',cond(3))
