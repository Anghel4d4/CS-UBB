function [  ] = rezolva( l )

    x=0:.01:10/l;
    plot(x, cot(l*x), 'r', x,(x.^2-1)/2./x, 'b');
    ylim([-5, 5])
    legend('cot', 'fractie')

    f = @(x) cot(l*x) - (x^2-1)/2/x;
    
    % constante determinate experimental pentru valori mici ale lui l :)
    fprintf('prima radacina: %f \n', rezolvaSecanta(f, 1/l, 2/l, 1e-6))
    fprintf('a doua radacina: %f \n', rezolvaSecanta(f, 3.2/l, 4.2/l, 1e-6))
    fprintf('a treia radacina: %f \n', rezolvaSecanta(f, 6.4/l, 7/l, 1e-6))

end

