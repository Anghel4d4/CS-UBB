function z=num2float(x)
    y=num2hex(x);
    z=[];
    for i=1:length(y)
        d=dec2bin(hex2dec(y(i)));
        z=[z repmat('0', 1, 4-length(d)) d];
    end
    
    if isa(x, 'single')
        z=[z(1) '|' z(2:9) '|' z(10:end)];
    else
        z=[z(1) '|' z(2:12) '|' z(13:end)];
    end
   