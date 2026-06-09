x=[0, pi/6, pi/4, pi/3, pi/2, 2*pi];
y=sin(x);

v=lagr(x,y, pi/7);

err=1/factorial(5) * abs (prod(pi/7-x)); % scade din pi/7 fiecare element din x, apoi inmulteste elementele lui x


t=linspace(0,2*pi,200);
v = lagr(x,y,t);

%estimarea nostra si functia
plot(x,y, 'o', t, sin(t), t,v);
legend('noduri','f', 'L_{m}f', 'Location','best')

%eroare
figure
plot(t, abs(v-sin(t)));


