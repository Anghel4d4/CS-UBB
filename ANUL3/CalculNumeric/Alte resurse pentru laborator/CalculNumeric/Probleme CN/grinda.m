%Problema 2.40
for n=3:10
    A = diag(ones(1, n) * 6)+diag(ones(1,n-1)*-4,-1) +diag(ones(1,n-1)*-4,+1)+diag(ones(1,n-2),-2)+diag(ones(1,n-2),2);
    A(1,1:3)=[12,-6,4/3];
    A(n,n-2:n)=[4/3,6,-12];
	%disp(A); 
    x = linspace(-1, 1, n);
    y = (x.^2 - 1)';
    b = A * y;
	try
	    [y1, nIteratii]=rezolvaGaussSeidel2(A,b,1e-2, 100000);
		eroare=norm(y1-y);
		fprintf('Pentru n=%-2d eroarea este %-12g nIteratii = %-5d nr. de conditionare a lui A este %-10g\n',n,eroare,nIteratii, cond(A)); 
	catch err
	    fprintf('Pentru n=%-2d %-43s nr. de conditionare a lui A este %-10g\n',n,'NU CONVERGE', cond(A));
	end
end
%Odata cu cresterea lui n creste si numarul de conditionare a lui A.
%Teoria numarului de conditionare  ne spune ca numarul de conditionare 
%al unei matrici este strans legat de  valoarea eroarii, de aceea
%odata cu cresterea lui n si deci a numarului de conditionare a lui A creste si
%eroarea.