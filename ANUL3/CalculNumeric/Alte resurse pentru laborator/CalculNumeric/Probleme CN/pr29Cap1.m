%%  CALCUL NUMERIC - Laborator 1

%   Pavel Livia, grupa 235

%   Problema 1.29. Stim de la Analiza matematica
%   limn→∞(1 +1/n)^n= e:
%   Care este “limita in aritmetica masinii �?? Explicatti

%REZOLVARE

syms n
lim=limit((1 + 1/n)^n, n , Inf)  %limita

% vom incepe cu instructiunea repetitiva de la n=1 pentru ca n nu poate fi 0,


for n=2^52:2^52:2^53


		%Prima valoare pentru care se intampla asta va da (1+1/n)^n=1.
   

fprintf('\neps=%e\n',eps((1+1/n)^n-exp(1)))
fprintf('(1+1/n)^n=%1.4f\n\n',(1+1/n)^n)
    
	
		%  Pentru n> 1/eps avem 1/n=1/(1/eps)=eps  =>  cum limita pentru eps in virgula flotanta este 1
		
		%  Daca luam de exmplu n=2^52 atunci   eps((1+1/(2^52))^(2^52)) = eps(exp(1)) 
		%  pentru n foarte mare 1/n -> 0 =>   limn→∞(1 +1/n)^n = limn→∞(1 +0)^n = 1 => Limita masinii este 1
	
		%  Daca lucaram cu virgula flotanta, atunci 1/n <eps => (1+1/n) va fi 1.
		
		%  Se vede ca eps tinde catre zero pt n mare => (1+1/n)^n -> e
		
		%  nu se poate obtine infinit, pentru ca totdeauna limita masinii va fi 1, dar pentru un n foarte foarte mare
		%  nu va putea fi reprezentat si atunci se va obtine NaN.
	
end

