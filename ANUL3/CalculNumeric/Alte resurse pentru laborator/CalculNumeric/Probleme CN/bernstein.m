clc;
for m=3:3:12
    mm=m+1;
    A=zeros(mm,mm);
    for i=1:mm
        for j=1:mm
            coef=nchoosek(mm,i)*nchoosek(mm,j);
            x=i+j;
            y=2*mm-i-j;
            beta=prod(1:x-1)*prod(1:y-1)/prod(1:x+y-1);
            A(i,j)=coef*beta;
        end
    end    
    b=1/mm*ones(mm,1);%a se vedea calculele in 3.63.pdf
    fprintf('Pentru m=%-2d o aproximare a numarul de conditionare a lui A=%-2d \n',m,cond(A)); 
    a=A\b
end