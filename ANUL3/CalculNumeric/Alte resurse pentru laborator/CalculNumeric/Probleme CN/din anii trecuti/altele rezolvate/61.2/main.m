function main
%calculeaza un spline cubic pt problema titrarii potentiometrice pt date
%precizate si reprezinta grafic spline-ul pe un interval dat

x=[1 5 10 15 20 21 22 22.5 22.6 22.7 22.8 22.9 23 23.1 23.2 23.3];
f=[373 415 438 459 491 503 523 543 550 557 565 575 590 620 860 915];
v=linspace(0,24,100);

clf;
hold on;
%reprez grafica a spline-ului
plot(x,f,'ro')

%aplic spline cubic natural, s-a folosit spline natural deoarece are 
%nevoie doar de valori ale lui f si nu ale derivatelor, dezavantajul este
%insa degradarea preciziei in vecinatatea capetelor
[a b c d]=Splinecubic(x,f,2);
r=valspline(x,a,b,c,d,v);
%reprez grafica a spline-ului
plot(v,r,'b:');

%se observa din reprezentarea grafica a functiei si a spline-ului
%ca in ambele cazuri apare un punct de inflexiune
legend('functia','spline cubic natural',-1);
