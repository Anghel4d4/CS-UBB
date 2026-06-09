clc
prag_eroare_permisa = 1e-13;

pas = 0.0001;
offset = 100;

fprintf('verificare pentru valori in [0, 2pi]\n');
medie = 0;
nr = 0;
for x = 0 : pas : 2 * pi
    sinx = sin(x);
    aprox_sinx = aproxSin(x);
    if sinx ~= 0
       nr = nr + 1;
       medie = medie + abs(sinx-aprox_sinx)/abs(sinx); 
    end
end
medie = medie / nr;
fprintf('\tmedia erorilor relative este = %f\n', medie);

fprintf('verificare pentru valori mai mari de 2pi (testeaza aducerea la intervalul [0, 2pi] a algoritmului)\n');
medie = 0;
nr = 0;
for x = offset + 0 : pas : offset + 2 * pi 
    sinx = sin(x);
    aprox_sinx = aproxSin(x);
    if sinx ~= 0
       nr = nr + 1;
       medie = medie + abs(sinx-aprox_sinx)/abs(sinx); 
    end
end
medie = medie / nr;
fprintf('\tmedia erorilor relative este = %f\n', medie);

fprintf('verificare pentru valori mai mari ale lui x\n')
val = 1e13;
medie = 0;
nr = 0;
for x = val - 2 * pi : pas : val
    sinx = sin(x);
    aprox_sinx = aproxSin(x);
    if sinx ~= 0
       nr = nr + 1;
       medie = medie + abs(sinx-aprox_sinx)/abs(sinx); 
    end
end
medie = medie / nr;
fprintf('\tmedia erorilor relative este = %f\n', medie);

fprintf('verificare pentru valori foarte mari ale lui x\n')
max = 1e16;
nr = 0;
medie = 0;
for x = max - 2 * pi : pas : max
    sinx = sin(x);
    aprox_sinx = aproxSin(x);
    if sinx ~= 0
       nr = nr + 1;
       medie = medie + abs(sinx-aprox_sinx)/abs(sinx); 
    end
end
medie = medie / nr;
fprintf('\tmedia erorilor relative este = %f\n', medie);