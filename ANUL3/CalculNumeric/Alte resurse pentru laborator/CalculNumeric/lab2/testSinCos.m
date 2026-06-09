function y = testSinCos
%kk = 10^4:10^2:10^10;
format long
for k = 0:3
    disp(['k = ' num2str(k)]);
    k = 10^2*k+4;
    
    disp (['x = pi/4 + ' num2str(k) '*pi/2']);
    x = pi./ 4 + k*pi./2;
    x = reducereper(x);
    
    s = abs(sinTaylor(x, 1e-16)-sin(x));
    c = abs(cosTaylor(x, 1e-16)-cos(x));
    disp(['mySin(x) - sin(x) = ' num2str(s)])
    disp(['myCos(x) - cos(x) = ' num2str(c)])

    disp (['x = pi/3 + ' num2str(k) '*pi/2']);
    x = pi/3 + k*pi./2;
    x = reducereper(x);

    s = abs(sinTaylor(x, 1e-16)-sin(x));
    c = abs(cosTaylor(x, 1e-16)-cos(x));
    disp(['mySin(x) - sin(x) = ' num2str(s)])
    disp(['myCos(x) - cos(x) = ' num2str(c)])

end