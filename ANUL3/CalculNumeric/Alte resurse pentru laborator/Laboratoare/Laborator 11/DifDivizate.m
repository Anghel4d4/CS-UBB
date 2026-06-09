function td=DifDivizate(x,f);
%DIFDIV - obtine tabela diferentelor divizate
%apel td=difdiv(x,f);
%x - nodurile
%f- valorile functiei
%td - tabela diferentelor divizate

lx=length(x);
td=zeros(lx,lx);
td(:,1)=f'
for j=2:lx
   td(1:lx-j+1,j)=diff(td(1:lx-j+2,j-1))./(x(j:lx)-x(1:lx-j+1))';
end
