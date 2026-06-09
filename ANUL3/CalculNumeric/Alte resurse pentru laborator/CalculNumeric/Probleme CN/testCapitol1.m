clc

err = abs((atan(pi)-arctangenta(pi))/atan(pi));

err2 = abs((atan(pi/2)-arctangenta(pi/2))/atan(pi/2));

err3 = abs((atan(2*pi)-arctangenta(2*pi))/atan(2*pi));

fprintf('err = %g \n err = %g \n err = %g\n', err, err2,err3)
