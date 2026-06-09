disp('My sin with taylor');
sintaylor(pi / 3)
disp('Default sin');
sin(pi / 3)

disp('My cos with taylor');
costaylor(pi / 3 )
disp('Default cos');
cos(pi / 3)

disp('My sin with taylor 10PI');
sintaylor(10 * pi )
disp('**My sinred with taylor 10PI');
sinred(10 * pi)
disp('Default sin 10PI');
sin(10 * pi)

disp('My cos with taylor 10PI');
costaylor(10*pi )
disp('**My cosred with taylor 10PI');
cosred(10 * pi)
%disp('Another cos with taylor 10PI');
%MyCos(10*pi, 0.00001)
disp('Default cos 10PI');
cos(10 * pi)

%pentru 12 pi se observa mai bine diferenta la cos :)


costaylor(10* pi)

