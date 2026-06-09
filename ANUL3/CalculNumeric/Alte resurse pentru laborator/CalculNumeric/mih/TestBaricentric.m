% function TestBaricentricSiNewton()
close all
%metodele Baricentrice si a lui Newton, pt polinomul de interpolare LaGrange
	m=10;
	k=0:m;
	
	%nodurile Cebisev de speta a II-a
	x = pi*cos(k*pi/m);
	%valorile functiei in aceste noduri
  %f = 1./(1+25.*x.^2);
    f = cos(10*x) + sin(sqrt(3)*x);
	
	xg = linspace(-pi, pi, 500);%-1:0.004:1;
	%valorile functiei in nodurile xg
% 	fg = (1+25*xg.^2).^(-1);
    %fg = cos(10*xg) + sin(sqrt(3)*xg);
	%valorile in care se calculeaza valoarea polinomului
	ta=pi*(-1:0.01:1);

  %metoda lui hermite
  fd=-10*sin(10*xg)+sqrt(3)*cos(sqrt(3)*xg);
  N=Hermite(x,f,fd);
  %plot(xg,f,N,ta);
	%metoda lui Newton
	%td = difdiv(x,f);
 	%N = metNewton(x,ta,td)
	
	%poti scoate plot, ca sa vezi in consola, doar valorile lui N
 	%plot(x,f,'o',xg,fg,'g',ta,N,'-.');
   %  title('Metoda lui Newton')
   
	%B = metBaricentrica(x,f,xg);
   % figure
	
	%poti scoate plot, ca sa vezi in consola, doar valorile lui B
	  %plot(xg,fg,xg,B,'-.');
    %title('Metoda Baricentrica')
     
    %figure(2)
    %plot(xg, abs(fg-B))
    %norm(fg-B, inf)
% end