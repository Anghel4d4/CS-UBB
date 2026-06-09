t=0:0.1:1;
c=zeros(1,length(t)-1);
s=zeros(size(c));
for i=1:length(t)-1
    c(i)=Romberg(@fc,t(i),t(i+1),1e-5,50);
    s(i)=Romberg(@fs,t(i),t(i+1),1e-5,50);
end
c=cumsum(c);
s=cumsum(s);
t=0.1:0.1:1;
format long
fprintf('      t                   c(t)                 s(t)\n')
disp([t' c' s'])