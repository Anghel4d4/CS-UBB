%folosim formula de cuadratura a lui Gauss-Legendre cu 2 noduri 
I1 = 0.01*(log(0.01)-1); %valoarea integralei de la 0 la 0.01

a = 0.01; 
b = 0.2;
x1 = (a+b)/2-(b-a)*sqrt(3)/6;
x2 = (a+b)/2+(b-a)*sqrt(3)/6;
I2 = (b-a)/2*(f(x1)+f(x2)); %aproximarea valorii integralei de la 0.01 la 0.2

a = 0.2;
b = pi/2;
x1 = (a+b)/2-(b-a)*sqrt(3)/6;
x2 = (a+b)/2+(b-a)*sqrt(3)/6;
I3 = (b-a)/2*(f(x1)+f(x2)); %aproximarea valorii integralei de la 0.2 la pi/2

I = I1 + I2 + I3
quad(@f,0,pi/2) %aproximarea integralei cu o functie matlab (pentru verificare)
